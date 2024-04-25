// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import 'package:http/http.dart' as http;
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../controllers/response_servidor_controller.dart';
import '../core/header.dart';

class OpenRegisterServidorRepository {
  Logger logger = Logger();
  ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();
  IsarService service = IsarService();

  Future<void> openRegisterServidor(int idEmpresa, int idUsuario,
      String atualDate, String atualHour, double valorAbertura) async {
        
    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost07_caixa_abrir');

    try {
      var requestBody = {
        'id_empresa': idEmpresa,
        'id_usuario': idUsuario,
        'caixa_data_hora': atualDate,
        'hora_abertura': atualHour,
        'valor_abertura': valorAbertura,
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        logger.i("Requisição enviada com sucesso");
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] != null) {
          responseServidorController
              .updateOpenRegisterId(int.tryParse(jsonResponse['message'])!);
        }
      } else {
        logger.e("Erro ao fazer a requisição: ${response.statusCode}");
      }
    } catch (e) {
      logger.e("Erro ao enviar o registro para o servidor: $e");
    }
  }
}
