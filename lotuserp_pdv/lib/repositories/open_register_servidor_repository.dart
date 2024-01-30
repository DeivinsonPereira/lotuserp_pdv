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

    var id_empresa = idEmpresa;
    var id_usuario = idUsuario;
    var caixa_data_hora = atualDate;
    var hora_abertura = atualHour;
    var valor_abertura = valorAbertura;
    try {
      var requestBody = {
        'id_empresa': id_empresa,
        'id_usuario': id_usuario,
        'caixa_data_hora': caixa_data_hora,
        'hora_abertura': hora_abertura,
        'valor_abertura': valor_abertura,
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
