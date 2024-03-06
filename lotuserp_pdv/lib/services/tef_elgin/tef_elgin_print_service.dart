import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class TefElginPrintService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');

  static Logger logger = Logger();

  static Future<void> imprimirPagamentoTEF(String texto) async {
    try {
      await platform.invokeMethod('imprimirTefElgin', {'texto': texto});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
