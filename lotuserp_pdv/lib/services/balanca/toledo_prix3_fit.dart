import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class ToledoPrix3Fit {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');
  static Logger logger = Logger();
  static Future<String> getScaleValue() async {
    try {
      logger.d("Solicitando valor da balança");
      final String value = await platform.invokeMethod('getScaleValue');
      logger.d("Valor da balança recebido: $value");
      return value;
    } on PlatformException catch (e) {
      logger.d("Falha na comunicação com a balança: ${e.message}");
      return "Falha na comunicação com a balança: ${e.message}";
    }
  }
}
