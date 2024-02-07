// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/pages/second_copy/component/checkbox_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/dependencies.dart';
import '../../services/print_xml.dart/print_nfce_xml.dart';
import '../common/header_popup.dart';
import 'component/legend_informations_nfce.dart';

class NfceSecondCopyPage extends StatelessWidget {
  const NfceSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    InformationController informationController =
        Dependencies.informationController();
    CheckboxController checkboxController = Dependencies.checkboxController();
    Logger logger = Logger();

    return Dialog(
      child: Container(
        height: Get.height * 0.667, // 500,
        width: 500,
        color: Colors.white,
        child: Column(
          children: [
            //HEADER
            Obx(() => HeaderPopup(
                  text:
                      'Vendas do caixa: ${informationController.caixaId.value.toString().padLeft(5, '0')}',
                  icon: Icons.receipt,
                  nfce: true,
                )),

            // Legenda
            const LegendInformationsNfce(),

            const Divider(
              color: Colors.black12,
            ),
            //corpo
            Expanded(
              child: Obx(() {
                var data = informationController.vendasLista;
                if (data.isEmpty) {
                  return const SizedBox.shrink();
                }
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var venda = data[index];
                      // Substitua os campos abaixo pelos campos reais do seu modelo de dados
                      return Column(
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    shape: const CircleBorder(),
                                    value: checkboxController
                                        .isItemSelected(index),
                                    onChanged: (value) =>
                                        checkboxController.toggleItem(index),
                                  )),
                              InformationsWidget(
                                  data: venda.id_venda_servidor,
                                  width: Get.width *
                                      0.075), // Ajuste conforme necessário
                              InformationsWidget(
                                  data: venda.hora,
                                  width: Get.width *
                                      0.195), // Ajuste conforme necessário
                              InformationsWidget(
                                  data: formatoBrasileiro
                                      .format(venda.tot_liquido),
                                  width: Get.width *
                                      0.04), // Ajuste conforme necessário
                            ],
                          ),
                        ],
                      );
                    });
              }),
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(6.5),
                child: InkWell(
                  onTap: () async {
                    if (checkboxController.selectedItem.value != -1) {
                      var data = await service.getVendaById(
                          checkboxController.selectedItem.value + 1);
                      if (data != null) {
                        var nfce = await service.getDadosNfceByIdVendaServidor(
                            data.id_venda_servidor);

                        if (nfce != null) {
                          var configController =
                              Dependencies.configcontroller();
                          var tamanhoImpressora =
                              configController.tamanhoImpressora.value;
                          if (tamanhoImpressora != 'SEM IMPRESSORA') {
                            PrintNfceXml().printNfceXml(xmlArgs: nfce.xml);
                          }
                        } else {
                          logger.e('Nfce não encontrada');
                        }
                      } else {
                        logger.e('Venda não encontrada');
                      }
                    } else {
                      logger.e('Selecione uma venda');
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          color: CustomColors.customSwatchColor),
                      width: 100,
                      height: Get.height * 0.108,
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                            Text(
                              'Imprimir\nNFCe',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ])),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class InformationsWidget extends StatelessWidget {
  final dynamic data;
  final double width;
  const InformationsWidget({
    Key? key,
    required this.data,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          data.toString(),
        ),
      ),
    );
  }
}
