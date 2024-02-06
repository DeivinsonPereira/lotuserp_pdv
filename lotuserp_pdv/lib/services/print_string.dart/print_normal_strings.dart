import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../controllers/config_controller.dart';

class PrintNormalStrings {
  Configcontroller configController = Dependencies.configcontroller();

  var platform = const MethodChannel('com.lotuserp_pdv/tef');

  Logger logger = Logger();

  String? texto;

  //Impressão teste
  Future<void> imprimirTeste({String? texto}) async {
    try {
      await configController.loadSizePrinter();

      await platform.invokeMethod("imprimirTeste", {'texto': texto});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }

  //Impressão abertura de caixa
  Future<void> imprimirOpenRegister(
      String texto1,
      String texto2,
      String texto3,
      String texto4,
      String texto5,
      String texto6,
      String texto7,
      String texto8,
      String texto9) async {
    try {
      await platform.invokeMethod("imprimirOpenRegister", {
        'texto1': texto1,
        'texto2': texto2,
        'texto3': texto3,
        'texto4': texto4,
        'texto5': texto5,
        'texto6': texto6,
        'texto7': texto7,
        'texto8': texto8,
        'texto9': texto9
      });
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }

  //Impressão movimentação de caixa
  Future<void> imprimirMovimentRegister(
      String texto1,
      String texto2,
      String texto3,
      String texto4,
      String texto5,
      String texto6,
      String texto7,
      String texto8,
      String texto9) async {
    try {
      await platform.invokeMethod("imprimirMovimentRegister", {
        'texto1': texto1,
        'texto2': texto2,
        'texto3': texto3,
        'texto4': texto4,
        'texto5': texto5,
        'texto6': texto6,
        'texto7': texto7,
        'texto8': texto8,
        'texto9': texto9
      });
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }

  //Impressão fechamento de caixa
  Future<void> imprimirCloseRegister(String texto1,
      String texto2,
      String texto3,
      String texto4,
      String texto5,
      String texto6,
      String texto7,
      String texto8,
      String texto9,
      String texto10,
      String texto11,
      List<String> texto12,
      String texto14,
      String texto15,
      String texto17,
      String texto18,
      ) async {
    try {
      await platform.invokeMethod("imprimirCloseRegister", {'texto1': texto1,
        'texto2': texto2,
        'texto3': texto3,
        'texto4': texto4,
        'texto5': texto5,
        'texto6': texto6,
        'texto7': texto7,
        'texto8': texto8,
        'texto9': texto9,
        'texto10': texto10,
        'texto11': texto11,
        'texto12': texto12,
        'texto14': texto14,
        'texto15': texto15,
        'texto17': texto17,
        'texto18': texto18});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
