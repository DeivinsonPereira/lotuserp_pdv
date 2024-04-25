import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:lotuserp_pdv/shared/pagamento_venda/get_pagamento_venda.dart';

import '../../../collections/caixa.dart';
import '../../../collections/pagamento_venda.dart';
import '../../../collections/venda.dart';
import '../../../collections/venda_item.dart';
import '../../../core/header.dart';
import '../../../services/datetime_formatter_widget.dart';
import '../../../services/dependencies.dart';
import '../../../shared/pagamento_venda/put_pagamento_venda.dart';
import 'package:http/http.dart' as http;

class EnviarVenda {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var pdvController = Dependencies.pdvController();

  Future<void> enviarVenda(venda vendaSelected) async {
    try {
      if (vendaSelected.id_venda_servidor != 0) {
        _logger.e('Venda ja enviada');
        return;
      }

      List<venda_item?> vendaItens =
          await _isarService.getVendaItemByIdVenda(vendaSelected.id_venda);
      List<pagamento_venda?> pagamentos =
          await GetPagamentoVenda().getByIdVenda(vendaSelected.id_venda);
      List<pagamento_venda?> pagamentosVenda = [];

      if (pagamentos.isNotEmpty) {
        pagamentosVenda = pagamentos
            .where((element) => element!.id_caixa_servidor == 0)
            .toList();
      }

      caixa? caixaSelected =
          await _isarService.getCaixaById(pdvController.caixaId.value);

      if (pagamentosVenda.isNotEmpty && caixaSelected != null) {
        for (var element in pagamentosVenda) {
          element!.id_caixa_servidor = caixaSelected.id_caixa_servidor;
          await PutPagamentoVenda().put(element);
        }
      }

      if (vendaItens.isNotEmpty) {
        await sendVenda(vendaSelected, vendaItens, pagamentos);
      } else {
        _logger
            .d('Isolate monitoramento status: Sem vendas pendentes de envio');
        return;
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
    }
  }

  // Faz o envio das vendas em aberto para o servidor
  Future<void> sendVenda(venda vendaSelected, List<venda_item?> vendaItens,
      List<pagamento_venda?> pagamentos) async {
    try {
      List<Map<String, dynamic>> itens = [];
      int count = 0;

      for (var vendas in vendaItens) {
        itens.add({
          'item': count,
          'id_produto': vendas?.id_produto,
          'vlr_vendido': vendas?.vlr_vendido,
          'qtde': vendas?.qtde,
          'tot_bruto': vendas?.tot_bruto,
          'vlr_desc_prc': vendaSelected.tot_desc_prc,
          'vlr_desc_vlr': (vendaSelected.tot_desc_prc * vendas!.tot_bruto!),
          'vlr_liquido': vendas.tot_bruto! -
              (vendaSelected.tot_desc_prc * vendas.tot_bruto!),
          'grade': vendas.grade
        });
        count++;
      }

      var pagamentosExecutados = [];

      if (pagamentos.isNotEmpty) {
        for (var item in pagamentos) {
          pagamentosExecutados.add({
            "tipo_movimento": item!.id_forma_pagamento,
            "valor_cre": item.valor_creditado
          });
        }
      }

      var requestBody = {
        'id_venda': vendaSelected.id_venda,
        "id_venda_servidor": 0,
        "id_caixa_servidor": pagamentos[0]!.id_caixa_servidor,
        "data_venda": DatetimeFormatterWidget.formatDate(vendaSelected.data),
        "hora_venda": vendaSelected.hora,
        "id_empresa": vendaSelected.id_empresa,
        "id_vendedor": vendaSelected.id_colaborador,
        "id_usuario": vendaSelected.id_usuario,
        "tot_bruto": vendaSelected.tot_bruto,
        "tot_desc_prc": vendaSelected.tot_desc_prc,
        "tot_desc_vlr": vendaSelected.tot_desc_vlr,
        "tot_liquido": vendaSelected.tot_liquido,
        "valor_troco": vendaSelected.valor_troco,
        "id_serie_nfce": vendaSelected.id_serie_nfce,
        "cpf_cnpj": vendaSelected.cpf_cnpj,
        "itens": itens,
        "pagamentos": pagamentosExecutados
      };

      var prefix = await _isarService.getIpEmpresaFromDatabase();
      Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost09_venda');

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        _logger.i("Requisição enviada com sucesso ${response.body}");
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success'] == true) {
          vendaSelected.enviado = 1;
          /* var nfce = await isar.nfce_resultados
              .filter()
              .id_venda_localEqualTo(vendaSelected.id_venda)
              .findAll();

          if (nfce.isNotEmpty) {
            nfce[0].id_venda_servidor = int.parse(jsonResponse['message']);
            await isar.writeTxn(() async {
              await isar.nfce_resultados.put(nfce[0]);
            });
          }
          */
          _isarService.putVenda(vendaSelected);
        } else {
          _logger.e(
              "Erro ao enviar Venda para o servidor: ${response.body} ${jsonResponse['message']}");
        }
      } else {
        _logger.e(
            "Erro ao enviar Venda para o servidor: ${response.body} ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("Erro ao enviar Venda para o servidor: $e");
    }
  }
}
