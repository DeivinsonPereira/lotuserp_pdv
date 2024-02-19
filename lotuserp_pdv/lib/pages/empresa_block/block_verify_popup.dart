// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotuserp_pdv/pages/common/custom_text_style.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';

import '../../core/custom_colors.dart';

class BlockVerifyPopup extends StatelessWidget {
  const BlockVerifyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    // botão para sair do aplicativo
    Widget _exitButton() {
      return Container(
          height: 60,
          color: CustomColors.informationBox,
          child: TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              'OK',
              style: customTextStyleBack(),
            ),
          ),);
    }

    return Dialog(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          children: [
            HeaderPopup(
                text: 'Contrato bloqueado', icon: Icons.lock_person_rounded),
            const Expanded(
                child: Text(
              'Contrato bloqueado, entre em contato com a administradora.',
              style: TextStyle(fontSize: 18),
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
