import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  
  var hashedPassword = ''.obs;
  var user = ''.obs;

  String createHashedPassword() {
    var bytes = utf8.encode(passwordController.text);
    var hashedPassword = md5.convert(bytes);

    var passwordteste =
        this.hashedPassword.value = hashedPassword.toString().toUpperCase();
    return passwordteste;
  }

  void clear() {
    passwordController.clear();
    hashedPassword.value = '';
  }

  void updateUsername(String value) {
    user.value = value;
  }
}
