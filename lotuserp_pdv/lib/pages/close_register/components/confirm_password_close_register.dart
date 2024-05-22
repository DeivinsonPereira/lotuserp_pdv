// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../../utils/methods/password_close_register/password_close_register_features.dart';
import '../../common/custom_elevated_button.dart';
import '../../common/custom_text_style.dart';
import '../../common/header_popup.dart';
import '../service/logic_password_close_register.dart';

class ConfirmPasswordCloseRegister extends StatelessWidget {
  const ConfirmPasswordCloseRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final _passwordcloseRegisterController =
        Dependencies.passwordCloseRegisterController();
    final _passwordCloseRegisterFeatures = PasswordCloseRegisterFeatures();

    Widget _buildContinueButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          function: () async {
            LogicPasswordCloseRegister().navigationToCloseRegister(context);
          },
          color: CustomColors.confirmButtonColor,
          text: 'Confirmar',
          textStyle: CustomTextStyles().blackBoldTextStyle(),
          radious: 0,
        ),
      );
    }

    Widget _buildBackButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          function: () {
            _passwordCloseRegisterFeatures.clearPasswordController();
            Get.back();
          },
          color: CustomColors.informationBox,
          text: 'VOLTAR',
          textStyle: CustomTextStyles().whiteBoldTextStyle(),
          radious: 0,
        ),
      );
    }

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

    Widget _buildPasswordField() {
      return Pinput(
        length: 6,
        controller: _passwordcloseRegisterController.passwordController,
        defaultPinTheme: PinTheme(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autofocus: true,
      );
    }

    Widget _buildText() {
      return SizedBox(
        height: Get.size.height * 0.15,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              'Confirme a sua senha',
              style: CustomTextStyles().blackTextStyle(fontSize: 20),
            )),
      );
    }

    _buildContent() {
      return Column(
        children: [
          _buildText(),
          _buildPasswordField(),
        ],
      );
    }

    Widget _buildHeader() {
      return HeaderPopupMobile(text: 'CONFIRMAR SENHA', icon: Icons.lock);
    }

    Widget _buildBody() {
      return Column(children: [
        _buildHeader(),
        Expanded(child: _buildContent()),
        _buildBackAndContinueButton(),
      ]);
    }

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
          height: Get.size.height * 0.5,
          width: Get.size.width * 0.5,
          child: _buildBody()),
    );
  }
}
