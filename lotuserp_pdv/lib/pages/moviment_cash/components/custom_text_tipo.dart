// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';

class CustomTextTipo extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextTipo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovimentRegisterController movimentController = Get.find();

    movimentController.tipoDeMovimentoController.text = 'Crédito';
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15, top: 0, bottom: 0),
          isCollapsed: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 28,
            ),
            onSelected: (value) {
              movimentController.tipoDeMovimentoController.text =
                  value.toString();
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Crédito',
                child: Text('Crédito', style: TextStyle(fontSize: 22)),
              ),
              const PopupMenuItem<String>(
                value: 'Débito',
                child: Text('Débito', style: TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
        readOnly: true,
      ),
    );
  }
}
