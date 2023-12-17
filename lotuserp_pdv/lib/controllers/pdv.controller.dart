import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class PdvController extends GetxController {
  RxList pedidos = [].obs;

  //checkbox desconto real
  RxBool checkbox1 = true.obs;

  //checkbox porcentagem
  RxBool checkbox2 = false.obs;

  //######### checkbox1 ########

  //total com desconto checkbox1
  RxDouble totalcheckBox1 = 0.0.obs;

  //desconto em reais checkbox1
  RxString numbersDiscount = '0,00'.obs;

  //percentual de desconto checkbox1
  RxDouble discountPercentage = 0.0.obs;

  //########### checkbox2 ########

  //total com desconto checkbox2
  RxDouble totalcheckBox2 = 0.0.obs;

  //desconto em reais checkbox2
  RxString numbersDiscountcb2 = '0,00'.obs;

  //percentual de desconto checkbox2
  RxString discountPercentagecb2 = '0,00'.obs;

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

  // ######### checkbox 1 true ########

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

    totalcheckBox1.value = subtotal - discount;
  }

  //adiciona numeros no desconto caso checkbox 1 == true
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

    totalcheckBox1.value = newTotal;
    calculateDiscountPercentage();
  }

  //########## checkbox 2 true ########

  void addPercentageDiscount(String number) {
    if (number == '0' && discountPercentagecb2.value == '0.00') {
      return;
    }
    String newValue =
        discountPercentagecb2.value.replaceAll(RegExp(r'[^\d]'), '') + number;

    discountPercentagecb2.value =
        formatAsCurrency(double.parse(newValue) / 100);

    calculateTotalPercentage();
  }

  void calculateTotalPercentage() {
    double discount = double.parse(
            numbersDiscountcb2.value.replaceAll(RegExp(r'[^\d]'), '')) /
        100;

    double subtotal = 0.0;

    for (var element in pedidos) {
      subtotal += element['total'];
    }

    double newTotal = subtotal - (subtotal * discount);

    totalcheckBox2.value = newTotal;

    calculateDiscountPercentagecb2();
  }

  void calculateDiscountPercentagecb2() {
    double discount = double.parse(
            discountPercentagecb2.value.replaceAll(RegExp(r'[^\d]'), '')) /
        10000;

    double subtotal = 0.0;

    for (var element in pedidos) {
      subtotal += element['total'];
    }

    var aux = discount * subtotal;

    //transformar double aux em string

    numbersDiscountcb2.value = aux.toStringAsFixed(2).replaceAll('.', ',');

    totalcheckBox2.value = subtotal - discount;
  }

  //transforma double em string transformando virgula em ponto;
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

  void removeNumberDiscountCb2() {
    if (discountPercentagecb2.value.length > 1) {
      String newValue = discountPercentagecb2.value
          .replaceAll(RegExp(r'[^\d]'), '')
          .substring(0, discountPercentagecb2.value.length - 2);
      discountPercentagecb2.value =
          formatAsCurrency(double.parse(newValue) / 100);
    } else {
      discountPercentagecb2.value = '0,00';
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
        totalcheckBox1.value -= pedidos[index]['price'];
        pedidos[index]['quantidade'] -= 1;
        pedidos[index]['total'] =
            pedidos[index]['quantidade'] * pedidos[index]['price'];
        update();
      } else {
        totalcheckBox1.value -= pedidos[index]['total'];
        pedidos.removeAt(index);
        update();
      }
    }
  }

  // soma o valor total a lista
  void totalSoma() {
    if (totalcheckBox1 > 0.1) {
      totalcheckBox1.value = 0.0;
    }
    for (var element in pedidos) {
      totalcheckBox1.value += element['total'];
    }
  }
}
