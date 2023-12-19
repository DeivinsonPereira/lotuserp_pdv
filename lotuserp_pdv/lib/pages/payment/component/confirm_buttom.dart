// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/global_widget/global_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/venda.dart';
import '../../../controllers/pdv.controller.dart';
import '../../../controllers/text_field_controller.dart';

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
    GlobalController globalController = Get.put(GlobalController());
    PdvController pdvController = Get.find();

    return TextButton(
      onPressed: () {
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

        var vendaExecutada = venda()
          ..data = DateTime.now()
          ..hora = DateTime.now().hour.toString()
          ..id_empresa = globalController.caixaAberta //id empresa
          ..id_usuario = globalController.userId //id usuario logado
          ..tot_bruto = pdvController.totBruto.value //total bruto
          ..tot_desc_prc =
              pdvController.checkbox1.value //total desconto em porcentagem
                  ? pdvController.discountPercentage.value
                  : discountPercentagecb2Formated
          ..tot_desc_vlr =
              pdvController.checkbox1.value //total desconto em valor
                  ? numbersDiscountFormated
                  : numbersDiscountcb2Formated
          ..tot_liquido = pdvController.checkbox1.value //total liquido
              ? pdvController.totalcheckBox1.value
              : pdvController.totalcheckBox2.value
          ..valor_troco = pdvController.checkbox1.value //troco
              ? pdvController.trocoCb1.value
              : pdvController.trocoCb2.value
          ..status = 1 //status da venda
          ..id_serie_nfce = globalController.serieNfce //id serie nfce
          ..enviado = 0 //enviado (status de envio)
          ..cpf_cnpj = '000.000.000-00' //cpf cnpj do cliente
          ..id_caixa = globalController
              .caixaAberta; //id caixa aberto para o usuario logado

        !isConfirmation
            ? {Get.back()}
            : {
                service.insertVendaWithVendaItemAndCaixaItem(vendaExecutada),
                Get.offAllNamed(PagesRoutes.homePageRoute)
              };
      },
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isConfirmation ? Colors.black : Colors.white)),
    );
  }
}
