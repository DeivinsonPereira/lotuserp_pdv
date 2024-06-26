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
  Logger logger = Logger();
  ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();
  IsarService service = IsarService();
  GlobalController globalController = Dependencies.globalController();

  Future<void> caixaItemServidor(int? idUser, String atualDate,
      String atualHour, double valorRecebido, String descricao) async {
    int id_caixa_servidor = responseServidorController.openRegisterId.value;
    String data = atualDate;

    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost08_caixa_itens');

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
      ).timeout(const Duration(seconds: 15),);
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
    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost08_caixa_itens');

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
      ).timeout(const Duration(seconds: 15),);
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
      logger.e(e.toString());
    }
  }
}
