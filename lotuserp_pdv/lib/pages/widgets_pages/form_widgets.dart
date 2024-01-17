import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/login_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../services/format_txt.dart';
import '../../services/injection_dependencies.dart';

class FormWidgets {
  final TextEditingController _controller = TextEditingController();
  final LoginController loginController =
      InjectionDependencies.loginController();
  final PasswordController passwordController =
      InjectionDependencies.passwordController();

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
      onPressed: () {
        Get.toNamed(routeName);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget customTextField(String text, IconData icon) {
    return TextFormField(
      controller: passwordController.userController,
      onChanged: (value) {
        passwordController.updateUsername(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: CustomColors.customSwatchColor),
        ),
        prefixIcon: Icon(icon),
        labelText: text,
      ),
      inputFormatters: [
        UpperCaseTxt(),
      ],
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
