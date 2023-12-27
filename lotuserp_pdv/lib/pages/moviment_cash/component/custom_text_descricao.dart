// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/format_txt.dart';

class CustomTextDescricao extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextDescricao({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: TextFormField(
        inputFormatters: [UpperCaseTxt()],
        maxLength: 500,
        controller: controller,
        textInputAction: TextInputAction.done,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'Descreva a movimentação aqui...',
          contentPadding:
              EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
