import 'package:flutter/material.dart';

class RowWidget {
  Widget Rows(String text, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            total,
          ),
        ],
      ),
    );
  }
}
