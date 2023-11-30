import 'package:get/get.dart';

class PdvController extends GetxController {
  RxList pedidos = [].obs;

  double total = 0.0;

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

  void totalSoma() {
    for (var element in pedidos) {
      total += element['price'];
      
    }
  }
}
