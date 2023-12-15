import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color(0xFF1B1D34).withOpacity(0.1),
  100: const Color(0xFF1B1D34).withOpacity(0.2),
  200: const Color(0xFF1B1D34).withOpacity(0.3),
  300: const Color(0xFF1B1D34).withOpacity(0.4),
  400: const Color(0xFF1B1D34).withOpacity(0.5),
  500: const Color(0xFF1B1D34).withOpacity(0.6),
  600: const Color(0xFF1B1D34).withOpacity(0.7),
  700: const Color(0xFF1B1D34).withOpacity(0.8),
  800: const Color(0xFF1B1D34).withOpacity(0.9),
  900: const Color(0xFF1B1D34).withOpacity(1),
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
