import 'package:flutter/material.dart';

import '../../../controllers/moviment_register_controller.dart';
import '../../../services/injection_dependencies.dart';

class PopupMenuMoviment extends StatelessWidget {
  const PopupMenuMoviment({super.key});

  @override
  Widget build(BuildContext context) {
    MovimentRegisterController movimentController =
        InjectionDependencies.movimentRegisterController();

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 28,
      ),
      onSelected: (value) {
        movimentController.tipoDeMovimentoController.text = value.toString();
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'CREDITO',
          child: Text('CREDITO', style: TextStyle(fontSize: 22)),
        ),
        const PopupMenuItem<String>(
          value: 'DEBITO',
          child: Text('DEBITO', style: TextStyle(fontSize: 22)),
        )
      ],
    );
  }
}
