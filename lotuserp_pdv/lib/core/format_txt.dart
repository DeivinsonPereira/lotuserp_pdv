// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/services.dart';

class LowerCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
        return txtNew.copyWith(text: txtNew.text.toLowerCase());
      }

}

class UpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
        return txtNew.copyWith(text: txtNew.text.toUpperCase());
      }

}
