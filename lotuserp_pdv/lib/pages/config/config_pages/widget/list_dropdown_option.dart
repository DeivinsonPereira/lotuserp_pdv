import 'package:flutter/material.dart';

class ListDropdownOption {
  List<String> listOptionsBalance = ['NENHUMA', 'TOLEDO'];
  List<String> listOptionsTef = [
    'NENHUMA',
    'TEF ELGIN',
    'TEF SITEF',
    'TEF MERCADO PAGO'
  ];
  List<String> listOptionsSizePrinter = ['SEM IMPRESSORA', '58mm', '80mm'];

  List<Map<String, dynamic>> listColors = [
    {
      'name': 'AMARELO',
      'color': const Color(0xFFeaba33),
    },
    {
      'name': 'AZUL',
      'color': const Color(0xFF078DFA),
    },
    {
      'name': 'AZUL CLARO',
      'color': const Color(0xFF00DAF7),
    },
    {
      'name': 'AZUL ESCURO',
      'color': const Color(0xFF2B305B),
    },
    {
      'name': 'CINZA',
      'color': const Color(0xFF666666),
    },
    {
      'name': 'LARANJA',
      'color': const Color(0xFFF76300),
    },
    {
      'name': 'MARROM',
      'color': const Color(0xFF793F0A),
    },
    {
      'name': 'PRETO',
      'color': const Color(0xFF000000),
    },
    {
      'name': 'ROSA',
      'color': const Color(0xFFA102E0),
    },
    {
      'name': 'ROXO',
      'color': const Color(0xFF4A00C0),
    },
    {
      'name': 'VERDE',
      'color': const Color(0xFF86C337),
    },
    {
      'name': 'VERDE ESCURO',
      'color': const Color(0xFF075200),
    },
    {
      'name': 'VERMELHO',
      'color': const Color(0xFFC90300),
    }
  ];

  // Ordena a lista de cores pelo nome
  void sortListColors() {
    listColors.sort((a, b) {
      return a['name'].compareTo(b['name']);
    });
  }
}
