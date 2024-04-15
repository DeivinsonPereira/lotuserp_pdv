// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/service/logic/logic_navigation_to_config.dart';
import 'package:pinput/pinput.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/custom_elevated_button.dart';

import '../../../../services/dependencies.dart';
import '../../../common/custom_text_style.dart';
import '../../../common/header_popup.dart';

class VerifyPasswordDialog extends StatelessWidget {
  final int password;
  const VerifyPasswordDialog({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var adminConfigController = Dependencies.adminConfigController();

    // Constrói o botão de confirmação
    Widget _buildConfirmButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          function: () async =>
              await LogicNavigationToConfig().goToConfig(context, password),
          color: CustomColors.confirmButtonColor,
          text: 'Confirmar',
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
            Get.back();
            adminConfigController.clearPasswordConfigController();
          },
          color: CustomColors.informationBox,
          text: 'Voltar',
          textStyle: CustomTextStyles().whiteBoldTextStyle(),
          radious: 0,
        ),
      );
    }

    // Constrói a linha do botão de voltar e de confirmação
    Widget _buildBackAndContinueButton() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(
          child: _buildConfirmButton(),
        )
      ]);
    }

    // Constrói o input de senha
    Widget _buildPinput() {
      return Pinput(
        length: 6,
        //  obscureText: true,
        autofocus: true,
        controller:
            Dependencies.adminConfigController().passwordConfigController,
        keyboardType: TextInputType.phone,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );
    }

    // Constrói o texto do popUp
    Widget _buildText() {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Text(
          'Confirme sua senha',
          style: CustomTextStyles().blackBoldTextStyle(),
        ),
      );
    }

    // Constrói o corpo do popup de verificação de senha
    Widget _buildBody() {
      return Column(children: [
        HeaderPopupMonitor(
            text: 'CONFIRMAR SENHA', icon: Icons.lock, isCpfCnpj: true),
        _buildText(),
        Expanded(child: _buildPinput()),
        _buildBackAndContinueButton(),
      ]);
    }

    // Constrói o dialog de verificação de senha
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
