import 'package:get/get.dart';

class ProdutoController extends GetxController {
  List<Map<String, dynamic>> pedidos = [];

  late double total;

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
}
