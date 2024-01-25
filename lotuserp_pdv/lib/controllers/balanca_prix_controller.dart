import 'dart:async';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:usb_serial/usb_serial.dart';

import '../services/dependencies.dart';

class BalancaPrix3FitController extends GetxController {
  var pesoLido = "".obs;
  UsbPort? port;
  StreamSubscription<Uint8List>? subscription;
  UsbDevice? device;
  Logger logger = Logger();
  Timer? timer;
  bool pesagemConcluida = false;
  bool isListening = false;

  var configController = Dependencies.configcontroller();
  TextFieldController textFieldController = Dependencies.textFieldController();
  Completer<bool> balancaConectadaCompleter = Completer<bool>();

  Future<void> detectBalanca() async {
    pesagemConcluida = false;
    timer?.cancel();
    subscription?.cancel();
    port?.close();
    port = null;

    try {
      balancaConectadaCompleter = Completer<bool>();
      UsbSerial.usbEventStream!.listen((UsbEvent event) async {
        if (event.event == UsbEvent.ACTION_USB_ATTACHED &&
            event.device!.productName == "USB2.0-Ser!") {
          await _connectToBalanca(event.device!);
        }
      });

      List<UsbDevice> devices = await UsbSerial.listDevices();
      logger.i("Dispositivos USB encontrados: ${devices.length}");
      if (devices.isNotEmpty) {
        for (UsbDevice device in devices) {
          if (device.productName == "USB2.0-Ser!") {
            logger.i("Tentando conectar ao dispositivo: ${device.productName}");
            await _connectToBalanca(device);
          }
        }
      } else {
        if (!balancaConectadaCompleter.isCompleted) {
          balancaConectadaCompleter.complete(false);
        }
      }
    } catch (e) {
      logger.e(e.toString());
      balancaConectadaCompleter.complete(false);
    }
  }

  Future<bool> _connectToBalanca(UsbDevice device) async {
    try {
      port = await device.create();
      if (!await port!.open()) {
        pesoLido.value = "Falha na abertura da porta";
        logger.e("Falha ao abrir a porta USB");
        return false;
      }

      port!.setDTR(true);
      port!.setRTS(true);
      port!.setPortParameters(
          int.parse(textFieldController.velocidadeBalancaController.text),
          UsbPort.DATABITS_8,
          UsbPort.STOPBITS_1,
          UsbPort.PARITY_NONE);

      logger.i("Conexão estabelecida com sucesso");
      return true;
    } catch (e) {
      pesoLido.value = "Erro na conexão com a balança: $e";
      logger.e("Erro na conexão com a balança: $e");
      await Future.delayed(const Duration(seconds: 2));
      return false;
    }
  }

  Future<void> iniciarEscutaDados() async {
    reiniciarBalanca();

    if (port != null) {
      // Redefinindo pesoLido antes de começar a escutar

      _iniciarEscutaDados();
      timer = Timer.periodic(
          const Duration(seconds: 1), (Timer t) => _solicitarPeso());
    }
  }

  void _iniciarEscutaDados() async {
    isListening = true;
    try {
      subscription = port!.inputStream!.listen((Uint8List data) {
        String dataAsString = String.fromCharCodes(data).trim();
        logger.i("Dados brutos recebidos: $dataAsString");
        pesoLido.value = '00.000';
        if (!pesagemConcluida && dataAsString.isNotEmpty) {
          String output = dataAsString.replaceAll(RegExp(r'[^0-9]'), '');
          double peso = double.tryParse(output) ?? 0;
          if (peso / 1000 > 00.010) {
            pesoLido.value = dataAsString;
          } else {
            pesoLido.value = "00.000";
          }
          pararPesagem();
        }
      }, onDone: () {
        isListening = false;
      }, onError: (e) {
        isListening = false;
      });
    } catch (e) {
      pesoLido.value = "00.000";
    }
  }

  void _solicitarPeso() async {
    try {
      if (!pesagemConcluida && port != null && await port!.open()) {
        port!.write(Uint8List.fromList([0x05]));
        logger.i("Solicitando peso à balança");
      }
    } catch (e) {
      logger.e('Falha ao solicitar o peso à balança: $e');
    }
  }

  void pararPesagem() {
    pesagemConcluida = true;
    subscription?.cancel();
    subscription = null;
    isListening = false;
  }

  void limparBufferEntrada() async {
    if (port != null) {
      while (await port!.inputStream!.isEmpty == false) {
        port!.inputStream!.listen((data) {}).cancel();
      }
    }
  }

  void reiniciarBalanca() {
    pesagemConcluida = false;
    timer?.cancel();
    isListening = false;
    limparBufferEntrada();
  }

  @override
  void onClose() {
    pararPesagem();
    port?.close();
    logger.i("Encerrando conexão com a balança");
    super.onClose();
  }
}
