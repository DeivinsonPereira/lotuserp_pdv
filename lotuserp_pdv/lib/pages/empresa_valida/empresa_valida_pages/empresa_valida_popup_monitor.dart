// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/empresa_valida_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/custom_text_style.dart';
import 'package:lotuserp_pdv/pages/empresa_valida/component/text_field_contract.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../repositories/obter_liberacao_servidor_repository.dart';
import '../../common/header_popup.dart';

//Popup para informar o contrato da empresa caso o mesmo esteja vazio no banco de dados
class EmpresaValidaPopupMonitor extends StatelessWidget {
  const EmpresaValidaPopupMonitor({super.key});

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
                'Liberar On-line',
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
        height: 400,
        width: 400,
        child: Column(
          children: [
            // cabeçalho
            HeaderPopupMonitor(
              text: 'Contrato da empresa',
              icon: FontAwesome.address_card,
              isEmpresaValida: true,
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
