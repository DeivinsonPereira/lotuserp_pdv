// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/logout/logout_page.dart';

import '../../../../controllers/login_controller.dart';
import '../../../../services/dependencies.dart';

class CustomConfirmButton extends StatelessWidget {
  final String text;
  bool? isConfirm;

  CustomConfirmButton({
    Key? key,
    required this.text,
    this.isConfirm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Dependencies.loginController();

    return Align(
      alignment: const Alignment(0, -0.72),
      child: SizedBox(
        width: 350,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isConfirm == false ? Colors.red : const Color(0xFF2B2F5B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () async => isConfirm == false
              ? Get.dialog(const LogoutPage())
              : loginController.handleLogin(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
