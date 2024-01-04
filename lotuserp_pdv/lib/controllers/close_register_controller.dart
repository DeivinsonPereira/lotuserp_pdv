import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseRegisterController extends GetxController {
  TextEditingController closeRegisterController = TextEditingController();

  RxList closeRegister = [].obs;

  void updateCloseRegister(String value) {
    if (double.parse(value) > 0.0) {
      closeRegister.add(double.parse(value));
      print(closeRegister);
    }
  }
}
