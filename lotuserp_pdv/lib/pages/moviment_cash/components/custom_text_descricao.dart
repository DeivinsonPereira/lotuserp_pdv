import 'package:flutter/material.dart';

class CustomTextDescricao extends StatelessWidget {
  const CustomTextDescricao({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: TextFormField(
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
