import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/header.dart';
import 'package:lotuserp_pdv/pages/common/custom_snack_bar.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/venda.dart';
import '../../controllers/global_controller.dart';
import '../../controllers/response_servidor_controller.dart';
import '../../controllers/text_field_controller.dart';
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
  static Future<void> postOnServidor(
      venda vendas,
      List<caixa_item> caixaItens,
      PdvController pdvController,
      PaymentController paymentController,
      int idServidor,
      {bool isSecondAttempt = false}) async {
    var prefix = await service.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}nfce_emitir');

    var dateFormatted = DatetimeFormatterWidget.formatDate(vendas.data);

    int? idPayment;
    double? valuePayment;
    double? valorCreditado;

    int idSerieNfce = int.parse(textFieldController.idSerieNfceController.text);
    int idEmpresa = int.parse(textFieldController.idEmpresaController.text);

    String cpfCnpj = '';
    if (responseServidorController.cpfCnpjController.text.isEmpty ||
        responseServidorController.cpfCnpjController.text == '') {
      cpfCnpj = '';
    } else {
      cpfCnpj = responseServidorController.cpfCnpjController.text;
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
        'id_venda': vendas.id_venda,
        "id_venda_servidor": idServidor,
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
        "cpf_cnpj": cpfCnpj,
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

        print('id_venda: ${jsonResponse['id_venda']}');
        print('qr_code: ${jsonResponse['qr_code']}');
        print('xml: ${jsonResponse['xml']}');
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
        } else {
          if (isSecondAttempt == false) {
            responseServidorController.updateXmlNotaFiscal(true);
          } else {
            responseServidorController.updateXmlNotaFiscal(true);
            paymentController.clearListCaixaItems();
          }
          const CustomSnackBar(message: 'Erro ao gerar nota fiscal.').show();
          logger.e("Erro ao fazer a requisição: ${response.statusCode}");
          responseServidorController.limparCpfCnpj();
        }
      } else {
        if (isSecondAttempt == false) {
          responseServidorController.updateXmlNotaFiscal(true);
        } else {
          const CustomSnackBar(message: 'Erro ao gerar nota fiscal.').show();
          responseServidorController.updateXmlNotaFiscal(true);
          paymentController.clearListCaixaItems();
        }
        logger.e("Erro ao fazer a requisição: ${response.statusCode}");
        responseServidorController.limparCpfCnpj();
      }
    } catch (e) {
      logger.e("Erro ao fazer a requisição: $e");
      const CustomSnackBar(message: 'Erro ao gerar nota fiscal.').show();
      if (isSecondAttempt == false) {
        responseServidorController.updateXmlNotaFiscal(true);
      } else {
        responseServidorController.updateXmlNotaFiscal(true);
        paymentController.clearListCaixaItems();
      }
      responseServidorController.limparCpfCnpj();
    }
  }
}
