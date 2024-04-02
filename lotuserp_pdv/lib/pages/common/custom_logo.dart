import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

class CustomLogo {
  var logoController = Dependencies.logoController();

  Widget getLogoPadrao({double? width, double? height}) {
    if (logoController.logoImagePadrao.value.isEmpty) {
      return Image.asset('assets/images/Logo_Nova_Transparente.png');
    } else {
      return Image.file(
        File(logoController.logoImagePadrao.value),
        width: width,
        height: height,
      );
    }
  }

  Widget getLogoBranca({double? width, double? height}) {
    if (logoController.logoImageBranca.value.isEmpty) {
      return Image.asset('assets/images/Logo Nova Branco Vertical.png');
    } else {
      return Image.file(
        File(logoController.logoImageBranca.value),
        width: width,
        height: height,
      );
    }
  }
}
