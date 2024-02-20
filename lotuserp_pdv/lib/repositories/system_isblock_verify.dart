import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/repositories/component/util_endpoint.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;

import '../collections/empresa_valida.dart';
import '../pages/empresa_block/block_verify_popup.dart';

class SystemIsblockVerify {
  Logger logger = Logger();
  IsarService service = IsarService();

  Future<void> checkIfTheSystemIsLocked() async {
    try {
      empresa_valida? dadosContrato =
          await service.getDadoTabelaEmpresaValida();

      await service.connectionVerifySiage();
      if (service.conexaoSiage) {
        if (dadosContrato != null) {
          Uri uri = Uri.parse(
              '${UtilEndpoint.getIsSystemBlocked()}${dadosContrato.nocontrato}');

          var response = await http.get(uri);

          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            if (jsonResponse['success'] == true &&
                jsonResponse['itens'][0]['bloqueado'] == 'NAO') {
            } else {
              logger.e(
                  'Contrato bloquado: ${jsonResponse['itens'][0]['bloqueado']}');
              await service.updateDadoTabelaContrato();
              Get.dialog(barrierDismissible: false, const BlockVerifyPopup());
            }
          } else {
            logger.e(
                'Erro ao verificar se o sistema esta bloqueado: ${response.body}');
          }
        }
      } else {
        logger.e('Erro na conexão com o servidor. ${service.conexaoSiage}');
      }
    } catch (e) {
      logger.e('Erro ao verificar se o sistema esta bloqueado: $e');
    }
  }
}
