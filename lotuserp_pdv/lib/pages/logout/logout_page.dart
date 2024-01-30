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
      child: Column(
        children: [
          const HeaderPopup(
            text: 'Sair',
            icon: Icons.exit_to_app,
          ),
          const Expanded(
            child: Text("Deseja sair do aplicativo?"),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: CustomColors.confirmButtonColor,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Voltar',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      service.deleteLoggedUser();
                      SystemNavigator.pop();
                    },
                    child: const Text('Sair',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
