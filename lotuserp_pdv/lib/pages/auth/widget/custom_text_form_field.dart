// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import '../../../controllers/config_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../services/injection_dependencies.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final String variableName;
  bool? numericKeyboard;
  bool? useIconButton;

  CustomTextFormField({
    Key? key,
    required this.icon,
    this.controller,
    required this.variableName,
    this.numericKeyboard = false,
    this.useIconButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.textFieldController();
    Configcontroller configController = Dependencies.configcontroller();

    // cria o texto da legenda do TextField
    Widget _buildTextOfLegend() {
      return Text(
        variableName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    //Cria um campo de texto com o iconButton
    Widget _useIconButton() {
      return Container(
        width: 50,
        decoration: BoxDecoration(
          color: CustomColors.customSwatchColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: () async => configController.verification(controller!),
        ),
      );
    }

    // cria um campo de texto padrão sem o iconButton
    Widget _noUseIconButton() {
      return Container(
        width: 50,
        decoration: BoxDecoration(
          color: CustomColors.customSwatchColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      );
    }

    // cria o campo de texto
    Widget _buildTextField() {
      return TextFormField(
        controller: controller,
        keyboardType: numericKeyboard! ? TextInputType.number : null,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: useIconButton! ? _useIconButton() : _noUseIconButton(),
          ),
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
      );
    }

    // Constrói o formulário
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15,
        bottom: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 510,
            child: _buildTextOfLegend(),
          ),
          _buildTextField(),
        ],
      ),
    );
  }
}
