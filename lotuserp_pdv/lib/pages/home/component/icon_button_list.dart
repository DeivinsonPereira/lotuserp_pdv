import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_routes.dart';

abstract class IconButtonList {
  static List<Map<String, dynamic>> iconButtonlist = [
    {
      'icon': FontAwesomeIcons.handHoldingDollar,
      'text': 'Abrir caixa',
      'abrirCaixa': true
    },
    {
      'icon': FontAwesomeIcons.moneyBillTransfer,
      'text': 'Movimentar caixa',
      'movimentarCaixa': true
    },
    {
      'icon': FontAwesomeIcons.cashRegister,
      'text': 'Fechar caixa',
      'fecharCaixa': true
    },
    {
      'icon': FontAwesomeIcons.bottleWater,
      'navigationIcon': PagesRoutes.products,
      'text': 'Produtos',
    },
    {
      'icon': FontAwesomeIcons.moneyBill1Wave,
      'text': 'PDV',
      'pdv': true,
    },
    {
      'icon': FontAwesomeIcons.download,
      'text': 'Carga de dados',
      'loadData': true
    },
    {
      'icon': Icons.print,
      'text': '2ª Via Cartão',
      'isSegundaVia': true,
    },
    {
      'icon': FontAwesomeIcons.receipt,
      'text': '2ª Via NFCe',
      'isNfceSegundaVia': true,
    }
  ];
}
