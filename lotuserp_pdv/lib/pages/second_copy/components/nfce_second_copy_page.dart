// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/loading_screen.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/pages/second_copy/services/logic_print.dart';

import '../../../collections/venda.dart';
import '../../../services/dependencies.dart';
import '../services/logic_situation_nfce.dart';
import 'legend_informations_nfce.dart';

class NfceSecondCopyPage extends StatelessWidget {
  const NfceSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationController = Dependencies.informationController();
    var checkboxController = Dependencies.checkboxController();
    informationController.searchVendas();

    // Constrói o botão de imprimir nfce
    Widget _buildButtonPrintNfce() {
      return Padding(
        padding: const EdgeInsets.all(6.5),
        child: InkWell(
          onTap: () async {
            Get.dialog(const LoadingScreen());
            await LogicSecondPrint()
                .printNfce(informationController.vendaSelecionada, context);
            Get.back();
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
              ],
            ),
          ),
        ),
      );
    }

    // Constrói a linha do botão de imprimir
    Widget _buildLineButtonPrint() {
      return Row(
        children: [
          _buildButtonPrintNfce(),
        ],
      );
    }

    // Constrói o valor total Liquido
    Widget _buildTotLiquid(venda vendaSelected) {
      return InformationsWidget(
          data: formatoBrasileiro.format(vendaSelected.tot_liquido),
          width: Get.width * 0.04);
    }

    // Constrói a hora da venda
    Widget _buildHour(venda vendaSelected) {
      return InformationsWidget(
          data: vendaSelected.hora, width: Get.width * 0.15);
    }

    // Constrói a situação da nfce se foi emitida "S" ou não "N"
    Widget _buildSituation(venda vendaSelected) {
      return InformationsWidget(
        data: LogicSituationNfce().get(vendaSelected),
        width: Get.width * 0.05,
      );
    }

    // Constrói o id da venda do Servidor
    Widget _buildIdVendaServer(venda vendaSelected) {
      return InformationsWidget(
          data: vendaSelected.id_venda, width: Get.width * 0.075);
    }

    // Constrói o Checkbox
    Widget _buildCheckBox(int index) {
      return Obx(
        () => Checkbox(
            shape: const CircleBorder(),
            value: checkboxController.isItemSelected(index),
            onChanged: (value) {
              checkboxController.toggleItem(index);
              informationController.setVendaSelecionada(
                  informationController.vendasLista[index]);
            }),
      );
    }

    // Constrói a linha das informações dos itens
    Widget _buildLinesData() {
      return Obx(
        () {
          var data = informationController.vendasLista;
          if (data.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              venda vendaSelected = data[index];

              // Substitua os campos abaixo pelos campos reais do seu modelo de dados
              return Column(
                children: [
                  Row(
                    children: [
                      _buildCheckBox(index),
                      _buildIdVendaServer(vendaSelected),
                      _buildSituation(vendaSelected),
                      _buildHour(vendaSelected),
                      _buildTotLiquid(vendaSelected),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    }

    // Constrói o corpo do popUp
    return SizedBox(
      height: Get.height * 0.765,
      child: Column(
        children: [
          // Legenda
          const LegendInformationsNfce(),
          const Divider(color: Colors.black12),
          //corpo
          Expanded(child: _buildLinesData()),
          const Divider(height: 1, color: Colors.black),
          _buildLineButtonPrint(),
        ],
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
