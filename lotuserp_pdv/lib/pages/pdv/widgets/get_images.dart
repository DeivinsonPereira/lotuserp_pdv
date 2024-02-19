import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Widget getImage(String fileImage) {
  try {
    if (!fileImage.startsWith('assets/images/')) {
      return Image.file(
        File(fileImage),
        width: 65,
      );
    } else {
      return Image.asset(
        'assets/images/semimagem.png',
        width: 75,
        scale: 1.0,
      );
    }
  } catch (e) {
    return Image.asset(
      'assets/images/semimagem.png',
      width: 75,
      scale: 1.0,
    );
  }
}

Widget getImageGroup(String fileImage) {
  try {
    if (!fileImage.startsWith('assets/images/')) {
      return Image.file(
        File(fileImage),
        width: 65,
      );
    } else {
      logger.e('Falha na recuperação do arquivo! = $fileImage');
      return Image.asset(
        'assets/images/semimagem.png',
        width: 75,
        scale: 1.0,
      );
    }
  } catch (e) {
    logger.e('Falha na recuperação do arquivo! = $e');
    return Image.asset(
      'assets/images/semimagem.png',
      width: 75,
      scale: 1.0,
    );
  }
}
