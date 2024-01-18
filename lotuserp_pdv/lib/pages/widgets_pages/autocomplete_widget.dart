// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/password_controller.dart';
import '../../core/custom_colors.dart';
import '../../services/format_txt.dart';
import '../../services/injection_dependencies.dart';

class AutocompleteWidget extends StatelessWidget {
  final String usuario;
  final IconData icon;
  final PasswordController controller;
  const AutocompleteWidget({
    Key? key,
    required this.usuario,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Dependencies.loginController();

    //estilização do autocomplete
    Widget _autoCompleteStyle(
        Iterable<String> options, AutocompleteOnSelected<String> onSelected) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4.0,
          child: SizedBox(
            width: 300,
            height: 150,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final String option = options.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: ListTile(
                    title: Text(option),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    /// Cria o textField com ícone.
    Widget _textFieldBuilderAutocomplete(
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
        String usuario,
        IconData icon) {
      return TextField(
        onChanged: (value) {
          controller.userController.text = value;
        },
        inputFormatters: [UpperCaseTxt()],
        controller: fieldTextEditingController,
        focusNode: fieldFocusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: CustomColors.customSwatchColor),
          ),
          labelText: usuario,
          prefixIcon: Icon(icon),
        ),
      );
    }

    // Corpo do autocomplete
    return FutureBuilder<List<String>>(
      future: loginController.getUsers(),
      builder: (context, snapshot) {
        return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return snapshot.data!.where((String option) {
              return option
                  .toUpperCase()
                  .startsWith(textEditingValue.text.toUpperCase());
            });
          },
          onSelected: (String selection) {
            controller.userController.text = selection;
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) => // textfield
              _textFieldBuilderAutocomplete(
            context,
            fieldTextEditingController,
            fieldFocusNode,
            onFieldSubmitted,
            usuario,
            icon,
          ),
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return _autoCompleteStyle(options, onSelected);
          },
        );
      },
    );
  }
}
