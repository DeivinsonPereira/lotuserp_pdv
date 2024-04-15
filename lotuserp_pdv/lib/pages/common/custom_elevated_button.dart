// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() function;
  final Color color;
  final String text;
  final TextStyle textStyle;
  double? radious;

  CustomElevatedButton({
    Key? key,
    required this.function,
    required this.color,
    required this.text,
    required this.textStyle,
    this.radious = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radious!),
        ),
      ),
      onPressed: function,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
