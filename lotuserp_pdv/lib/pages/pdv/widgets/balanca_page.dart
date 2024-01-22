import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/balanca_prix_controller.dart';

class BalancaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BalancaPrixController controller = Get.put(BalancaPrixController());

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

      /*appBar: AppBar(
        title: const Text('Conexão com Balança Prix 3 Fit'),
      ),
      body: Center(
        child: Obx(() => Text(controller.pesoLido.value)),
      ),*/
    );
  }
}
