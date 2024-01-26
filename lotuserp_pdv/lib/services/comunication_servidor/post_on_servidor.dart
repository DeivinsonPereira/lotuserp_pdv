import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/nfce_resultado.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/header.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/venda.dart';
import '../../controllers/global_controller.dart';
import '../../controllers/text_field_controller.dart';
import '../dependencies.dart';

abstract class PostOnServidor {
  static Logger logger = Logger();
  static IsarService service = IsarService();
  static GlobalController globalController = Dependencies.globalController();

  static TextFieldController textFieldController =
      Dependencies.textFieldController();

  // FAZ A CHAMADA DA NFC-E
  static Future<void> postOnServidor(venda vendas, List<caixa_item> caixaItens,
      PdvController pdvController, PaymentController paymentController) async {
    final uri = Uri.parse('http://192.168.1.44:9001/nfce_emitir');

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
              vendas.tot_desc_prc * pdvController.pedidos[i]['total'],
          "vlr_liquido": pdvController.pedidos[i]['total'] -
              (vendas.tot_desc_prc * pdvController.pedidos[i]['total']),
          "grade": pdvController.pedidos[i]['unidade']
        });
      }

      List<Map<String, dynamic>> pagamentos = [];
      for (var i = 0; i < paymentController.paymentsTotal.length; i++) {
        idPayment = caixaItens[i].id_tipo_recebimento;

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
        "cpf_cnpj": '',
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
        var idVenda;
        var qrCode;
        var xml;

        if (jsonResponse['id_venda'] != null &&
            jsonResponse['qr_code'] != null &&
            jsonResponse['xml'] != null) {
          idVenda = int.tryParse(jsonResponse['id_venda']);
          qrCode = jsonResponse['qr_code'];
          xml = jsonResponse['xml'];
        }

        paymentController.updateVariaveisNfce(idVenda, qrCode, xml);
      } else {
        logger.e("Erro ao fazer a requisição: ${response.statusCode}");
      }
    } catch (e) {
      logger.e("Erro ao fazer a requisição: $e");
    }
  }
}
