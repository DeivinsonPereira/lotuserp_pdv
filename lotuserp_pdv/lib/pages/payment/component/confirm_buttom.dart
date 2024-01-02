// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/controllers/global_controller.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_card_machine.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/venda.dart';
import '../../../controllers/pdv.controller.dart';

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

    return TextButton(
      onPressed: () async {
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
          ..hora = sideBarController.hours.value
          ..id_empresa = globalController.empresaId //id empresa
          ..id_usuario = globalController.userId //id usuario logado
          ..id_colaborador = globalController.colaboradorId //id colaborador
          ..tot_bruto = double.parse(
              pdvController.totBruto.value.toStringAsFixed(2)) //total bruto
          ..tot_desc_prc = pdvController
                  .checkbox1.value //total desconto em porcentagem
              ? double.parse(
                  pdvController.discountPercentage.value.toStringAsFixed(2))
              : double.parse(discountPercentagecb2Formated.toStringAsFixed(2))
          ..tot_desc_vlr =
              pdvController.checkbox1.value //total desconto em valor
                  ? double.parse(numbersDiscountFormated.toStringAsFixed(2))
                  : double.parse(numbersDiscountcb2Formated.toStringAsFixed(2))
          ..tot_liquido = pdvController.checkbox1.value //total liquido
              ? double.parse(
                  pdvController.totalcheckBox1.value.toStringAsFixed(2))
              : double.parse(
                  pdvController.totalcheckBox2.value.toStringAsFixed(2))
          ..valor_troco = pdvController.checkbox1.value //troco
              ? double.parse(pdvController.trocoCb1.value.toStringAsFixed(2))
              : double.parse(pdvController.trocoCb2.value.toStringAsFixed(2))
          ..status = 1 //status da venda
          ..id_serie_nfce = globalController.serieNfce //id serie nfce
          ..enviado = 0 //enviado (status de envio)
          ..cpf_cnpj = '000.000.000-00' //cpf cnpj do cliente
          ..id_caixa = globalController
              .caixaAberta; //id caixa aberto para o usuario logado

        !isConfirmation
            ? {pdvController.updateIsSelectedList(), Get.back()}
            : {
                await service
                    .insertVendaWithVendaItemAndCaixaItem(vendaExecutada),

                // volta a rota até o pdv e
                pdvController.updateIsSelectedList(),
                Get.back(),
                Get.back()
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
