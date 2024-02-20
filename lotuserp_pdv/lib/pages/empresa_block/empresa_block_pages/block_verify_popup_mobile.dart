// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/custom_colors.dart';
import '../../common/custom_text_style.dart';
import '../../common/header_popup.dart';

class BlockVerifyPopupMobile extends StatelessWidget {
  const BlockVerifyPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // botão para sair do aplicativo
    Widget _exitButton() {
      return Container(
        height: 80,
        width: 400,
        color: CustomColors.informationBox,
        child: TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text(
            'OK',
            style: customTextStyleBack(),
          ),
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: Get.height * 5,
        width: Get.width * 8,
        child: Column(
          children: [
            HeaderPopupMonitor(
                text: 'Mensagem', icon: Icons.lock_person_rounded),
            const Expanded(
                child: Center(
              child: Text(
                'Contrato bloqueado, entre em contato com o suporte.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            )),
            Row(children: [
              _exitButton(),
            ])
          ],
        ),
      ),
    );
  }
}
