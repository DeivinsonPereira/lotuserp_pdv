// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/empresa_valida.dart';
import '../pages/empresa_valida/empresa_valida_popup_page.dart';
import '../repositories/system_isblock_verify.dart';
import '../services/contract_validate.dart';

class EmpresaValidaController extends GetxController {
  TextEditingController empresaContratoController = TextEditingController();
  IsarService service = IsarService();
  Logger logger = Logger();

  var empresaContrato = ''.obs;
  var empresaDataLimite = ''.obs;
  bool isContratoValido = false;
  var isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadContrato(Get.context!);
    updateIsButtonEnabled(true);
    SystemIsblockVerify().checkIfTheSystemIsLocked();
  }

  // CARREGAR CONTRATO
  Future<void> loadContrato(BuildContext context) async {
    empresa_valida? dadosContrato = await service.getDadoTabelaEmpresaValida();
    if (dadosContrato != null) {
      empresaContratoController.text = dadosContrato.nocontrato;
      empresaContrato.value = dadosContrato.nocontrato;

      ContractValidate().valid(dadosContrato, context);
      update();
    } else {
      Get.dialog(barrierDismissible: false, const EmpresaValidaPopupPage());
    }
  }

  // ATUALIZAR CAMPO DE TEXTO DO CONTRATO NAS CONFIGURAÇÕES
  Future<void> updateContractConfig() async {
    TextFieldController textFieldController =
        Dependencies.textFieldController();

    var dadosContrato = await service.getDadoTabelaEmpresaValida();
    if (dadosContrato != null &&
        textFieldController.numContratoEmpresaController.text == '') {
      textFieldController.numContratoEmpresaController.text =
          dadosContrato.nocontrato;
    } else {
      logger.e('Erro ao buscar os dados da tabela empresa_valida');
    }
  }

  //adiciona o valor no campo empresaContrato
  void updateEmpresaContrato(String value) {
    empresaContrato.value = value;
    update();
  }

  //atualiza o campo empresaContrato
  void updateIsButtonEnabled(bool value) {
    isButtonEnabled.value = value;
    update();
  }

  //limpa o campo empresaContrato
  void clear() {
    empresaContratoController.clear();
    empresaContrato.value = '';
    update();
  }
}
