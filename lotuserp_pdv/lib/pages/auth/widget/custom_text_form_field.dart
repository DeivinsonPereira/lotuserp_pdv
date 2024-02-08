// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/config_controller.dart';
import '../../../services/dependencies.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final String variableName;
  bool? numericKeyboard;
  bool? useIconButton;
  bool? isUrl;
  bool? isSpeed;
  bool? isNome;

  CustomTextFormField({
    Key? key,
    required this.icon,
    this.controller,
    required this.variableName,
    this.numericKeyboard = false,
    this.useIconButton = false,
    this.isUrl = false,
    this.isSpeed = false,
    this.isNome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.textFieldController();
    Configcontroller configController = Dependencies.configcontroller();

    //Cria um campo de texto com o iconButton
    Widget _useIconButton() {
      return Container(
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          onPressed: () async =>
              configController.verificationEmpty(controller!, context),
        ),
      );
    }

    // cria um campo de texto padrão sem o iconButton
    Widget _noUseIconButton() {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
      );
    }

    // cria o campo de texto
    Widget _buildTextField() {
      return TextFormField(
        controller: controller,
        keyboardType: numericKeyboard! ? TextInputType.number : null,
        decoration: InputDecoration(
          labelText: variableName,
          prefixIcon: useIconButton! ? _useIconButton() : _noUseIconButton(),
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
        ),
      );
    }

    // Constrói o formulário
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5),
      child: SizedBox(
        width: isUrl == true
            ? 700
            : isSpeed == true
                ? 156
                : isNome == true
                    ? 317
                    : Get.width * 0.1165,
        child: _buildTextField(),
      ),
    );
  }
}
