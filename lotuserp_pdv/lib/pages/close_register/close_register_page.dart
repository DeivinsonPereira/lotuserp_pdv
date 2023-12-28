import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../common/header_popup.dart';

class CloseRegisterPage extends StatelessWidget {
  const CloseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.5,
        child: Column(
          children: [
            // cabeçalho
            const HeaderPopup(
                text: 'Fechar Caixa', icon: FontAwesomeIcons.cashRegister),

            // corpo
            Expanded(
              child: Container(),
            ),

            // botões voltar e confirmar
            Row(
              children: [
                //voltar
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'VOLTAR',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                //Confirmar
                Expanded(
                  child: Container(
                    color: CustomColors.confirmButtonColor,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'CONFIRMAR',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
