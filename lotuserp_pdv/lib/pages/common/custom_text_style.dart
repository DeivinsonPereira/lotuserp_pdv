import 'package:flutter/material.dart';

TextStyle customTextStyleBack() {
  return const TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle customTextStyleConfirm(bool value) {
  return TextStyle(
    fontSize: 24,
    color: value == true ? Colors.black : Colors.white,
    fontWeight: FontWeight.bold,
  );
}
