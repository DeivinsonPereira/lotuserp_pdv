import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminConfigController extends GetxController{
  TextEditingController passwordConfigController = TextEditingController();


  void clearPasswordConfigController() {
    passwordConfigController.clear();
  }
}