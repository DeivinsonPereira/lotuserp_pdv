import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdvController extends GetxController {
  RxList pedidos = [].obs;

  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;
  RxBool checkbox3 = false.obs;

  RxString validationCheckedBox = ''.obs;

  var total = 0.0.obs;

  double discountTotal = 0.0;

  double totalMinusDiscount = 0.00;

  var numbersDiscount = '0,00'.obs;

  var discountPercentage = 0.0.obs;

  final ScrollController scrollController = ScrollController();

  //busca quantidades pedidos de um determinado item
  int getQuantidade(String nomeProduto) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);
    return index != -1 ? pedidos[index]['quantidade'] : 0;
  }

  //busca o nome do item
  int getNome(String nomeProduto) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);
    return index;
  }

  void selectedCheckBox(String letterCheckBox) {
    validationCheckedBox.value = letterCheckBox;
    print(validationCheckedBox.value);
  }

  //calcula percentual de desconto
  void calculateDiscountPercentage() {
    double discount =
        double.parse(numbersDiscount.value.replaceAll(RegExp(r'[^\d]'), '')) /
            100;
    double subtotal = 0.0;

    for (var element in pedidos) {
      subtotal += element['total'];
    }

    double newTotal = subtotal - discount;

    discountPercentage.value = (discount / (subtotal > 0 ? subtotal : 1)) * 100;

    total.value = newTotal;
  }

  //adiciona numeros no desconto
  void addNumberDiscount(String number) {
    if (number == '0' && numbersDiscount.value == '0.00') {
      return;
    }

    String newValue =
        numbersDiscount.value.replaceAll(RegExp(r'[^\d]'), '') + number;
    numbersDiscount.value = formatAsCurrency(double.parse(newValue) / 100);

    calculateTotal();
  }

  //calcula o total entre desconto em reais e subtotal
  void calculateTotal() {
    double discount =
        double.parse(numbersDiscount.value.replaceAll(RegExp(r'[^\d]'), '')) /
            100;

    double subtotal = 0.0;
    for (var element in pedidos) {
      subtotal += element['total'];
    }

    double newTotal = subtotal - discount;

    total.value = newTotal;
    calculateDiscountPercentage();
  }

  String formatAsCurrency(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  void removeNumberDiscount() {
    if (numbersDiscount.value.length > 1) {
      String newValue = numbersDiscount.value
          .replaceAll(RegExp(r'[^\d]'), '')
          .substring(0, numbersDiscount.value.length - 2);
      numbersDiscount.value = formatAsCurrency(double.parse(newValue) / 100);
    } else {
      numbersDiscount.value = '0,00';
    }
    calculateTotal();
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

    scrollController.addListener(() {});
  }

  void cancelarPedido() {
    if (pedidos.isNotEmpty) {
      pedidos.clear();

      Get.back();
    }
  }

  void removerPedido(int index) {
    if (index >= 0 && index < pedidos.length) {
      if (pedidos[index]['quantidade'] > 1) {
        total.value -= pedidos[index]['price'];
        pedidos[index]['quantidade'] -= 1;
        pedidos[index]['total'] =
            pedidos[index]['quantidade'] * pedidos[index]['price'];
      } else {
        total.value -= pedidos[index]['total'];
        pedidos.removeAt(index);
      }
    }
  }

  void totalSoma() {
    if (total > 0.1) {
      total.value = 0.0;
    }
    for (var element in pedidos) {
      total.value += element['total'];
    }
  }

  void discount(double discount) {
    discountTotal = discount;
  }

  void totalWithDiscount(double discount) {
    if (total > discountTotal) {
      totalMinusDiscount = total.value - discountTotal;
    } else {
      totalMinusDiscount = 0.0;
    }
  }
}
