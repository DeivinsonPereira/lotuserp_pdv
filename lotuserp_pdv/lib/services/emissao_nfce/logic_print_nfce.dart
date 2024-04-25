import 'dart:async';

import '../dependencies.dart';
import '../print_xml.dart/print_nfce_xml.dart';

class LogicPrintNfce {
  var paymentController = Dependencies.paymentController();
  var configController = Dependencies.configcontroller();
  var printerController = Dependencies.printerController();

  Future<void> imprimirNfce(String? xmlArgs) async {
    paymentController.toggleIsButtonPrintEnabled(false);
    if (xmlArgs != '' && xmlArgs != null) {
      String tamanhoImpressora = configController.tamanhoImpressora.value;
      if (tamanhoImpressora != 'SEM IMPRESSORA') {
        await PrintNfceXml().printNfceXml(xmlArgs: xmlArgs);
      }
      paymentController.toggleIsButtonPrintEnabled(true);
    }
  }
}
