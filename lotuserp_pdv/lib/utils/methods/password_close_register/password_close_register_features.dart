import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/password_close_register/password_close_register_repository.dart';

import '../../../collections/password_close_register.dart';
import '../../../pages/common/custom_cherry.dart';

class PasswordCloseRegisterFeatures {
  final _passwordCloseRegisterController =
      Dependencies.passwordCloseRegisterController();
  final _passwordCloseRegisterRepository = PasswordCloseRegisterRepository();

  PasswordCloseRegisterFeatures._privateConstructor();

  static final PasswordCloseRegisterFeatures _instance =
      PasswordCloseRegisterFeatures._privateConstructor();

  factory PasswordCloseRegisterFeatures() => _instance;

  Future<bool> savePassword(BuildContext context) async {
    if (passwordIncorrectFill()) {
      const CustomCherryError(message: 'Por favor, preencha todos os campos.')
          .show(context);
      return false;
    }

    await _passwordCloseRegisterRepository
        .insert(_passwordCloseRegisterController.passwordController.text);
    await getPassword();
    return true;
  }

  Future<password_close_register?> getPassword() async {
    return await _passwordCloseRegisterRepository.getPassword();
  }

  bool passwordIncorrectFill() {
    return _passwordCloseRegisterController.passwordController.text.isEmpty ||
        _passwordCloseRegisterController.passwordController.text.length < 6;
  }

  void updatePassword(String value) =>
      _passwordCloseRegisterController.password = value;

  void clearPasswordController() =>
      _passwordCloseRegisterController.passwordController.text = '';
  void clearPassword() => _passwordCloseRegisterController.password = '';
  void clearAll() {
    clearPasswordController();
    clearPassword();
  }
}
