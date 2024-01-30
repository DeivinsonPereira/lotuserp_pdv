import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/response_servidor_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/caixa_fechamento.dart';

import 'package:http/http.dart' as http;

import '../core/header.dart';
import '../pages/common/strings_default.dart';
import '../services/dependencies.dart';

class CloseRegisterServidorRepository {
  IsarService service = IsarService();
  Logger logger = Logger();

  ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();

  Future<void> closeRegisterServidor(String atualDate, int idCaixaServidor,
      List<caixa_fechamento> fechamentosCaixa) async {
    var dadosUsuario = await service.getUserLogged();

    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost11_caixa_fechar');

    List<Map<String, dynamic>> fechamentosCaixaMap = [];
    for (var element in fechamentosCaixa) {
      fechamentosCaixaMap.add({
        "id_tipo_recebimento": element.id_tipo_recebimento,
        "valor_informado": element.valor_informado
      });
    }

    try {
      var requestBody = {
        "fechou_id_user": dadosUsuario!.id_user,
        "fechou_data_hora": atualDate,
        "id_caixa_servidor": idCaixaServidor,
        "informado": fechamentosCaixaMap
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          responseServidorController.updateEnviado(StringsDefault.enviado);
          logger.i(response.body);
        } else {
          responseServidorController.updateEnviado(StringsDefault.naoEnviado);
          logger.e(response.body);
        }
      } else {
        responseServidorController.updateEnviado(StringsDefault.naoEnviado);
        logger.e(response.body);
      }
    } catch (e) {
      responseServidorController.updateEnviado(StringsDefault.naoEnviado);
      logger.e('Erro ao fechar o caixa: $e');
    }
  }
}
