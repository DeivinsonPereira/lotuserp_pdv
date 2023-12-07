import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  const CustomSnackBar({
    required this.title,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  void show(BuildContext context) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      icon: Icon(
        icon,
        color: textColor,
      ),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}