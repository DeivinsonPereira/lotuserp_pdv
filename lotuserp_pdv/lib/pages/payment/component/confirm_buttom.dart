// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmButtom extends StatelessWidget {
  const ConfirmButtom({
    Key? key,
    this.isConfirmation = false,
    required this.text,
    this.onConfirm,
  }) : super(key: key);

  final bool isConfirmation;
  final String text;
  final Function(String value)? onConfirm;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isConfirmation ? Colors.black : Colors.white)),
    );
  }
}
