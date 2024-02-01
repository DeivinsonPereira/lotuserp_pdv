// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../controllers/pdv.controller.dart';
import '../../core/custom_colors.dart';

class HeaderPopup extends StatelessWidget {
  final String text;
  final IconData icon;
  bool? isCpfCnpj;
  bool? isPesagem;

  HeaderPopup(
      {Key? key,
      required this.text,
      required this.icon,
      this.isCpfCnpj,
      this.isPesagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    PdvController pdvController = Dependencies.pdvController();

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: size.width,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: CustomColors.customSwatchColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //ícone e texto
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //botão de fechar
            ],
          ),
          isCpfCnpj == true
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    Get.back();
                    isPesagem == true ? pdvController.clearPesagem() : null;
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
        ],
      ),
    );
  }
}
