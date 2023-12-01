import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class ButtonsWidgets {
  Widget backButton() {
    return IconButton(
      icon: const  Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 112, 112, 112),
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  Widget textDiscountOnSale() {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.tags,
            color: CustomColors.customSwatchColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Desconto na venda',
            style: TextStyle(color: CustomColors.customSwatchColor),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
