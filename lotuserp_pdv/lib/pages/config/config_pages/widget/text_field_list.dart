import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../controllers/text_field_controller.dart';
import '../../../../services/dependencies.dart';

abstract class TextFieldList {
  static TextFieldController textFieldController =
      Dependencies.textFieldController();

  static Map<String, dynamic> textFieldUrl = {
    'icon': FontAwesomeIcons.wifi,
    'controller': textFieldController.numContratoEmpresaController,
    'label': 'IP Empresa',
    'useIconButton': true,
    'isUrl': true
  };

  static List<Map<String, dynamic>> textFieldListRow = [
    {
      'icon': FontAwesomeIcons.solidBuilding,
      'controller': textFieldController.idEmpresaController,
      'label': 'Id Empresa',
      'numericKeyboard': true
    },
    {
      'icon': FontAwesomeIcons.fileInvoiceDollar,
      'controller': textFieldController.idSerieNfceController,
      'label': 'ID S. NFCe',
      'numericKeyboard': true
    },
    {
      'icon': FontAwesomeIcons.cashRegister,
      'controller': textFieldController.numCaixaController,
      'label': 'Nº Caixa',
      'numericKeyboard': true
    },
  ];
}
