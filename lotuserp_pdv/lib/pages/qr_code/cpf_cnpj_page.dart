// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/response_servidor_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

class CpfCnpjPage extends StatelessWidget {
  const CpfCnpjPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();

    //botão de continuar
    Widget _buildButtonContinue() {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () async {
          await responseServidorController.updateCpfCnpj();
          print(responseServidorController.cpfCnpj);
          Get.back();
          responseServidorController.limparCpfCnpj();
        },
        child: Container(
          color: CustomColors.confirmButtonColor,
          height: 60,
          alignment: Alignment.center,
          child: const Text(
            'Continuar',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      );
    }

    //Text field para preenchimento do CPF ou CNPJ
    Widget _buildTextField() {
      return SizedBox(
        width: 270,
        child: TextField(
          controller: responseServidorController.cpfCnpjController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'CPF/CNPJ',
            prefixIcon: Icon(FontAwesome.address_card),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      );
    }

    //Conteudo
    Widget _buildContent() {
      return Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Digite o numero do CPF ou CNPJ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildTextField(),
        ]),
      );
    }

    //Inicio do código
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: 350,
        height: 300,
        child: Column(
          children: [
            HeaderPopup(
                text: 'CPF/CNPJ',
                icon: FontAwesome.address_card,
                isCpfCnpj: true),
            _buildContent(),
            _buildButtonContinue(),
          ],
        ),
      ),
    );
  }
}
