import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/login_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../services/format_txt.dart';
import '../../services/injection_dependencies.dart';

class FormWidgets {
  final TextEditingController _controller = TextEditingController();
  final LoginController loginController = Dependencies.loginController();
  final PasswordController passwordController =
      Dependencies.passwordController();

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

  Widget textFieldNumberWidget(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
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
          controller: _controller,
          validator: (value) {
            RegExp regExp = RegExp(r"^[0-9,.]*$");
            if (!regExp.hasMatch(value!)) {
              return "Somente números e virgula são permitidos";
            }
            return null;
          }),
    );
  }

  Widget elevatedButtonWidget(String routeName, String text) {
    return ElevatedButton(
      onPressed: () => Get.toNamed(routeName),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget customAutocompleteTextField(String usuario, IconData icon) {
    return FutureBuilder<List<String>>(
      future: loginController.getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Nenhum usuário encontrado.');
        }

        return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return snapshot.data!.where((String option) {
              return option
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            passwordController.userController.text = selection;
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) {
            passwordController.userController.text =
                fieldTextEditingController.text;
            return TextField(
              onChanged: (value) {
                passwordController.userController.text = value;
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
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
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
          },
        );
      },
    );
  }

  Widget customTextFieldIcon(IconData icon, String text,
      {bool obscureText = false}) {
    return Obx(
      () {
        return TextFormField(
          inputFormatters: [UpperCaseTxt()],
          controller: passwordController.passwordController,
          obscureText: obscureText ? !loginController.obscureText.value : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: CustomColors.customSwatchColor),
            ),
            prefixIcon: Icon(icon),
            labelText: text,
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      loginController.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      loginController.obscureText.toggle();
                    },
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget textFieldOpenRegister(
      IconData icon, String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: CustomColors.customSwatchColor),
          ),
          prefixIcon: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
