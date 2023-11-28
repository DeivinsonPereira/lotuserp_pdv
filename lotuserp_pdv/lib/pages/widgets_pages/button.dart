import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class Button {
  Widget homeButton(String text, String assetImage, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    assetImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(
                    color: CustomColors.customSwatchColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
