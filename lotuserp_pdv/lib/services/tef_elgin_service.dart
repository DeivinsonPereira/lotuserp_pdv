import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../controllers/information_controller.dart';
import '../pages/common/datetime_formatter_widget.dart';

abstract class TefService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');
  static Logger logger = Logger();
  static IsarService service = IsarService();
  static InformationController informationController =
      InjectionDependencies.informationController();

  static Future<String?> startTef(
      Map<String, String?> params, double valor, String parcelas) async {
    try {
      logger.d("Iniciando chamada do método startTEF com parâmetros: $params");

      final String? result = await platform.invokeMethod('startTEF', params);

      if (result != null) {
        final Map<String, dynamic> data = jsonDecode(result);

        logger.d("Método startTEF chamado com sucesso, resultado: $result");
        print('id do caixa:  ${informationController.caixaId}');
        print('id da empresa:  ${informationController.empresaId}');
        print('id do usuario:  ${informationController.usuarioId}');
        print('id da venda: 0');
        print(
            'data lançamento: ${DatetimeFormatterWidget.formatDate(DateTime.now())}');

        // Acessar o valor de COD_AUTORIZACAO
        String codAutorizacao = data['COD_AUTORIZACAO'];
        print('id da autorização: $codAutorizacao');
        print('Enviado: 0');
        print('Quantidade de parcelas : $parcelas');
        print('Valor: $valor');

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
