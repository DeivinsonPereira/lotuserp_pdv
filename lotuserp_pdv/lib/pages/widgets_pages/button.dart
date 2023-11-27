import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class Button {
  Widget homeButton(String text, IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: CustomColors.customContrastColor,
                size: 80,
              ),
              Text(
                text,
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 2.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
