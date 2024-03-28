import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/dependencies.dart';
import '../common/header_popup.dart';

class SecondCopyPage extends StatelessWidget {
  const SecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationController = Dependencies.informationController();

    Widget _buildHeader() {
      return //HEADER
          Obx(
        () => HeaderPopupMonitor(
          text:
              'Vendas do caixa: ${informationController.caixaId.value.toString().padLeft(5, '0')}',
          icon: Icons.receipt,
          nfce: true,
        ),
      );
    }

    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
        ],
      );
    }

    return Dialog(
      child: Container(
          height: Get.height * 0.9, // 500,
          width: 500,
          color: Colors.white,
          child: _buildBody()),
    );
  }
}
