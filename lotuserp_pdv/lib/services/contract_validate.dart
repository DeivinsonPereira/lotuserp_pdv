import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/empresa_valida.dart';
import 'package:lotuserp_pdv/controllers/empresa_valida_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../pages/empresa_valida/empresa_valida_popup_page.dart';

class ContractValidate {
  void valid(empresa_valida dadosContrato) {
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
        Get.dialog(
            barrierDismissible: false, const EmpresaValidaPopupPage());
        //const CustomCherryError(message: 'Contrato vencido.').show(context);
      }
    }
  }
}
