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

class CustomTextStyles {
  TextStyle blackBoldTextStyle({double fontSize = 24}) {
    return TextStyle(
        fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.bold);
  }

  TextStyle blackTextStyle({double fontSize = 16}) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  TextStyle whiteBoldTextStyle({double fontSize = 24}) {
    return TextStyle(
        fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.bold);
  }

  TextStyle whiteTextStyle({double fontSize = 16}) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
    );
  }
}
