import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/format_txt.dart';

import '../../../controllers/empresa_valida_controller.dart';
import '../../../services/dependencies.dart';

class TextFieldContract extends StatelessWidget {
  const TextFieldContract({super.key});

  @override
  Widget build(BuildContext context) {
    EmpresaValidaController empresaValidaController =
        Dependencies.empresaValidaController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            inputFormatters: [UpperCaseTxt()],
            readOnly:
                empresaValidaController.empresaContrato.isEmpty ? false : true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              labelText: 'Contrato',
            ),
            controller: empresaValidaController.empresaContratoController,
          ),
        ),
      ],
    );
  }
}
