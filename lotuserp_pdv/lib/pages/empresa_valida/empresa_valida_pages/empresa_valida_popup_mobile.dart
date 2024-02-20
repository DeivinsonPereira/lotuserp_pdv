// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../controllers/empresa_valida_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../repositories/obter_liberacao_servidor_repository.dart';
import '../../../services/dependencies.dart';
import '../../../shared/isar_service.dart';
import '../../common/custom_text_style.dart';
import '../../common/header_popup.dart';
import '../component/text_field_contract.dart';

class EmpresaValidaPopupMobile extends StatelessWidget {
  const EmpresaValidaPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    EmpresaValidaController empresaValidaController =
        Dependencies.empresaValidaController();
    IsarService service = IsarService();

    // Botão para sair do aplicativo
    Widget _backButton() {
      return Container(
        height: 60,
        color: CustomColors.informationBox,
        child: TextButton(
          onPressed: () {
            if (empresaValidaController.isButtonEnabled.value == true) {
              SystemNavigator.pop();
            }
          },
          child: Text(
            'Sair',
            style: customTextStyleBack(),
          ),
        ),
      );
    }

    // Botão para confirmar o contrato
    Widget _confirmButton() {
      return Obx(() => Container(
            height: 60,
            color: empresaValidaController.isButtonEnabled.value
                ? CustomColors.confirmButtonColor
                : Colors.grey[300],
            child: TextButton(
              onPressed: () async {
                if (empresaValidaController.isButtonEnabled.value) {
                  empresaValidaController.updateIsButtonEnabled(false);
                  dynamic response = await ObterLiberacaoServidorRepository()
                      .obterLiberacaoServidor(
                    empresaValidaController.empresaContratoController.text,
                    context,
                  );
                  // ignore: use_build_context_synchronously
                  await service.insertEmpresaValida(response, context);
                }
              },
              child: Text(
                'Liberar',
                style: customTextStyleConfirm(
                    empresaValidaController.isButtonEnabled.value),
              ),
            ),
          ));
    }

    // Botoes para voltar e confirmar
    Widget _buttonsBackAndConfirm() {
      return Row(children: [
        Expanded(child: _backButton()),
        Expanded(child: _confirmButton()),
      ]);
    }

    // Conteiner do conteúdo
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: Get.height * 0.5,
        width: Get.width * 0.8,
        child: Column(
          children: [
            // cabeçalho
            HeaderPopupMobile(
              text: 'Contrato da empresa',
              icon: FontAwesome.address_card,
              isEmpresaValida: true,
              isCpfCnpj: true,
            ),

            // corpo
            const Expanded(
                child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Center(
                      child: Text(
                        '''Este  sistema  não  esta  liberado  para este  período  de  execução.
Informe o contrato e clique no botão 
"Liberar On-Line".

financeiro@vistatecnologia.com.br
www.vistatecnologia.com.br''',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: TextFieldContract()),
              ],
            )),

            // botões
            _buttonsBackAndConfirm(),
          ],
        ),
      ),
    );
  }
}
