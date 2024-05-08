import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;

import '../../../core/header.dart';

class OpenCaixaMonitoring {
  final Isar isar;
  final Logger _logger = Logger();
  final IsarService _isarService;

  OpenCaixaMonitoring(this.isar, this._isarService);

  // Monitora a abertura de caixa
  Future<void> monitorarAberturaCaixa() async {
    try {
      // Verifica se existe algum caixa aberto no banco local, mas, pendente de envio
      List<caixa?> caixasNaoEnviadas =
          await isar.caixas.filter().id_caixa_servidorEqualTo(0).findAll();

      if (caixasNaoEnviadas.isNotEmpty) {
        for (var item in caixasNaoEnviadas) {
          // busca os dados de abertura do caixa(caixa item)
          caixa_item? caixaItem = await isar.caixa_items
              .filter()
              .id_caixaEqualTo(item!.id_caixa)
              .descricaoEqualTo(
                  ('ABERTURA DE CAIXA' /*StringsDefault.aberturaCaixa*/)
                      .toUpperCase())
              .findFirst();

          if (caixaItem != null) {
            // faz o envio para o servidor
            await openRegister(item, caixaItem);
          } else {
            _logger.d("Caixa item pendente de abertura");
            return;
          }
        }
      } else {
        _logger
            .d('Isolate monitoramento status: Sem caixa pendente de abertura');
        return;
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
    }
  }

  Future<void> openRegister(caixa caixa, caixa_item caixaItem) async {
    var prefix = await _isarService.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost07_caixa_abrir');

    try {
      var requestBody = {
        'id_empresa': caixa.id_empresa,
        'id_usuario': caixa.abertura_id_user,
        'caixa_data_hora':
            DatetimeFormatterWidget.formatDate(caixa.abertura_data!),
        'hora_abertura': caixa.abertura_hora,
        'valor_abertura': caixaItem.valor_cre,
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        caixa.id_caixa_servidor = int.parse(jsonResponse['message']);
        caixaItem.enviado = 1;
        await isar.writeTxn(() async {
          await isar.caixas.put(caixa);
          await isar.caixa_items.put(caixaItem);
        });
      } else {
        _logger.e("Erro ao fazer a requisição: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("Erro ao enviar o registro para o servidor: $e");
    }
  }
}
