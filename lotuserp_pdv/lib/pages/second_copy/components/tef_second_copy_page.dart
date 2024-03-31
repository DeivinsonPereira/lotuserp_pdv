// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';

import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../payment/component/row_widget.dart';
import '../services/logic_print.dart';
import 'legend_informations_nfce.dart';

class TefSecondCopyPage extends StatelessWidget {
  const TefSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationController = Dependencies.informationController();
    var checkboxController = Dependencies.checkboxController();
    informationController.searchProofTEF();

    // Constrói o botão de impressão do TEF
    Widget _buildButtonPrintNfce() {
      return Padding(
        padding: const EdgeInsets.all(6.5),
        child: InkWell(
          onTap: () => LogicSecondPrint().printTef(),
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
                  Icons.credit_card,
                  color: Colors.white,
                ),
                Text(
                  'Imprimir\nTEF',
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
    Widget _buildTotLiquid(dynamic dataSelected) {
      return InformationsWidget(
          data: formatoBrasileiro.format(dataSelected.valor_doc),
          width: Get.width * 0.04);
    }

    // Constrói a hora da venda
    Widget _buildHour(dynamic dataSelected) {
      return InformationsWidget(
          data: DatetimeFormatterWidget.formatHour(dataSelected.data_lanca),
          width: Get.width * 0.195);
    }

    // COnstrói o id da venda do tef
    Widget _buildIddataSelectedServer(dynamic dataSelected) {
      return InformationsWidget(
          data: dataSelected.id_venda, width: Get.width * 0.075);
    }

    // Constrói o Checkbox
    Widget _buildCheckBox(int index) {
      return Obx(
        () => Checkbox(
          shape: const CircleBorder(),
          value: checkboxController.isItemSelected(index),
          onChanged: (value) => checkboxController.toggleItem(index),
        ),
      );
    }

    // Constrói a linha das informações dos itens
    Widget _buildLinesData() {
      return Obx(
        () {
          var data = informationController.vendasTef;
          if (data.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var dataSelected = data[index];
              // Substitua os campos abaixo pelos campos reais do seu modelo de dados
              return Column(
                children: [
                  Row(
                    children: [
                      _buildCheckBox(index),
                      _buildIddataSelectedServer(dataSelected),
                      _buildHour(dataSelected),
                      _buildTotLiquid(dataSelected),
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
