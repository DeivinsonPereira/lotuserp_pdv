import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class TefElginCustomizationService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');

  static Logger logger = Logger();

  static Future<void> customizarAplicacao() async {
    try {
      await platform.invokeMethod('customizarTEF');
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
