import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseRegisterController extends GetxController {
  List<TextEditingController> textControllers = [];

  List<Map<String, dynamic>> closeRegister = [];

  void updateCloseRegister(String value, String tipo) {
    bool found = false;

    for (int i = 0; i < closeRegister.length; i++) {
      if (closeRegister[i]['tipo'] == tipo) {
        closeRegister[i]['value'] = value;
        found = true;
        break;
      }
    }

    if (!found) {
      closeRegister.add({'tipo': tipo, 'value': value});
    }

    print(closeRegister);
  }

  void createControllers(int index) {
    textControllers.add(TextEditingController());
    textControllers[index].text = '0,00';

    print(textControllers.length);
  }

  void clearListTextControllers() {
    textControllers.clear();
  }
}
