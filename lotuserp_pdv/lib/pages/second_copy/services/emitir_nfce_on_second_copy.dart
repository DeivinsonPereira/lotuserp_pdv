// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/nfce_resultado.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/pages/second_copy/services/logic_print.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;
import 'package:lotuserp_pdv/shared/pagamento_venda/get_pagamento_venda.dart';

import '../../../collections/pagamento_venda.dart';
import '../../../collections/venda.dart';
import '../../../core/header.dart';

class EmitirNfceOnSecondCopy {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var informationController = Dependencies.informationController();

  // Monitora a emissaão de nfce
  Future<void> emitir(BuildContext context) async {
    venda vendaSelected = informationController.vendaSelecionada;
    try {
      nfce_resultado? nfceResultados =
          await _isarService.getNfceResultadosByIdVenda(vendaSelected.id_venda);
      if (nfceResultados != null) {
        List<venda_item?> vendaItens =
            await _isarService.getVendaItemByIdVenda(vendaSelected.id_venda);
        if (vendaItens.isNotEmpty) {
          await sendNfce(nfceResultados, vendaSelected, vendaItens, context);
        }
      } else {
        _logger.d('Nfce não encontrada');
        return;
      }
    } catch (e) {
      _logger.e('Erro ao emitir Nfce $e');
      return;
    }
  }

  // Envia nfce
  Future<void> sendNfce(nfce_resultado nfce, venda venda,
      List<venda_item?> vendaItem, BuildContext context) async {
    var prefix = await _isarService.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}nfce_emitir_direta');

    try {
      List<Map<String, dynamic>> itens = [];
      int count = 0;
      if (vendaItem.isEmpty) {
        _logger.e('Nenhuma nfce para ser enviada');
        return;
      }

      for (var item in vendaItem) {
        itens.add({
          "item": count,
          "id_produto": item!.id_produto,
          "vlr_vendido": item.vlr_vendido,
          "qtde": item.qtde,
          "tot_bruto": item.tot_bruto,
          "vlr_desc_prc": venda.tot_desc_prc,
          "vlr_desc_vlr": venda.tot_desc_prc * item.tot_bruto! / 100,
          "vlr_liquido":
              item.tot_bruto! - ((venda.tot_desc_prc / 100) * item.tot_bruto!),
          "grade": item.grade!
        });

        count++;
      }

      List<pagamento_venda?> pagamentos =
          await GetPagamentoVenda().getByIdVenda(venda.id_venda);

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
        'id_venda': 0,
        "id_venda_servidor": 0,
        "data_venda": DatetimeFormatterWidget.formatDate(venda.data),
        "hora_venda": venda.hora,
        "id_empresa": venda.id_empresa,
        "id_vendedor": venda.id_colaborador,
        "id_usuario": venda.id_usuario,
        "tot_bruto": venda.tot_bruto,
        "tot_desc_prc": venda.tot_desc_prc,
        "tot_desc_vlr": venda.tot_desc_vlr,
        "tot_liquido": venda.tot_liquido,
        "valor_troco": venda.valor_troco,
        "id_serie_nfce": venda.id_serie_nfce,
        "nome": '',
        "cpf_cnpj": venda.cpf_cnpj,
        "totem_id": 0,
        "totem_dinheiro": "",
        "totem_comanda": 0,
        "itens": itens,
        "pagamentos": pagamentosExecutados
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        _logger.i("Requisição enviada com sucesso");
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['id_venda'] != null &&
            jsonResponse['qr_code'] != null &&
            jsonResponse['xml'] != null) {
          nfce.id_venda_local = venda.id_venda;
          nfce.id_venda_servidor = int.tryParse(jsonResponse['id_venda']);
          nfce.qr_code = jsonResponse['qr_code'];
          nfce.xml = jsonResponse['xml'];

          await _isarService.updateNfceResultado(nfce);
          await informationController.addNfce();
          Future.delayed(const Duration(seconds: 1), () async {
            await LogicSecondPrint().printNfce(venda, context);
          });

          venda.id_venda_servidor = int.tryParse(jsonResponse['id_venda'])!;

          _isarService.putVenda(venda);

          //LogicPrintNfce().imprimirNfce(jsonResponse['xml']);
        } else {
          _logger.e("Erro ao fazer a requisição: ${jsonResponse['message']}");
          return;
        }
      } else {
        _logger.e("Erro ao fazer a requisição: ${response.statusCode}");
        return;
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
      return;
    }
  }
}
