import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;

  const CustomSnackBar({
    super.key,
    required this.message,
  });

  void show() {
    Get.snackbar(
      'Erro',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      icon:const  Icon(
        Icons.error,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
