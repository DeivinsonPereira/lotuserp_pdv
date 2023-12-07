import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class PdvController extends GetxController {
  RxList pedidos = [].obs;

  RxBool checkbox2 = true.obs;
  RxBool checkbox3 = false.obs;

  //total com desconto
  RxDouble total = 0.0.obs;

  //desconto em reais
  RxString numbersDiscount = '0,00'.obs;

  //percentual de desconto
  RxDouble discountPercentage = 0.0.obs;

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

  //calcula percentual de desconto
  void calculateDiscountPercentage() {
    double discount =
        double.parse(numbersDiscount.value.replaceAll(RegExp(r'[^\d]'), '')) /
            100;
    double subtotal = 0.0;

    for (var element in pedidos) {
      subtotal += element['total'];
    }

    discountPercentage.value = (discount / max(subtotal, 1)) * 100;

    total.value = subtotal - discount;
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

  //remove numero do NumberDiscount
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

  //adiciona itens no pedido
  void adicionarPedidos(
      String nomeProduto, String unidade, String price, Function callback) {
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

  //cancela o pedido e zera a lista
  void cancelarPedido() {
    if (pedidos.isNotEmpty) {
      pedidos.clear();

      Get.back();
    }
  }

  //remove item do pedido
  void removerPedido(int index, Function callback) {
    if (index >= 0 && index < pedidos.length) {
      if (pedidos[index]['quantidade'] > 1) {
        total.value -= pedidos[index]['price'];
        pedidos[index]['quantidade'] -= 1;
        pedidos[index]['total'] =
            pedidos[index]['quantidade'] * pedidos[index]['price'];
        update();
      } else {
        total.value -= pedidos[index]['total'];
        pedidos.removeAt(index);
        update();
      }
    }
  }

  // soma o valor total a lista
  void totalSoma() {
    if (total > 0.1) {
      total.value = 0.0;
    }
    for (var element in pedidos) {
      total.value += element['total'];
    }
  }
}
