import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../common/header_popup.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    return Dialog(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          children: [
            HeaderPopupMonitor(
              text: 'Sair',
              icon: Icons.exit_to_app,
            ),
            const Expanded(
              child: Center(
                  child: Text(
                "Deseja sair do aplicativo?",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: CustomColors.confirmButtonColor,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Não',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        service.deleteLoggedUser();
                        SystemNavigator.pop();
                      },
                      child: const Text('Sim',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
