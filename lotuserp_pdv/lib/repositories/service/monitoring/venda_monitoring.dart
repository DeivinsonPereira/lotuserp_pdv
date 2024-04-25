import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/pagamento_venda.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/core/header.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;

import '../../../collections/caixa.dart';

class VendaMonitoring {
  final Isar isar;
  final IsarService _isarService;
  final Logger _logger = Logger();

  VendaMonitoring(this.isar, this._isarService);

  // Faz o monitoramento das vendas
  Future<void> monitorarVenda() async {
    try {
      List<venda?> vendasNotSent =
          await isar.vendas.filter().enviadoEqualTo(0).findAll();

      if (vendasNotSent.isNotEmpty) {
        for (var item in vendasNotSent) {
          List<venda_item?> vendaItens = await isar.venda_items
              .filter()
              .id_vendaEqualTo(item!.id_venda)
              .findAll();

          List<pagamento_venda?> pagamentos = await isar.pagamento_vendas
              .filter()
              .id_vendaEqualTo(item.id_venda)
              .findAll();

          List<pagamento_venda?> pagamentosVenda = [];

          if (pagamentos.isNotEmpty) {
            pagamentosVenda = pagamentos
                .where((element) => element!.id_caixa_servidor == 0)
                .toList();
          }

          caixa? caixaSelected = await isar.caixas
              .filter()
              .id_caixaEqualTo(item.id_caixa)
              .findFirst();

          if (pagamentosVenda.isNotEmpty && caixaSelected != null) {
            for (var element in pagamentosVenda) {
              element!.id_caixa_servidor = caixaSelected.id_caixa_servidor;
              await isar.writeTxn(() async {
                await isar.pagamento_vendas.put(element);
              });
            }
          }
          if (vendaItens.isNotEmpty) {
            await sendVenda(item, vendaItens);
          } else {
            _logger.d(
                'Isolate monitoramento status: Sem vendas pendentes de envio');
            return;
          }
        }
      } else {
        _logger
            .d('Isolate monitoramento status: Sem vendas pendentes de envio');
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
    }
  }

  // Faz o envio das vendas em aberto para o servidor
  Future<void> sendVenda(
      venda vendaSelected, List<venda_item?> vendaItens) async {
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
      List<pagamento_venda?> pagamentos = await isar.pagamento_vendas
          .filter()
          .id_vendaEqualTo(vendaSelected.id_venda)
          .findAll();

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

          await isar.writeTxn(() async {
            await isar.vendas.put(vendaSelected);
          });
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
