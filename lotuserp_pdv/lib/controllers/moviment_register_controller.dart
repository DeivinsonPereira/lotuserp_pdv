import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentRegisterController extends GetxController {
  
  TextEditingController openRegisterController = TextEditingController();
  TextEditingController closeRegisterController = TextEditingController();
  TextEditingController movimentRegisterController = TextEditingController();

  RxDouble openRegister = 0.0.obs;

  RxDouble closeRegister = 0.0.obs;

  RxDouble movimentRegister = 0.0.obs;


  //open register
  void openRegisterValue() {

    openRegister.value = double.parse(openRegisterController.text);
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
