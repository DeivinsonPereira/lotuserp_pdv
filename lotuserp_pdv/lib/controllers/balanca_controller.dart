import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BalancaController extends GetxController {
  final peso = ''.obs;
  static const platform = MethodChannel('com.lotuserp_pdv/tef');

  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _escutarMudancasNaBalanca();
  }

  void _escutarMudancasNaBalanca() {
    platform.setMethodCallHandler((MethodCall call) async {
      if (call.method == "'onNewWeightData'") {
        peso.value = call.arguments; // Atualiza o peso
      }
    });
  }

  void ativarLeituraDaBalanca() async {
    try {
      await platform.invokeMethod('activateWeightReading');
      logger.d('Leitura da balança ativada');
    } on PlatformException catch (e) {
      logger.e("Erro ao ativar a leitura da balança: ${e.message}");
    }
  }
}
