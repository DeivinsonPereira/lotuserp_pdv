import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/balanca_prix_controller.dart';

class BalancaPage extends StatelessWidget {
  const BalancaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BalancaPrix3FitController controller =
        Get.put(BalancaPrix3FitController());

    return Dialog(
      child: Column(
        children: [
          const Text('Produto: '),
          Row(
            children: [
              const Text('Peso do produto '),
              Obx(() => Text(controller.pesoLido.value))
            ],
          ),
        ],
      ),
    );
  }
}
