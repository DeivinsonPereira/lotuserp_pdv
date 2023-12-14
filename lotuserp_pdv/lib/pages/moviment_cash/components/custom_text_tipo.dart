// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/pages/moviment_cash/components/popup_menu.dart';

class CustomTextTipo extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextTipo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovimentRegisterController movimentController = Get.find();

    movimentController.tipoDeMovimentoController.text = 'CREDITO';
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
          isCollapsed: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: PopupMenuMoviment(),
        ),
        readOnly: true,
      ),
    );
  }
}
