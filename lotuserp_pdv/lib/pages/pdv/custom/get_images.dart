import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
double width = 65.0;
double heigth = 55.0;
Widget haveNoImage = Image.asset(
  'assets/images/semimagem.png',
  width: 65,
  height: heigth,
);

// Constrói a imagem dos produtos
Widget getImage(String fileImage) {
  try {
    if (fileImage.toUpperCase().startsWith('PRO')) {
      return haveNoImage;
    } else if (!fileImage.startsWith('assets/images/')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.file(
          File(fileImage),
          width: width,
          height: heigth,
        ),
      );
    } else {
      return haveNoImage;
    }
  } catch (e) {
    return haveNoImage;
  }
}

// Constrói a imagem dos grupos
Widget getImageGroup(String fileImage) {
  try {
    if (!fileImage.startsWith('assets/images/')) {
      return Image.file(
        File(fileImage),
        width: width,
        height: heigth,
      );
    } else if (fileImage == 'assets/images/favorito.png') {
      return Image.asset(
        'assets/images/favorito.png',
        width: width,
        height: heigth,
      );
    } else {
      logger.e('Falha na recuperação do arquivo! = $fileImage');
      return haveNoImage;
    }
  } catch (e) {
    logger.e('Falha na recuperação do arquivo! = $e');
    return haveNoImage;
  }
}
