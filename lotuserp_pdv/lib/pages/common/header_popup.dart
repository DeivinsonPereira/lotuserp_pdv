import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/custom_colors.dart';

class HeaderPopup extends StatelessWidget {
  const HeaderPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: size.width,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: CustomColors.customSwatchColor,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //ícone e texto
          Row(
            children: [
              Icon(
                FontAwesomeIcons.download,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Carga de Dados',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
