import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/empresa_valida.dart';
import 'package:lotuserp_pdv/controllers/empresa_valida_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../pages/common/custom_cherry_error.dart';
import '../pages/empresa_valida/empresa_valida_popup.dart';

class ContractValidate {
  void valid(empresa_valida dadosContrato, BuildContext context) {
    EmpresaValidaController empresaValidaController =
        Dependencies.empresaValidaController();

    var dateNow =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (dadosContrato.data_limite != null) {
      if (dadosContrato.data_limite!.isAfter(dateNow) ||
          dadosContrato.data_limite!.isAtSameMomentAs(dateNow)) {
        empresaValidaController.isContratoValido = true;
      } else {
        empresaValidaController.isContratoValido = false;
        Get.dialog(barrierDismissible: false, const EmpresaValidaPopup());
        const CustomCherryError(message: 'Contrato vencido.').show(context);
      }
    }
  }
}
