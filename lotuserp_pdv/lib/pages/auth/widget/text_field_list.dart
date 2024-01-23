import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../controllers/text_field_controller.dart';
import '../../../services/injection_dependencies.dart';

abstract class TextFieldList {
  static TextFieldController textFieldController =
      Dependencies.textFieldController();

  static Map<String, dynamic> textFieldUrl = {
    'icon': FontAwesomeIcons.wifi,
    'controller': textFieldController.numContratoEmpresaController,
    'label': 'Digite o IP da empresa',
    'useIconButton': true,
    'isUrl': true
  };

  static List<Map<String, dynamic>> textFieldListRow = [
    {
      'icon': FontAwesomeIcons.solidBuilding,
      'controller': textFieldController.idEmpresaController,
      'label': 'ID da empresa',
      'numericKeyboard': true
    },
    {
      'icon': FontAwesomeIcons.fileInvoiceDollar,
      'controller': textFieldController.idSerieNfceController,
      'label': 'ID da serie NFCe',
      'numericKeyboard': true
    },
    {
      'icon': FontAwesomeIcons.cashRegister,
      'controller': textFieldController.numCaixaController,
      'label': 'Número do caixa',
      'numericKeyboard': true
    },
    {
      'icon': FontAwesomeIcons.solidClock,
      'controller': textFieldController.intervaloEnvioController,
      'label': 'Intervalo de envio',
      'numericKeyboard': true
    },
  ];
}
