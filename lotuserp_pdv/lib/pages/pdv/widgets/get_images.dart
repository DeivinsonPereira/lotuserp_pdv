import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
double width = 65.0;
double heigth = 55.0;

Widget getImage(String fileImage) {
  try {
    if (!fileImage.startsWith('assets/images/')) {
      return Image.file(
        File(fileImage),
        width: width,
        height: heigth,
      );
    } else {
      return Image.asset(
        'assets/images/semimagem.png',
        width: width,
        height: heigth,
      );
    }
  } catch (e) {
    return Image.asset(
      'assets/images/semimagem.png',
      width: width,
      height: heigth,
    );
  }
}

Widget getImageGroup(String fileImage) {
  try {
    if (!fileImage.startsWith('assets/images/')) {
      return Image.file(
        File(fileImage),
        width: width,
        height: heigth,
      );
    } else {
      logger.e('Falha na recuperação do arquivo! = $fileImage');
      return Image.asset(
        'assets/images/semimagem.png',
        width: width,
        height: heigth,
      );
    }
  } catch (e) {
    logger.e('Falha na recuperação do arquivo! = $e');
    return Image.asset(
      'assets/images/semimagem.png',
      width: width,
      height: heigth,
    );
  }
}
