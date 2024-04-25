// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/header.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/venda.dart';
import '../../controllers/global_controller.dart';
import '../../controllers/response_servidor_controller.dart';
import '../../controllers/text_field_controller.dart';
import '../../pages/common/custom_cherry.dart';
import '../dependencies.dart';

abstract class PostOnServidor {
  static Logger logger = Logger();
  static IsarService service = IsarService();
  static GlobalController globalController = Dependencies.globalController();

  static TextFieldController textFieldController =
      Dependencies.textFieldController();

  static ResponseServidorController responseServidorController =
      Dependencies.responseServidorController();

  // FAZ A CHAMADA DA NFC-E
  static Future<int> postOnServidor(
      BuildContext context,
      venda vendas,
      List<caixa_item> caixaItens,
      PdvController pdvController,
      PaymentController paymentController,
      String cpfCnpj,
      {bool isSecondAttempt = false}) async {
    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}nfce_emitir_direta');

    var dateFormatted = DatetimeFormatterWidget.formatDate(vendas.data);

    int? idPayment;
    double? valuePayment;
    double? valorCreditado;

    int idSerieNfce = int.parse(textFieldController.idSerieNfceController.text);
    int idEmpresa = int.parse(textFieldController.idEmpresaController.text);

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
              vendas.tot_desc_prc * pdvController.pedidos[i]['total'] / 100,
          "vlr_liquido": pdvController.pedidos[i]['total'] -
              ((vendas.tot_desc_prc / 100) * pdvController.pedidos[i]['total']),
          "grade": pdvController.pedidos[i]['unidade']
        });
      }

      List<Map<String, dynamic>> pagamentos = [];
      for (var i = 0; i < paymentController.paymentsTotal.length; i++) {
        idPayment = isSecondAttempt == true
            ? paymentController.caixaItems[i].id_tipo_recebimento
            : caixaItens[i].id_tipo_recebimento;

        valuePayment = double.parse(
            paymentController.paymentsTotal[i]['valor'].replaceAll(',', '.'));
        valorCreditado =
            paymentController.paymentsTotal[i]['nome'] == 'DINHEIRO'
                ? (vendas.valor_troco > 0
                    ? valuePayment - vendas.valor_troco
                    : valuePayment)
                : valuePayment;

        pagamentos
            .add({"tipo_movimento": idPayment, "valor_cre": valorCreditado});
      }

      var requestBody = {
        'id_venda': 0,
        "id_venda_servidor": 0,
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
        "nome": '',
        "cpf_cnpj": cpfCnpj,
        "totem_id": 0,
        "totem_dinheiro": "",
        "totem_comanda": 0,
        "itens": itens,
        "pagamentos": pagamentos
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        logger.i("Requisição enviada com sucesso");
        var jsonResponse = jsonDecode(response.body);
        responseServidorController.limparCpfCnpj();
        if (kDebugMode) {
          print('id_venda: ${jsonResponse['id_venda']}');
          print('qr_code: ${jsonResponse['qr_code']}');
          print('xml: ${jsonResponse['xml']}');
        }
        if (jsonResponse['id_venda'] != null &&
            jsonResponse['qr_code'] != null &&
            jsonResponse['xml'] != null) {
          responseServidorController.updateXmlNotaFiscal(true);
          var idVenda = int.tryParse(jsonResponse['id_venda']);
          var qrCode = jsonResponse['qr_code'];
          var xml = jsonResponse['xml'];
          await paymentController.updateVariaveisNfce(idVenda!, qrCode!, xml!);
          paymentController.clearListCaixaItems();
          responseServidorController.limparCpfCnpj();
          int idVendaServidor = 0;
          if (jsonResponse['id_venda'] != null) {
            idVendaServidor = int.parse(jsonResponse['id_venda']);
          }
          return idVendaServidor;
        } else {
          if (isSecondAttempt == false) {
            responseServidorController.updateXmlNotaFiscal(true);
          } else {
            responseServidorController.updateXmlNotaFiscal(true);
            paymentController.clearListCaixaItems();
          }
          const CustomCherryError(message: 'Erro ao gerar nota fiscal.')
              .show(context);
          logger.e("Erro ao fazer a requisição: ${response.statusCode}");
          responseServidorController.limparCpfCnpj();
          return 0;
        }
      } else {
        if (isSecondAttempt == false) {
          responseServidorController.updateXmlNotaFiscal(true);
        } else {
          const CustomCherryError(message: 'Erro ao gerar nota fiscal.')
              .show(context);
          responseServidorController.updateXmlNotaFiscal(true);
          paymentController.clearListCaixaItems();
        }
        logger.e("Erro ao fazer a requisição: ${response.statusCode}");
        responseServidorController.limparCpfCnpj();
        return 0;
      }
    } catch (e) {
      logger.e("Erro ao fazer a requisição: $e");
      const CustomCherryError(message: 'Erro ao gerar nota fiscal.')
          .show(context);
      if (isSecondAttempt == false) {
        responseServidorController.updateXmlNotaFiscal(true);
      } else {
        responseServidorController.updateXmlNotaFiscal(true);
        paymentController.clearListCaixaItems();
      }
      responseServidorController.limparCpfCnpj();
      return 0;
    }
  }
}
