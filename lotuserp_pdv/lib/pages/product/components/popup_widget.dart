// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/product_controller.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Get.find();

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
        color: Colors.black,
      ),
      onSelected: (value) {
        controller.textOption.value = value;
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'ID',
          child: Text('ID', style: TextStyle(fontSize: 22)),
        ),
        const PopupMenuItem<String>(
          value: 'DESCRIÇÃO',
          child: Text('DESCRIÇÃO', style: TextStyle(fontSize: 22)),
        ),
        const PopupMenuItem<String>(
          value: 'CÓDIGO BARRAS',
          child: Text(
            'CÓDIGO BARRAS',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
