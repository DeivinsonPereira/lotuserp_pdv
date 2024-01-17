import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_routes.dart';

abstract class IconButtonList {
  static List<Map<String, dynamic>> iconButtonlist = [{
    'icon': FontAwesomeIcons.handHoldingDollar,
    'navigationIcon': PagesRoutes.openRegister,
    'text': 'Abrir caixa',
    'abrirCaixa': true
  },
  {
    'icon': FontAwesomeIcons.moneyBillTransfer,
    'navigationIcon': PagesRoutes.movimentRegister,
    'text': 'Movimentar caixa',
    'movimentarCaixa': true
  },
  {
    'icon': FontAwesomeIcons.cashRegister,
    'navigationIcon': PagesRoutes.finishRegister,
    'text': 'Fechar caixa',
    'fecharCaixa': true
  },
  {
    'icon': FontAwesomeIcons.bottleWater,
    'navigationIcon': PagesRoutes.products,
    'text' : 'Produtos',
  },
  {
    'icon': FontAwesomeIcons.moneyBill1Wave,
    'navigationIcon': PagesRoutes.pdvMonitor,
    'text': 'PDV',
    'pdv': true
  },
  {
    'icon': FontAwesomeIcons.download,
    'navigationIcon': PagesRoutes.loadData,
    'text': 'Carga de dados',
    'loadData': true
  }
  ];

}