// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const SuccessScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 300,
        width: 400,
        child: Center(
          child: Text(data['message']),
        ),
      ),


    );
  }
}
