// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/empresa_valida_controller.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/repositories/component/util_endpoint.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class ObterLiberacaoServidorRepository {
  Logger logger = Logger();
  IsarService service = IsarService();

  Future obterLiberacaoServidor(String contrato, BuildContext context) async {
    EmpresaValidaController empresaValidaController =
        Dependencies.empresaValidaController();

    var url = Uri.parse('${UtilEndpoint.getContractRelease()}$contrato');

    await service.connectionVerifySiage();
    try {
      if (service.conexaoSiage) {
        var response = await http.get(url).timeout(const Duration(seconds: 15),);

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['success'] == true) {
            logger.i('Liberação obtida com sucesso: ${response.body}');
            const CustomCherrySuccess(message: 'Contrato validado!')
                .show(context);
            return data;
          } else {
            logger.e('Erro ao obter liberação: ${data['message']}');
            const CustomCherryError(
                    message:
                        'Nenhum registro localizado. Verifique o contrato.')
                .show(context);
            empresaValidaController.updateIsButtonEnabled(true);
            return null;
          }
        } else {
          logger.e('Erro ao obter liberação: ${response.body}');
          empresaValidaController.updateIsButtonEnabled(true);
          return null;
        }
      } else {
        logger.e(
            'Erro ao obter liberação. Status da conexão: ${service.conexaoApi}');
        empresaValidaController.updateIsButtonEnabled(true);
      }
    } catch (e) {
      logger.e('Erro ao obter liberação: $e');
      empresaValidaController.updateIsButtonEnabled(true);
    }
  }
}
