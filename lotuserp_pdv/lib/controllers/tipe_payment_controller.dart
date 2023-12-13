import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipePaymentController extends GetxController{

  TextEditingController tipoPaymentController = TextEditingController();

  var tipoPayment = ''.obs;
  
  //adiciona o valor no campo tipoPayment
  void updateTipoPayment(String value) {
    tipoPayment.value = value;
  }

  //limpa o campo tipoPayment
  void clear() {
    tipoPaymentController.clear();
    tipoPayment.value = '';
  }
}
