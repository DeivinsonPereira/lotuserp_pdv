import 'package:flutter/material.dart';

class ButtonsPdv {
  Widget iconsOptions(IconData icon, String text, Function() action) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
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
                  Text(
                    text,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
