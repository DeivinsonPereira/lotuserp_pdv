// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/pages/common/strings_default.dart';

import 'package:http/http.dart' as http;
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../controllers/global_controller.dart';
import '../controllers/response_servidor_controller.dart';
import '../core/header.dart';
import '../services/dependencies.dart';

class CaixaItemServidorRepository {
  Uri uri = Uri.parse('http://192.168.1.44:9001/pdvmobpost08_caixa_itens');

  Logger logger = Logger();
  ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();
  IsarService service = IsarService();
  GlobalController globalController = Dependencies.globalController();

  Future<void> caixaItemServidor(int? idUser, String atualDate,
      String atualHour, double valorRecebido, String descricao) async {
    int id_caixa_servidor = responseServidorController.openRegisterId.value;
    String data = atualDate;

    try {
      var requestBody = {
        "id_caixa_servidor": id_caixa_servidor,
        "descricao": descricao,
        "data": data,
        "id_tipo_recebimento": StringsDefault.tipoRecebimentoAbertura,
        "valor_cre": valorRecebido,
        "valor_deb": StringsDefault.valorDebito,
        "id_usuario": idUser
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          responseServidorController.updateEnviadoOpenRegister(1);
          logger.i(response.body);
        } else {
          responseServidorController
              .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
          logger.e(response.body);
        }
      } else {
        responseServidorController
            .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
        logger.e(response.body);
      }
    } catch (e) {
      responseServidorController
          .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
      logger.e(e.toString());
    }
  }

  Future<void> caixaItemMovivmentCashServidor(
      String descricao,
      String atualDate,
      String atualHour,
      int tipoRecebimento,
      double valorRecebido,
      double valorDebito,
      int idUser,
      int idCaixaServidor) async {
    try {
      var requestBody = {
        "id_caixa_servidor": idCaixaServidor,
        "descricao": descricao,
        "data": atualDate,
        "id_tipo_recebimento": tipoRecebimento,
        "valor_cre": valorRecebido,
        "valor_deb": valorDebito,
        "id_usuario": idUser
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          responseServidorController
              .updateEnviadoOpenRegister(StringsDefault.enviado);
          logger.i(response.body);
        } else {
          responseServidorController
              .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
          logger.e(response.body);
        }
      } else {
        responseServidorController
            .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
        logger.e(response.body);
      }
    } catch (e) {
      responseServidorController
          .updateEnviadoOpenRegister(StringsDefault.naoEnviado);
      logger.e(e.toString());
    }
  }
}
