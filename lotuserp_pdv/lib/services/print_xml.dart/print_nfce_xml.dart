import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../controllers/config_controller.dart';
import '../../controllers/text_field_controller.dart';

class PrintNfceXml {
  PaymentController paymentController = Dependencies.paymentController();
  Configcontroller configController = Dependencies.configcontroller();
  TextFieldController textFieldController = Dependencies.textFieldController();

  var platform = const MethodChannel('com.lotuserp_pdv/tef');

  Logger logger = Logger();

  String? xml;
  String? tamanhoImpressora;

  Future<void> printNfceXml({String? xmlArgs}) async {
    try {
      await configController.loadSizePrinter();
      
      // ignore: prefer_if_null_operators
      xml = xmlArgs != null ? xmlArgs : paymentController.xml.value;
      tamanhoImpressora =
          configController.tamanhoImpressora.value == "80mm" ? 'Q4' : 'TECTOY';

      if (xml == null || tamanhoImpressora == null) {
        return;
      }
      await platform.invokeMethod(
          'imprimirNFCE', {'xml': xml, 'tamanhoImpressora': tamanhoImpressora});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
