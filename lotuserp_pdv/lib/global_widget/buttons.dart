import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

class ButtonsWidgets {
  var enteredNumberDiscount = '';

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  PdvController controller = Get.find();

  var formatoBrasileiro = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
  );

  Widget iconBackspace() {
    return Container(
      width: 150,
      height: 37,
      child: InkWell(
        onTap: () {
          controller.removeNumberDiscount();
        },
        child: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildNumberButton(String number) {
    return InkWell(
      onTap: () {
        controller.addNumberDiscount(number);
      },
      child: Container(
        width: 150,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }

  Widget buildStartNumberButton(String number) {
    return InkWell(
      onTap: () {
        controller.addNumberDiscount(number);
      },
      child: Container(
        width: 150,
        child: Text(
          number,
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 112, 112, 112),
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  //checkbox para Subtotal
 
}
