import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class TefElginPrintService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');

  static Logger logger = Logger();

  static Future<void> imprimirPagamentoTEF(String texto, String viaEstabelecimento ) async {
    try {
      logger.d("Iniciando chamada do método imprimirTefElgin com parâmetros: Via do Cliente: $viaCliente, Via do Estabelecimento: $viaEstabelecimento");
      await platform.invokeMethod('imprimirTefElgin', {'viaCliente': viaCliente, 'viaEstabelecimento': viaEstabelecimento});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}