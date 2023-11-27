import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class FormWidgets {
  Widget textFieldWidget(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: CustomColors.customSwatchColor),
          ),
          prefixIcon: Icon(
            icon,
          ),
          labelText: text,
        ),
      ),
    );
  }

  Widget elevatedButtonWidget(String routeName, String text) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(routeName);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
