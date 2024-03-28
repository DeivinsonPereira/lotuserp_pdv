// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/pages/second_copy/services/logic_print.dart';

import '../../services/dependencies.dart';
import '../common/header_popup.dart';
import 'components/legend_informations_nfce.dart';

class NfceSecondCopyPage extends StatelessWidget {
  const NfceSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationController = Dependencies.informationController();
    var checkboxController = Dependencies.checkboxController();
    informationController.searchVendas();

    Widget _buildButtonPrintNfce() {
      return Padding(
        padding: const EdgeInsets.all(6.5),
        child: InkWell(
          onTap: () async => LogicSecondPrint().printNfce(),
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
    Widget _buildTotLiquid(dynamic venda) {
      return InformationsWidget(
          data: formatoBrasileiro.format(venda.tot_liquido),
          width: Get.width * 0.04);
    }

    // Constrói a hora da venda
    Widget _buildHour(dynamic venda) {
      return InformationsWidget(data: venda.hora, width: Get.width * 0.195);
    }

    // COnstrói o id da venda do Servidor
    Widget _buildIdVendaServer(dynamic venda) {
      return InformationsWidget(
          data: venda.id_venda_servidor, width: Get.width * 0.075);
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
                      _buildCheckBox(index),
                      _buildIdVendaServer(venda),
                      _buildHour(venda),
                      _buildTotLiquid(venda),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    }

    // Constrói o Header
    Widget _buildHeader() {
      return //HEADER
          Obx(
        () => HeaderPopupMonitor(
          text:
              'Vendas do caixa: ${informationController.caixaId.value.toString().padLeft(5, '0')}',
          icon: Icons.receipt,
          nfce: true,
        ),
      );
    }
    
    // Constrói o corpo do popUp
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          
          // Legenda
          const LegendInformationsNfce(),
          const Divider(color: Colors.black12),
          //corpo
          Expanded(child: _buildLinesData()),
          const Divider(height: 1, color: Colors.black),
          _buildLineButtonPrint(),
        ],
      );
    }

    // Constrói o popUp
    return Dialog(
      child: Container(
          height: Get.height * 0.9, // 500,
          width: 500,
          color: Colors.white,
          child: _buildBody()),
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
