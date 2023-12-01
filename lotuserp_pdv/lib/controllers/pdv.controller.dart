import 'package:get/get.dart';

class PdvController extends GetxController {
  RxList pedidos = [].obs;

  double total = 0.0;

  int getQuantidade(String nomeProduto) {
  int index =
      pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);
  return index != -1 ? pedidos[index]['quantidade'] : 0;
}

  void adicionarPedidos(String nomeProduto, String unidade, String price) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);

    String priceString = price;

    String priceSemMilhares = priceString.replaceAll('.', '');

    String priceComPonto = priceSemMilhares.replaceAll(',', '.');

    double precoDouble = double.parse(priceComPonto);

    if (index != -1) {
      pedidos[index]['quantidade'] = (pedidos[index]['quantidade'] ?? 1) + 1;
      pedidos[index]['total'] =
          (pedidos[index]['quantidade'] * pedidos[index]['price']);
    } else {
      pedidos.add({
        'nomeProduto': nomeProduto,
        'quantidade': 1,
        'unidade': unidade,
        'price': precoDouble,
        'total': precoDouble
      });
    }
  }

  void removerPedido(int index) {
    if (index >= 0 && index < pedidos.length) {
      if (pedidos[index]['quantidade'] > 1) {
        total -= pedidos[index]['price'];
        pedidos[index]['quantidade'] -= 1;
        pedidos[index]['total'] = pedidos[index]['quantidade'] * pedidos[index]['price'];
    } else {
      total -= pedidos[index]['total'];
      pedidos.removeAt(index);
    }
  }
  }

  void totalSoma() {
    if (total > 0.1) {
      total = 0.0;
    }
    for (var element in pedidos) {
      total += element['total'];
    }
  }
}
