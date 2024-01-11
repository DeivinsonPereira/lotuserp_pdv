import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class TefService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');
  static Logger logger = Logger();

  static Future<String?> startTef(Map<String, String?> params) async {
    try {
      logger.d("Iniciando chamada do método startTEF com parâmetros: $params");

      final String? result = await platform.invokeMethod('startTEF', params);
      logger.d("Método startTEF chamado com sucesso, resultado: $result");
      return result;
    } on PlatformException catch (e) {
      logger.e(
        "Erro ao chamar o TEF: '${e.message}'.",
      );
      return null;
    }
  }
}
