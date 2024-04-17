// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/auth/login_pages/service/logic/logic_verify_password.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/components/verify_password_dialog.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/admin_config/insert_admin_config.dart';

import '../../../../../collections/admin_config.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../shared/admin_config/get_admin_config.dart';

class LogicNavigationToConfig {
  var adminConfigController = Dependencies.adminConfigController();
  var passwordController = Dependencies.passwordController();
  var configController = Dependencies.configcontroller();

  // Cadastra a senha no banco de dados
  Future<void> savePassword(BuildContext context) async {
    if (LogicVerifyPassword().verify()) {
      var result = await InsertAdminConfig().insertPassword();

      if (result) {
        Get.back();
        adminConfigController.clearPasswordConfigController();
        admin_config? password = await GetAdminConfig().getAdmin();
        if (password != null) {
          Get.dialog(
              barrierDismissible: false,
              VerifyPasswordDialog(password: password.senha));
        } else {
          const CustomCherryError(
                  message: 'Erro ao cadastrar a senha. Tente novamente')
              .show(context);
        }
      }
    } else {
      const CustomCherryError(
              message: 'Erro ao cadastrar a senha. Tente novamente')
          .show(context);
    }
  }

  Future<void> goToConfig(BuildContext context, int password) async {
    if (adminConfigController.passwordConfigController.text.length == 6) {
      if (password ==
          int.parse(adminConfigController.passwordConfigController.text)) {
        passwordController.userController.clear();
        passwordController.passwordController.clear();
        await configController.loadUsbName();
        Get.back();
        Get.toNamed(PagesRoutes.configRoute);
        adminConfigController.clearPasswordConfigController();
      } else {
        const CustomCherryError(message: 'Senha inválida. Tente novamente')
            .show(context);
        adminConfigController.clearPasswordConfigController();
      }
    } else {
      const CustomCherryError(message: 'Senha inválida. Tente novamente')
          .show(context);
      adminConfigController.clearPasswordConfigController();
    }
  }
}
