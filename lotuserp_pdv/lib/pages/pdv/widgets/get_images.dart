import 'dart:io';

import 'package:flutter/material.dart';

class GetImages {
  Widget getImage(
    String fileImage,
  ) {
    try {
      return Image.file(
        File(
          fileImage,
        ),
        width: 75,
        scale: 1.0,
      );
    } catch (e) {
      return Image.asset(
        'assets/images/semimagem.png',
        width: 75,
        scale: 1.0,
      );
    }
  }
}
