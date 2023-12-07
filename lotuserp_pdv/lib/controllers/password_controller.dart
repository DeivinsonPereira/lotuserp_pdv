import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
    final passwordController = TextEditingController();
    final userController = TextEditingController();
    
    var hashedPassword = ''.obs;
    var user = ''.obs;
  

  void createHashedPassword() {
    var bytes = utf8.encode(passwordController.text);
    var hashedPassword = sha256.convert(bytes);
    this.hashedPassword.value = hashedPassword.toString();
  }

  void clear() {
    passwordController.clear();
    hashedPassword.value = '';
  }

  void updateUsername(String value) {
    user.value = value;
  }
  
}