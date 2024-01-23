import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/login_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../controllers/text_field_controller.dart';
import '../../services/format_txt.dart';
import '../../services/dependencies.dart';

class FormWidgets {
  final TextFieldController textFieldController =
      Dependencies.textFieldController();
  final LoginController loginController = Dependencies.loginController();
  final PasswordController passwordController =
      Dependencies.passwordController();

  final FocusNode scaleFocusNode = FocusNode();

  final MethodChannel platform = const MethodChannel('com.lotuserp_pdv/tef');

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
            prefixIcon: const Icon(Icons.lock),
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
