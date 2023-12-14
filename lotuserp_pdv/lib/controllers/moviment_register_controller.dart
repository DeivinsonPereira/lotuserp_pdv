import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentRegisterController extends GetxController {
  TextEditingController openRegisterController = TextEditingController();
  TextEditingController closeRegisterController = TextEditingController();
  TextEditingController movimentRegisterController = TextEditingController();
  TextEditingController formaDePagamentoController = TextEditingController();
  TextEditingController tipoDeMovimentoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int formaPagamentoId = 1;

  String openRegister = '0,00';

  RxDouble closeRegister = 0.0.obs;

  String movimentRegister = '0,00';

  RxString tipoMovimento = 'CREDITO'.obs;

  RxString formaPagamento = 'DINHEIRO'.obs;

  @override
  void onInit() {
    super.onInit();
    openRegisterController = TextEditingController();
    openRegisterController.text = '0,00';
    movimentRegisterController.text = '0,00';

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

    movimentRegisterController.addListener(() {
      String text = movimentRegisterController.text.replaceAll(',', '');
      if (text.isNotEmpty) {
        double value = double.parse(text) / 100;
        String formattedValue = value.toStringAsFixed(2).replaceAll('.', ',');
        movimentRegisterController.value = TextEditingValue(
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

  //crie um método para trasformar o valor guardado no openRegister que é uma string para double, transformando antes virgula em ponto
  double movimentRegisterToDouble() {
    String movimentRegister = movimentRegisterController.text;
    movimentRegister = movimentRegister.replaceAll(',', '.');
    return double.parse(movimentRegister);
  }

  double openRegisterToDouble() {
    String openRegister = openRegisterController.text;
    openRegister = openRegister.replaceAll(',', '.');
    return double.parse(openRegister);
  }

  //open register
  void openRegisterValue() {
    if (openRegisterController.text.isEmpty) {
      openRegisterController.text = '0.0';
    }
    String value = openRegisterController.text;
    openRegister = value;
  }

  //close register
  void closeRegisterValue() {
    closeRegister.value = double.parse(closeRegisterController.text);
  }

  //moviment register
  void movimentRegisterValue() {
    if (movimentRegisterController.text.isEmpty) {
      movimentRegisterController.text = '0.0';
    }
    String value = movimentRegisterController.text;
    openRegister = value;
  }

  //Clear All
  void clear() {
    openRegisterController.clear();
    closeRegisterController.clear();
    movimentRegisterController.clear();
  }

  //Clear Open Register
  void clearOpenRegister() {
    openRegisterController.text = '0,00';
  }

  //Clear Close Register
  void clearCloseRegister() {
    closeRegisterController.clear();
  }

  //Clear Moviment Register and description
  void clearMovimentRegister() {
    movimentRegisterController.text = '0,00';
    descriptionController.clear();
  }
}
