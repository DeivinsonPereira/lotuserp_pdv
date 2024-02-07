// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';

import '../../services/dependencies.dart';

class PrinterPopup extends StatelessWidget {
  final VoidCallback onPrint;
  const PrinterPopup({
    Key? key,
    required this.onPrint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var printerPopupController = Dependencies.printerPopupController();

    // Construção do cabeçalho do popup
    Widget _buildHeader() {
      return HeaderPopup(text: 'Imprimir', icon: Icons.print);
    }

    //Construção do corpo do popup
    Widget _buildBody() {
      return const Expanded(
        child: Center(
          child: Text(
            'Deseja imprimir o espelho da movimentação?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    //construção do botão de imprimir
    Widget _buildButtonPrinter() {
      return Obx(() => Expanded(
            child: Container(
              height: 60,
              color: printerPopupController.isButtonEnabled.value == false
                  ? Colors.grey[300]
                  : CustomColors.confirmButtonColor,
              child: TextButton(
                onPressed: printerPopupController.isButtonEnabled.value == false
                    ? null
                    : onPrint,
                child: Text(
                  'Imprimir',
                  style: TextStyle(
                      color:
                          printerPopupController.isButtonEnabled.value == false
                              ? Colors.white
                              : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ));
    }

    //construção do botão de voltar
    Widget _buildButtonBack() {
      return Expanded(
        child: Container(
          height: 60,
          color: CustomColors.informationBox,
          child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Voltar',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      );
    }

    //construção da linha de botões
    Widget _buildButtons() {
      return Row(children: [
        _buildButtonBack(),
        _buildButtonPrinter(),
      ]);
    }

    //construção do popup
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 350,
          width: 350,
          child: Column(
            children: [
              _buildHeader(),
              _buildBody(),
              _buildButtons(),
            ],
          ),
        ));
  }
}
