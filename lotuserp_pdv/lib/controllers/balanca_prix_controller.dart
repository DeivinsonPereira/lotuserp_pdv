import 'dart:async';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:usb_serial/transaction.dart';

class BalancaPrix3FitController extends GetxController {
  var pesoLido = "".obs;
  UsbPort? port;
  StreamSubscription<Uint8List>? subscription;
  Transaction<String>? transaction;
  UsbDevice? device;
  Logger logger = Logger();
  Timer? timer;

  // Detecta a balança no USB
  Future<void> detectBalanca() async {
    UsbSerial.usbEventStream!.listen((UsbEvent event) async {
      if (event.event == UsbEvent.ACTION_USB_ATTACHED) {
        await _connectToBalanca(event.device!);
      }
    });

    // Verifica se existe algum dispositivo USB conectado
    List<UsbDevice> devices = await UsbSerial.listDevices();
    logger.i("Dispositivos USB encontrados: ${devices.length}");
    for (UsbDevice device in devices) {
      logger.i("Tentando conectar ao dispositivo: ${device.productName}");
      await _connectToBalanca(device);
    }
  }

  // Conecta a balança
  Future<bool> _connectToBalanca(UsbDevice device) async {
    try {
      port = await device.create();
      if (!await port!.open()) {
        pesoLido.value = "Falha na abertura da porta";
        logger.e("Falha ao abrir a porta USB");
        return false;
      }

      // Configura os parâmetros da porta
      port!.setDTR(true);
      port!.setRTS(true);
      port!.setPortParameters(
          9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

      _iniciarEscutaDados();

      // Inicia o Timer para enviar solicitação de peso a cada segundo
      timer = Timer.periodic(
          const Duration(seconds: 1), (Timer t) => _solicitarPeso());

      logger.i("Conexão estabelecida com sucesso");
      return true;
    } catch (e) {
      pesoLido.value = "Erro na conexão com a balança: $e";
      logger.e("Erro na conexão com a balança: $e");
      return false;
    }
  }

  void _iniciarEscutaDados() {
    // Ajustar aqui se a terminação de linha for diferente
    transaction = Transaction.stringTerminated(
        port!.inputStream!, Uint8List.fromList([13, 10]));

    subscription = port!.inputStream!.listen((Uint8List data) {
      logger.i("Dados brutos recebidos: ${String.fromCharCodes(data)}");
      pesoLido.value = String.fromCharCodes(data);
    });

    subscription = transaction!.stream.listen((String line) {
      if (line.isNotEmpty) {
        // Processa e exibe os dados recebidos
        pesoLido.value = "Peso lido: $line";
        logger.i("Dados processados: $line");
      }
    }, onError: (error) {
      logger.e("Erro na escuta dos dados: $error");
    }) as StreamSubscription<Uint8List>?;
  }

  void _solicitarPeso() {
    // ENQ - Caracter ASCII (05H)
    port!.write(Uint8List.fromList([0x05]));
    logger.i("Solicitando peso à balança");
  }

  @override
  void onClose() {
    subscription?.cancel();
    port?.close();
    timer?.cancel();
    logger.i("Encerrando conexão com a balança");
    super.onClose();
  }
}
