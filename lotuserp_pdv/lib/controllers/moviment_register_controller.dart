import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentRegisterController extends GetxController {
  TextEditingController openRegisterController = TextEditingController();
  TextEditingController closeRegisterController = TextEditingController();
  TextEditingController movimentRegisterController = TextEditingController();

  RxString openRegister = '0,0'.obs;

  RxDouble closeRegister = 0.0.obs;

  RxDouble movimentRegister = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    openRegisterController = TextEditingController();
    openRegisterController.text = '0,00';

    openRegisterController.addListener(() {
      String text = openRegisterController.text.replaceAll(',', '');
      if (text.isNotEmpty) {
        double value = double.parse(text) / 100;
        String formattedValue = value.toStringAsFixed(2).replaceAll('.', ',');
        openRegisterController.value = TextEditingValue(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );
      }
    });
  }

  @override
  void onClose() {
    openRegisterController.dispose();
    super.onClose();
  }

  //open register
  void openRegisterValue() {
    if (openRegisterController.text.isEmpty) {
      openRegisterController.text = '0.0';
    }
    String value = openRegisterController.text;
    openRegister.value = value;
  }

  //close register
  void closeRegisterValue() {
    closeRegister.value = double.parse(closeRegisterController.text);
  }

  //moviment register
  void movimentRegisterValue() {
    movimentRegister.value = double.parse(movimentRegisterController.text);
  }

  //Clear All
  void clear() {
    openRegisterController.clear();
    closeRegisterController.clear();
    movimentRegisterController.clear();
  }

  //Clear Open Register
  void clearOpenRegister() {
    openRegisterController.clear();
  }

  //Clear Close Register
  void clearCloseRegister() {
    closeRegisterController.clear();
  }

  //Clear Moviment Register
  void clearMovimentRegister() {
    movimentRegisterController.clear();
  }
}
