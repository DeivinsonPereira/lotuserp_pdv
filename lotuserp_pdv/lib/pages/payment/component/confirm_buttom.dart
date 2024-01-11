// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/controllers/global_controller.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/venda.dart';
import '../../../controllers/pdv.controller.dart';
import '../../../services/tef_elgin_service.dart';

class ConfirmButtom extends StatelessWidget {
  const ConfirmButtom({
    Key? key,
    this.isConfirmation = false,
    required this.text,
    this.onConfirm,
  }) : super(key: key);

  final bool isConfirmation;
  final String text;
  final Function(String value)? onConfirm;

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    GlobalController globalController =
        InjectionDependencies.globalController();
    PdvController pdvController = InjectionDependencies.pdvController();
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    InjectionDependencies.printerController();
    PaymentController paymentController =
        InjectionDependencies.paymentController();

    Future<void> processCommonOperations() async {
      //soma o valor bruto total dos itens que estão nos pedidos
      pdvController.totalSomaPedidos();
      //transforma discountPercentage em double
      String discountPercentagecb2 =
          pdvController.discountPercentagecb2.value.replaceAll(',', '.');

      double discountPercentagecb2Formated =
          double.parse(discountPercentagecb2);

      //transforma numbersDiscount em double
      String numbersDiscountcb2 =
          pdvController.numbersDiscountcb2.value.replaceAll(',', '.');
      double numbersDiscountcb2Formated = double.parse(numbersDiscountcb2);

      //transforma numbersDiscountcb2 em double
      String numbersDiscount =
          pdvController.numbersDiscount.value.replaceAll(',', '.');
      double numbersDiscountFormated = double.parse(numbersDiscount);

      pdvController
          .totalLiquido(); //soma o valor bruto total dos itens que estão nos pedidos

      var vendaExecutada = venda()
        ..data = DateTime.now()
        ..hora = sideBarController.hours.value
        ..id_empresa = globalController.empresaId //id empresa
        ..id_usuario = globalController.userId //id usuario logado
        ..id_colaborador = globalController.colaboradorId //id colaborador
        ..tot_bruto = double.parse(
            pdvController.totBruto.value.toStringAsFixed(2)) //total bruto
        ..tot_desc_prc =
            pdvController.checkbox1.value //total desconto em porcentagem
                ? double.parse(
                    pdvController.discountPercentage.value.toStringAsFixed(2))
                : double.parse(discountPercentagecb2Formated.toStringAsFixed(2))
        ..tot_desc_vlr = pdvController.checkbox1.value //total desconto em valor
            ? double.parse(numbersDiscountFormated.toStringAsFixed(2))
            : double.parse(numbersDiscountcb2Formated.toStringAsFixed(2))
        ..tot_liquido = pdvController.liquido.value
        ..valor_troco = pdvController.checkbox1.value //troco
            ? double.parse(pdvController.trocoCb1.value.toStringAsFixed(2))
            : double.parse(pdvController.trocoCb2.value.toStringAsFixed(2))
        ..status = 1 //status da venda
        ..id_serie_nfce = globalController.serieNfce //id serie nfce
        ..enviado = 0 //enviado (status de envio)
        ..cpf_cnpj = '000.000.000-00' //cpf cnpj do cliente
        ..id_caixa =
            pdvController.caixaId.value; //id caixa aberto para o usuario logado

      await service.insertVendaWithVendaItemAndCaixaItem(vendaExecutada);

      pdvController.updateIsSelectedList();
      Get.back();
      Get.back();
    }

    bool hasTefPayment() {
      return paymentController.paymentsTotal.any((payment) =>
          payment['nome'] == 'TEF DEBITO' || payment['nome'] == 'TEF CREDITO');
    }

    void showTefResultDialog(Map<String, dynamic> tefResponse) {
      String title = tefResponse['status'] == 'success' ? 'Sucesso' : 'Erro';
      String message = tefResponse['message'] ?? 'Ocorreu um erro desconhecido';

      Get.dialog(
        AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Get.back(); // Fecha o diálogo
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }

    Future<void> handleTefTransaction() async {
      String tefType = '';
      String? parcelas;
      String? financiamento;
      for (var payment in paymentController.paymentsTotal) {
        if (payment['nome'] == 'TEF DEBITO') {
          tefType = 'debito';
          break;
        } else if (payment['nome'] == 'TEF CREDITO') {
          tefType = 'credito';
          parcelas = '3'; // Defina a quantidade de parcelas aqui
          financiamento = '3'; // Defina o tipo de financiamento aqui
          break;
        }
      }

      // Se não for nem débito nem crédito, retorna
      if (tefType.isEmpty) return;

      // Define os parâmetros para a transação TEF
      Map<String, String?> tefParams = {
        'funcao': tefType,
        'valor': '100', // Substitua pelo valor real da transação
      };
      String? tefResponseJson = await TefService.startTef(tefParams);
      if (tefResponseJson == null) {
        showTefResultDialog(
            {'status': 'error', 'message': 'Resposta do TEF nula'});
      } else {
        try {
          // Tenta decodificar a resposta JSON
          Map<String, dynamic> tefResponse = jsonDecode(tefResponseJson);
          showTefResultDialog(tefResponse);
        } catch (e) {
          // Tratamento de erro se o JSON estiver mal formado
          showTefResultDialog({
            'status': 'error',
            'message': 'Erro ao decodificar a resposta do TEF: $e'
          });
        }
      }

      // Processa as operações comuns
      await processCommonOperations();

      Get.back();
      Get.back();
    }

    return TextButton(
      onPressed: () async {
        if (isConfirmation) {
          if (hasTefPayment()) {
            await handleTefTransaction();
          } else {
            await processCommonOperations();
          }
        } else {
          pdvController.updateIsSelectedList();
          Get.back();
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: isConfirmation ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
