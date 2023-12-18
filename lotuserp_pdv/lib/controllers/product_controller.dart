import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList pedidos = [].obs;

  double total = 0.0;

  //variavel para definir a opção selecionada no dropdown de ProdutosPage
  RxString textOption = 'DESCRIÇÃO'.obs;

  //variavel para guardar o texto digitado no campo de pesquisa
  RxString search = ''.obs;

  //variavel para verificar se o botão de pesquisa foi executado ou não.
  RxBool searchExecuted = false.obs;


  void adicionarPedidos(String nomeProduto, String unidade, double price) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);

    if (index != -1) {
      pedidos[index]['quantidade'] = (pedidos[index]['quantidade'] ?? 1) + 1;
      pedidos[index]['total'] =
          (pedidos[index]['quantidade'] * pedidos[index]['price']);
    } else {
      pedidos.add({
        'nomeProduto': nomeProduto,
        'quantidade': 1,
        'unidade': unidade,
        'price': price,
        'total': price
      });
    }
  }

  //substituir valor na variavel search
  void setSearch() {
    searchController.text.runtimeType == int
        ? search.value = searchController.text.toString()
        : search.value = searchController.text;
  }

  void totalSoma() {
    for (var element in pedidos) {
      total += element['price'];
    }
  }

  //Muda o texto da variavel textOption
  void changeTextOption(String value) {
    textOption.value = value;
  }
}
