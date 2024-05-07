import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/nfce_resultado.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;

import '../../../collections/pagamento_venda.dart';
import '../../../collections/venda.dart';
import '../../../core/header.dart';

class EmitirNfceMonitoring {
  final Isar isar;
  final IsarService _isarService;
  final Logger _logger = Logger();

  EmitirNfceMonitoring(this.isar, this._isarService);

  // Monitora a emissaão de nfce
  Future<void> monitorarNfce() async {
    try {
      List<nfce_resultado> nfceResultados =
          await isar.nfce_resultados.filter().xmlEqualTo("").findAll();

      if (nfceResultados.isNotEmpty) {
        List<venda?> vendas = [];
        for (var item in nfceResultados) {
          vendas.add(await isar.vendas
              .filter()
              .id_vendaEqualTo(item.id_venda_local!)
              .findFirst());
        }
        List vendaItens = [];
        vendaItens.clear();
        if (vendas.isNotEmpty) {
          for (var itemVenda in vendas) {
            vendaItens.add(await isar.venda_items
                .filter()
                .id_vendaEqualTo(itemVenda!.id_venda)
                .findAll());
          }
          for (var i = 0; i < nfceResultados.length; i++) {
            await sendNfce(nfceResultados[i], vendas[i]!, vendaItens[i]);
          }
        }
      } else {
        _logger
            .d('Isolate monitoramento status: Sem vendas pendentes de envio');
        return;
      }
    } catch (e) {
      _logger.e('Isolate monitoramento status: $e');
      return;
    }
  }

  // Envia nfce
  Future<void> sendNfce(
      nfce_resultado nfce, venda venda, List vendaItem) async {
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

      List<pagamento_venda?> pagamentos = await isar.pagamento_vendas
          .filter()
          .id_vendaEqualTo(venda.id_venda)
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
        "cpf_cnpj": venda.cpf_cnpj == '000.000.000-00' ? '0' : venda.cpf_cnpj,
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
          nfce.isContingencia = jsonResponse['contingencia'];

          if (venda.id_venda_servidor == 0) {
            venda.id_venda_servidor = int.tryParse(jsonResponse['id_venda'])!;
            await isar.writeTxn(() async => await isar.vendas.put(venda));
          }

          await isar.writeTxn(() async => await isar.nfce_resultados.put(nfce));
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
