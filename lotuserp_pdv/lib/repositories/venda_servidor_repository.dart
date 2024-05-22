// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/pagamento_venda.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/response_servidor_controller.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/caixa_item.dart';
import '../collections/venda.dart';
import '../controllers/payment_controller.dart';
import '../core/header.dart';
import '../pages/common/strings_default.dart';
import '../services/datetime_formatter_widget.dart';

import 'package:http/http.dart' as http;

class VendaServidorRepository {
  IsarService service = IsarService();
  Logger logger = Logger();

  TextFieldController textFieldController = Dependencies.textFieldController();
  ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();

  Future<List<pagamento_venda>> vendaToServer(
      BuildContext context,
      int idVendaServer,
      venda vendas,
      List<caixa_item> caixaItens,
      PdvController pdvController,
      PaymentController paymentController,
      int idCaixaServidor,
      String cpfCnpj) async {
    var dateFormatted = DatetimeFormatterWidget.formatDate(vendas.data);

    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost09_venda');

    int? idPayment;
    double? valuePayment;
    double? valorCreditado;

    int idSerieNfce = int.parse(textFieldController.idSerieNfceController.text);
    int idEmpresa = int.parse(textFieldController.idEmpresaController.text);

    List<Map<String, dynamic>> pagamentos = [];
    for (var i = 0; i < paymentController.paymentsTotal.length; i++) {
      idPayment = caixaItens[i].id_tipo_recebimento;

      valuePayment = double.parse(
          paymentController.paymentsTotal[i]['valor'].replaceAll(',', '.'));
      valorCreditado = paymentController.paymentsTotal[i]['nome'] == 'DINHEIRO'
          ? (vendas.valor_troco > 0
              ? valuePayment - vendas.valor_troco
              : valuePayment)
          : valuePayment;

      pagamentos
          .add({"tipo_movimento": idPayment, "valor_cre": valorCreditado});
    }

    List<pagamento_venda> payments = [];
    for (var item in pagamentos) {
      payments.add(pagamento_venda(
        id_venda: vendas.id_venda,
        id_caixa_servidor: idCaixaServidor,
        id_forma_pagamento: item['tipo_movimento'],
        valor_creditado: item['valor_cre'],
      ));
    }

    try {
      List<Map<String, dynamic>> itens = [];
      for (var i = 0; i < pdvController.pedidos.length; i++) {
        itens.add({
          "item": i + 1,
          "id_produto": pdvController.pedidos[i]['idProduto'],
          "vlr_vendido": pdvController.pedidos[i]['price'],
          "qtde": pdvController.pedidos[i]['quantidade'],
          "tot_bruto": pdvController.pedidos[i]['total'],
          "vlr_desc_prc": vendas.tot_desc_prc,
          "vlr_desc_vlr":
              vendas.tot_desc_prc * pdvController.pedidos[i]['total'],
          "vlr_liquido": pdvController.pedidos[i]['total'] -
              (vendas.tot_desc_prc * pdvController.pedidos[i]['total']),
          "grade": pdvController.pedidos[i]['unidade']
        });
      }

      var requestBody = {
        'id_venda': vendas.id_venda,
        "id_venda_servidor": idVendaServer,
        "id_caixa_servidor": idCaixaServidor,
        "data_venda": dateFormatted,
        "hora_venda": vendas.hora,
        "id_empresa": idEmpresa,
        "id_vendedor": vendas.id_colaborador,
        "id_usuario": vendas.id_usuario,
        "tot_bruto": vendas.tot_bruto,
        "tot_desc_prc": vendas.tot_desc_prc,
        "tot_desc_vlr": vendas.tot_desc_vlr,
        "tot_liquido": vendas.tot_liquido,
        "valor_troco": vendas.valor_troco,
        "id_serie_nfce": idSerieNfce,
        "cpf_cnpj": cpfCnpj,
        "itens": itens,
        "pagamentos": pagamentos
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      ).timeout(const Duration(seconds: 15),);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          responseServidorController.updateEnviado(StringsDefault.enviado);
          responseServidorController
              .updateIdVendaServidor(int.parse(jsonResponse['message']));
          Future.delayed(const Duration(milliseconds: 300));
          logger.i("Requisição enviada com sucesso ${response.body}");

          Future.delayed(const Duration(milliseconds: 300));

          return payments;
        } else {
          responseServidorController.updateEnviado(StringsDefault.naoEnviado);
          logger.e(
              "Erro ao enviar Venda para o servidor: ${response.body} ${jsonResponse['message']}");
          return payments;
        }
      } else {
        responseServidorController.updateEnviado(StringsDefault.naoEnviado);
        logger.e(
            "Erro ao enviar Venda para o servidor: ${response.body} ${response.statusCode}");

        return payments;
      }
    } catch (e) {
      responseServidorController.updateEnviado(StringsDefault.naoEnviado);
      logger.e("Erro ao enviar Venda para o servidor: $e");
      return payments;
    }
  }
}
