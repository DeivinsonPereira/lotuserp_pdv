import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_routes.dart';

abstract class IconButtonList {
  static List<Map<String, dynamic>> iconButtonlist = [
    {
      'icon': FontAwesomeIcons.handHoldingDollar,
      'text': 'Abrir\nCaixa',
      'abrirCaixa': true
    },
    {
      'icon': FontAwesomeIcons.moneyBillTransfer,
      'text': 'Movimentar\ncaixa',
      'movimentarCaixa': true
    },
    {
      'icon': FontAwesomeIcons.cashRegister,
      'text': 'Fechar\ncaixa',
      'fecharCaixa': true
    },
    {
      'icon': FontAwesomeIcons.bottleWater,
      'navigationIcon': PagesRoutes.products,
      'text': 'Pesquisar\nProdutos',
    },
    {
      'icon': FontAwesomeIcons.moneyBill1Wave,
      'text': 'Entrar\nPDV',
      'pdv': true,
    },
    {
      'icon': FontAwesomeIcons.download,
      'text': 'Carga de\ndados',
      'loadData': true
    },
  ];
}
