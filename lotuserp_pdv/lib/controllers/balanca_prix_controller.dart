import 'dart:async';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:usb_serial/transaction.dart';

import '../services/dependencies.dart';

class BalancaPrix3FitController extends GetxController {
  var pesoLido = "".obs;
  UsbPort? port;
  StreamSubscription<Uint8List>? subscription;
  Transaction<String>? transaction;
  UsbDevice? device;
  Logger logger = Logger();
  Timer? timer;
  bool pesagemConcluida = false;
  bool isListening = false;

  var configController = Dependencies.configcontroller();
  TextFieldController textFieldController = Dependencies.textFieldController();
  Completer<bool> balancaConectadaCompleter = Completer<bool>();

  // Detecta a balança no USB
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

      // Verifica se existe algum dispositivo USB conectado
      List<UsbDevice> devices = await UsbSerial.listDevices();
      logger.i("Dispositivos USB encontrados: ${devices.length}");
      if (devices.isNotEmpty) {
        for (UsbDevice device in devices) {
          if (device.productName == "USB2.0-Ser!") {
            logger.i("Tentando conectar ao dispositivo: ${device.productName}");
            await _connectToBalanca(device);
            bool sucessoNaConexao = await balancaConectadaCompleter.future;
            if (sucessoNaConexao) {
              _iniciarEscutaDados(); // Chama _iniciarEscutaDados somente após a conexão bem-sucedida
            }
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

  // Conecta a balança
  Future<bool> _connectToBalanca(UsbDevice device) async {
    try {
      port = await device.create();
      if (!await port!.open()) {
        pesoLido.value = "Falha na abertura da porta";
        logger.e("Falha ao abrir a porta USB");
        if (!balancaConectadaCompleter.isCompleted) {
          balancaConectadaCompleter.complete(false);
        }
        return false;
      }

      // Configura os parâmetros da porta
      port!.setDTR(true);
      port!.setRTS(true);
      port!.setPortParameters(
          int.parse(textFieldController.velocidadeBalancaController.text),
          UsbPort.DATABITS_8,
          UsbPort.STOPBITS_1,
          UsbPort.PARITY_NONE);

      // Inicia o Timer para enviar solicitação de peso a cada segundo
      timer = Timer.periodic(
          const Duration(seconds: 1), (Timer t) => _solicitarPeso());

      logger.i("Conexão estabelecida com sucesso");
      if (!balancaConectadaCompleter.isCompleted) {
        balancaConectadaCompleter
            .complete(true); // Completa com true se a conexão for bem-sucedida
      }
      return true;
    } catch (e) {
      pesoLido.value = "Erro na conexão com a balança: $e";
      logger.e("Erro na conexão com a balança: $e");
      await Future.delayed(const Duration(seconds: 2));
      if (!balancaConectadaCompleter.isCompleted) {
        balancaConectadaCompleter.complete(false);
      }
    }

    return false;
  }

  void _iniciarEscutaDados() async {
    // Verifica se já está ouvindo os dados para evitar múltiplas escutas
    if (!isListening && port != null && await port!.open()) {
      isListening = true; // Marca que a escuta foi iniciada
      subscription = port!.inputStream!.listen((Uint8List data) {
        String dataAsString = String.fromCharCodes(data);
        logger.i("Dados brutos recebidos: $dataAsString");

        if (!pesagemConcluida && dataAsString.isNotEmpty) {
          pesoLido.value = dataAsString;
          pararPesagem();
        }
      }, onDone: () {
        // Quando a stream é finalizada, marcar isListening como false
        isListening = false;
      }, onError: (e) {
        // Em caso de erro, também marcar isListening como false
        isListening = false;
      });
    }
  }

  void _solicitarPeso() async {
    // ENQ - Caracter ASCII (05H)
    try {
      if (!pesagemConcluida && port != null && await port!.open()) {
        port!.write(Uint8List.fromList([0x05]));
        logger.i("Solicitando peso à balança");
      }
    } catch (e) {
      logger.e('Falha ao solicitar o peso à balança: $e.toString()');
    }
  }

  void pararPesagem() {
    pesagemConcluida = true;
    if (subscription != null) {
      subscription!.cancel(); // Cancela a subscrição antes de definir como nula
      subscription = null;
    }
    port?.close();
    port = null;
    isListening = false; // Marca que a escuta foi encerrada
  }

  void reiniciarBalanca() {
    pesagemConcluida = false;
    pesoLido.value = "";
    timer?.cancel();
    subscription?.cancel();
    port?.close();
    port = null;
  }

  @override
  void onClose() {
    pararPesagem();
    port?.close();
    logger.i("Encerrando conexão com a balança");
    super.onClose();
  }
}
