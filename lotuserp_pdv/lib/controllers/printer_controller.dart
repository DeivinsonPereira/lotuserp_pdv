import 'package:flutter_simple_bluetooth_printer/flutter_simple_bluetooth_printer.dart';
import 'package:get/get.dart';

class PrinterController extends GetxController {
  var bluetoothManager = FlutterSimpleBluetoothPrinter.instance;
  var devices = <BluetoothDevice>[].obs;
  final isScanning = false.obs;
  final isBle = true.obs;
  final isConnected = false.obs;

  BluetoothDevice? selectedPrinter;

  //procura os dispositivos no bluetooth
  void _scan() async {
    devices.clear();

    try {
      isScanning.value = true;
      if (isBle.value) {
        final results =
            await bluetoothManager.scan(timeout: const Duration(seconds: 10));
        devices.addAll(results);
      } else {
        final bondedDevices = await bluetoothManager.getAndroidPairedDevices();
        devices.addAll(bondedDevices);
      }
    } on BTException catch (e) {
      print(e);
    } finally {
      isScanning.value = false;
    }
  }

  //atualiza os dispositivos
  void updateDevices() {}

  void selectDevice(BluetoothDevice device) async {
    if (selectedPrinter != null) {
      if (device.address != selectedPrinter!.address) {
        await bluetoothManager.disconnect();
      }
    }
    selectedPrinter = device;
  }

  void _print2X1() async {
    if (selectedPrinter == null) return;
    const codes =
        "^XA\r\n^MMT\r\n^PW384\r\n^LL0253\r\n^LS0\r\n^BY2,3,81^FT375,92^BCI,,N,N\r\n^FDILP-107661^FS\r\n^FT375,191^A0I,45,45^FH\\^FDILP-107661^FS\r\n^FT374,27^A0I,23,24^FH\\^FD^FS\r\n^FT372,59^A0I,23,24^FH\\^FD^FS\r\n^PQ1,0,1,Y^PQ1^XZ\r\n";

    try {
      await _connectDevice();
      if (!isConnected.value) return;
      final isSuccess = await bluetoothManager.writeText(codes);
      if (isSuccess) {
        await bluetoothManager.disconnect();
      }
    } on BTException catch (e) {
      print(e);
    }
  }

  _connectDevice() async {
    if (selectedPrinter == null) return;
    try {
      isConnected.value = await bluetoothManager.connect(
          address: selectedPrinter!.address, isBLE: selectedPrinter!.isLE);
    } on BTException catch (e) {
      print(e);
    }
  }
}
