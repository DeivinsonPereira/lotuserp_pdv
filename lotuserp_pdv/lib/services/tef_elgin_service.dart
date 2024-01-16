import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/cartao_item.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../controllers/information_controller.dart';

abstract class TefService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');
  static Logger logger = Logger();
  static IsarService service = IsarService();
  static InformationController informationController =
      InjectionDependencies.informationController();
  static PrinterController printerController =
      InjectionDependencies.printerController();

  static Future<String?> startTef(
      Map<String, String?> params, double valor, String parcelas) async {
    try {
      logger.d("Iniciando chamada do método startTEF com parâmetros: $params");

      final String? result = await platform.invokeMethod('startTEF', params);

      if (result != null) {
        final Map<String, dynamic> data = jsonDecode(result);

        logger.d("Método startTEF chamado com sucesso, resultado: $result");

        int? caixaId = await informationController.searchCaixaId();
        int? empresaId = await informationController.searchEmpresaId();
        int? usuarioId = await informationController.searchUserId();

        cartao_item cartaoItem = cartao_item()
          ..id_caixa = caixaId!
          ..id_empresa = empresaId!
          ..id_usuario = usuarioId!
          ..id_venda = 0
          ..valor_doc = valor
          ..parc_qtde = int.parse(parcelas)
          ..id_autorizacao = data['COD_AUTORIZACAO']
          ..data_lanca = DateTime.now()
          ..imagem_comprovante = result
          ..enviado = 0;

        await service.insertCartaoItem(cartaoItem);

        return result;
      }
      return result;
    } on PlatformException catch (e) {
      logger.e(
        "Erro ao chamar o TEF: '${e.message}'.",
      );
      return null;
    }
  }
}
