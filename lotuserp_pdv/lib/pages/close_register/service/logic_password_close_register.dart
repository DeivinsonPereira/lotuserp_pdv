// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/pages/common/loading_screen.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/utils/methods/password_close_register/password_close_register_features.dart';
import '../close_register_page.dart';
import '../components/confirm_password_close_register.dart';
import 'logic/interface/i_password_close_register.dart';

class LogicPasswordCloseRegister implements IPasswordCloseRegister {
  final _closeRegisterController = Dependencies.closeRegisterController();
  final _passwordCloseRegisterController =
      Dependencies.passwordCloseRegisterController();
  final _passwordCloseRegisterFeatures = PasswordCloseRegisterFeatures();

  @override
  // logica para fazer a navegação para a confirmação de senha
  Future<void> navigationToConfirmPassword(BuildContext context) async {
    bool result = await _passwordCloseRegisterFeatures.savePassword(context);
    if (!result) {
      return;
    }

    _openConfirmDialog();
  }

  @override
  //Logica para navegar para a tela de fechamento
  Future<void> navigationToCloseRegister(BuildContext context) async {
    if (_passwordCloseRegisterFeatures.passwordIncorrectFill()) {
      const CustomCherryError(message: 'Preencha todos os campso corretamente')
          .show(context);
      return;
    }

    if (!_verifyPassword()) {
      const CustomCherryError(message: 'Senha inválida. Tente novamente')
          .show(context);
      return;
    }

    _openCloseRegisterPage();
  }

  // Verifica se a senha é valida para entrar nas configurações
  bool _verifyPassword() {
    return _passwordCloseRegisterController.password ==
        _passwordCloseRegisterController.passwordController.text;
  }

  // Executa a navegação para a tela de confirmação
  void _openConfirmDialog() {
    _passwordCloseRegisterFeatures.getPassword();
    _passwordCloseRegisterFeatures.clearPasswordController();
    Get.back();
    Get.dialog(const LoadingScreen());
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
      Get.dialog(const ConfirmPasswordCloseRegister());
    });
  }

  // Executa a navegação para a tela de fechamento de caixa
  void _openCloseRegisterPage() {
    _closeRegisterController.isButtonEnabled.value = true;
    _closeRegisterController.autoFillControllers();
    _passwordCloseRegisterFeatures.clearPasswordController();
    _passwordCloseRegisterFeatures.clearPassword();
    Get.back();
    Get.dialog(const CloseRegisterPage());
  }
}
