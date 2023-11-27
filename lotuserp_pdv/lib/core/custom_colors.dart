import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(43, 48, 91, .1),
  100: const Color.fromRGBO(43, 48, 91, .2),
  200: const Color.fromRGBO(43, 48, 91, .3),
  300: const Color.fromRGBO(43, 48, 91, .4),
  400: const Color.fromRGBO(43, 48, 91, .5),
  500: const Color.fromRGBO(43, 48, 91, .6),
  600: const Color.fromRGBO(43, 48, 91, .7),
  700: const Color.fromRGBO(43, 48, 91, .8),
  800: const Color.fromRGBO(43, 48, 91, .9),
  900: const Color.fromRGBO(43, 48, 91, 1),
};

Map<int, Color> _contrastColor = {
  50: const Color.fromRGBO(234, 186, 51, .1),
  100: const Color.fromRGBO(234, 186, 51, .2),
  200: const Color.fromRGBO(234, 186, 51, .3),
  300: const Color.fromRGBO(234, 186, 51, .4),
  400: const Color.fromRGBO(234, 186, 51, .5),
  500: const Color.fromRGBO(234, 186, 51, .6),
  600: const Color.fromRGBO(234, 186, 51, .7),
  700: const Color.fromRGBO(234, 186, 51, .8),
  800: const Color.fromRGBO(234, 186, 51, .9),
  900: const Color.fromRGBO(234, 186, 51, 1),
};

abstract class CustomColors {
  static Color customContrastColor = MaterialColor(0xFFeaba33, _contrastColor);

  static MaterialColor customSwatchColor =
      MaterialColor(0xFF2B305B, _swatchOpacity);
}