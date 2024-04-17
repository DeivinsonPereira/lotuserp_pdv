// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/custom_elevated_button.dart';
import 'package:lotuserp_pdv/pages/common/custom_text_style.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';
import 'package:pinput/pinput.dart';

import '../../../../services/dependencies.dart';
import '../service/logic/logic_navigation_to_config.dart';

class CreatePasswordDialog extends StatelessWidget {
  const CreatePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var adminConfigController = Dependencies.adminConfigController();

    // Constrói o texto do popUp
    Widget _buildText() {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Text(
          'Insira uma nova senha',
          style: CustomTextStyles().blackBoldTextStyle(),
        ),
      );
    }

    // Constrói o input de senha
    Widget _buildPinput() {
      return Padding(
        padding: EdgeInsets.only(bottom: Get.size.height * 0.1),
        child: Pinput(
          length: 6,
          //  obscureText: true,
          autofocus: true,
          controller: adminConfigController.passwordConfigController,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      );
    }

    // Constrói o botão de cadastrar a senha no banco de dados
    Widget _buildContinueButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          function: () async =>
              await LogicNavigationToConfig().savePassword(context),
          color: CustomColors.confirmButtonColor,
          text: 'CADASTRAR',
          textStyle: CustomTextStyles().blackBoldTextStyle(),
          radious: 0,
        ),
      );
    }

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          function: () {
            adminConfigController.clearPasswordConfigController();
            Get.back();
          },
          color: CustomColors.informationBox,
          text: 'VOLTAR',
          textStyle: CustomTextStyles().whiteBoldTextStyle(),
          radious: 0,
        ),
      );
    }

    // Constrói a linha dos botões de voltar e confirmar
    Widget _buildBackAndContinueButton() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(
          child: _buildContinueButton(),
        ),
      ]);
    }

    // Constrói o corpo do popup
    Widget _buildBody() {
      return Column(children: [
        HeaderPopupMonitor(
            text: 'CRIAR SENHA', icon: Icons.lock, isCpfCnpj: true),
        _buildText(),
        Expanded(child: _buildPinput()),
        _buildBackAndContinueButton(),
      ]);
    }

    // Constrói o corpo do popup
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
            color: Colors.white,
            width: Get.size.width * 0.4,
            height: Get.size.height * 0.5,
            child: _buildBody()));
  }
}
