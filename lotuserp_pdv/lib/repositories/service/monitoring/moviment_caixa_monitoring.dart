import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/caixa.dart';
import '../../../collections/caixa_item.dart';
import '../../../core/header.dart';
import 'package:http/http.dart' as http;

class MovimentCaixaMonitoring {
  final Isar isar;
  final IsarService _isarService;
  final Logger _logger = Logger();

  MovimentCaixaMonitoring(this.isar, this._isarService);

  // Monitora movimento de caixa
  Future<void> monitoramentoMovimentoCaixa() async {
    try {
      // Busca os caixaitens que ainda não foram enviados para o servidor
      List<caixa_item> caixaItens =
          await isar.caixa_items.filter().enviadoEqualTo(0).findAll();
      if (caixaItens.isEmpty) {
        _logger.d('Isolate monitoramento status: Sem caixa pendente de envio');
        return;
      }
      if (caixaItens.isNotEmpty) {
        caixaItens = caixaItens
            .where((item) =>
                item.descricao != ('Abertura de Caixa').toUpperCase() &&
                item.descricao != ('Venda').toUpperCase())
            .toList();
        for (var item in caixaItens) {
          caixa? caixas = await isar.caixas
              .filter()
              .id_caixaEqualTo(item.id_caixa)
              .findFirst();

          if (caixas != null && caixas.id_caixa_servidor != 0) {
            // faz o envio para o servidor
            sendMovimentCaixa(caixas, item);
          } else {
            _logger.d('Isolate monitoramento status: Caixa pendente de envio');
          }
        }
      } else {
        _logger.d('Isolate monitoramento status: Sem caixa pendente de envio');
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
    }
  }

  Future<void> sendMovimentCaixa(caixa caixa, caixa_item caixaItem) async {
    var prefix = await _isarService.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost08_caixa_itens');

    try {
      var requestBody = {
        "id_caixa_servidor": caixa.id_caixa_servidor,
        "descricao": caixaItem.descricao,
        "data": DatetimeFormatterWidget.formatDate(caixa.abertura_data),
        "id_tipo_recebimento": caixaItem.id_tipo_recebimento,
        "valor_cre": caixaItem.valor_cre,
        "valor_deb": caixaItem.valor_deb,
        "id_usuario": caixa.abertura_id_user,
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          caixaItem.enviado = 1;
          await isar
              .writeTxn(() async => await isar.caixa_items.put(caixaItem));
        } else {
          _logger.e(
              'Erro ao enviar o movimento de caixa : ${jsonResponse['message']}');
        }
      } else {
        _logger.e('Erro ao enviar o movimento de caixa : ${response.body}');
      }
    } catch (e) {
      _logger.e('Erro ao enviar o movimento de caixa : $e');
    }
  }
}
