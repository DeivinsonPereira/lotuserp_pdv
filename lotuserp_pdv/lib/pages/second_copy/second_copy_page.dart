// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/second_copy/components/identify_button.dart';

import '../../services/dependencies.dart';
import 'components/custom_elevated_button_second_copy.dart';
import '../common/header_popup.dart';
import 'services/logic_presentation_page.dart';

class SecondCopyPage extends StatelessWidget {
  const SecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationController = Dependencies.informationController();
    var checkboxController = Dependencies.checkboxController();

    // Constrói o botão NFCE
    Widget _buildNFCEButton() {
      return SizedBox(
        height: Get.size.height * 0.065,
        child: CustomElevatedButtonSecondCopy(
          text: 'NFCE',
          function: () {
            checkboxController.setSelectOption(
              IdentifyButton.NFCE.index,
            );
            checkboxController.selectedItem.value = -1;
          },
          isNFCE: true,
        ),
      );
    }

    // Constrói o botão TEF
    Widget _buildTEFButton() {
      return SizedBox(
        height: Get.size.height * 0.065,
        child: CustomElevatedButtonSecondCopy(
          text: 'TEF',
          function: () {
            checkboxController.setSelectOption(IdentifyButton.TEF.index);
            checkboxController.selectedItem.value = -1;
          },
          isNFCE: false,
        ),
      );
    }

    // Constrói a linha de botões NFCE e TEF
    Widget _buildLineButtons() {
      return Container(
        color: Colors.yellow,
        child: Row(children: [
          Expanded(child: _buildNFCEButton()),
          Expanded(child: _buildTEFButton()),
        ]),
      );
    }

    // Constrói o header do popup
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

    // Constrói o corpo do popup
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          _buildLineButtons(),
          LogicPresentationPage().getPage(),
        ],
      );
    }

    // Constrói o popup
    return Dialog(
      child: Container(
          height: Get.height * 0.9, // 500,
          width: 500,
          color: Colors.white,
          child: _buildBody()),
    );
  }
}
