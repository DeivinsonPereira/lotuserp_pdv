import 'package:flutter/material.dart';

class ButtonsPdv {
  Widget iconsOptions(IconData icon, String text, Function() action) {
    return Expanded(
      child: Container(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: action,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black),
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
