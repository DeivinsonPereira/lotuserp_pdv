import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class AbrirGaveta {
  var platform = const MethodChannel('com.lotuserp_pdv/tef');

  Logger logger = Logger();

  String? xml;
  String? tamanhoImpressora;

  Future<void> open({String? xmlArgs}) async {
    try {
      await platform.invokeMethod('abrirGaveta');
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
