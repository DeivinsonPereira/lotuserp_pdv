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

  //troco em reais se Checkbox 1 for true
  RxDouble trocoCb1 = 0.0.obs;

  //troco em reais se Checkbox 2 for true
  RxDouble trocoCb2 = 0.0.obs;

  //total bruto
  RxDouble totBruto = 0.0.obs;

  final ScrollController scrollController = ScrollController();

  //atualiza o valor do troco
  void updateTroco(double value) {
    checkbox1.value ? trocoCb1.value = value : trocoCb2.value = value;
  }

  //soma o valor total e atualiza a cada modificação na lista pedidos
  void totalSomaPedidos() {
    double totalBruto = 0.0;
    for (var element in pedidos) {
      totalBruto += element['total'];
    }
    totBruto.value = totalBruto;
  }

  //busca quantidades pedidos de um determinado item
  double getQuantidade(String nomeProduto) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);
    return index != -1.0 ? pedidos[index]['quantidade'] : 0.0;
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

  //adiciona numeros na porcentagem caso checkbox 2 == true
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

  //calcula o total entre desconto em porcentagem e subtotal
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

  //calcula o total entre desconto em porcentagem e subtotal
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

  //remove numero do NumberDiscount cb1
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

  //remove numero do percentageDiscount cb2
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
    calculateTotalPercentage();
  }

  //adiciona itens no pedido
  void adicionarPedidos(String nomeProduto, String unidade, String price,
      int idProduto, Function callback) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);

    String priceString = price;

    String priceSemMilhares = priceString.replaceAll('.', '');

    String priceComPonto = priceSemMilhares.replaceAll(',', '.');

    double precoDouble = double.parse(priceComPonto);

    if (index != -1) {
      pedidos[index]['quantidade'] =
          (pedidos[index]['quantidade'] ?? 1.0) + 1.0;
      pedidos[index]['total'] =
          (pedidos[index]['quantidade'] * pedidos[index]['price']);
    } else {
      pedidos.add({
        'idProduto': idProduto,
        'nomeProduto': nomeProduto,
        'quantidade': 1.0,
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
      if (pedidos[index]['quantidade'] > 1.0) {
        totalcheckBox1.value -= pedidos[index]['price'];
        pedidos[index]['quantidade'] -= 1.0;
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
