import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

class ButtonsPdv {
  Widget iconsOptions(IconData icon, String text, Function() action) {
    var configController = Dependencies.configcontroller();

    return Expanded(
      child: SizedBox(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: action,
          child: Card(
            color: configController.colorBackground['color'] as Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
