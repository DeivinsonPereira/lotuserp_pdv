import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'dart:math';

import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/dado_empresa.dart';
import '../core/fixed_variables.dart';

class PdvController extends GetxController {
  IsarService service = IsarService();

  RxList pedidos = [].obs;

  //iniciar o grupo "Todos" selecionado
  RxInt isSelectedList = 0.obs;

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

  RxDouble valorAtualCb2 = 0.0.obs;

  // ***** construção page pdvPage *****

  var caixaId = 0.obs;
  var ip = ''.obs;
  var idGrupo = -1.obs;

  final ScrollController scrollController = ScrollController();
  var balancaController = Dependencies.balancaController();
  var liquido = 0.0.obs;

  //status se balanca foi cadastrado
  var statusBalanca = 0.obs;

  //status se tef foi cadastrado
  var statusTef = 0.obs;

  //total Liquido
  void totalLiquido() {
    String numbers1 = numbersDiscountcb2.replaceAll(',', '.');
    double numbersDiscountcb2Formated = double.parse(numbers1);

    //transforma numbersDiscountcb2 em double
    String numbers2 = numbersDiscount.value.replaceAll(',', '.');
    double numbersDiscountFormated = double.parse(numbers2);

    liquido.value = checkbox1.value
        ? totBruto.value - numbersDiscountFormated
        : totBruto.value - numbersDiscountcb2Formated;

    update();
  }

  //atualizar isSelectedList
  void updateIsSelectedList() {
    isSelectedList.value = 0;
  }

  //limpar os campos
  void zerarCampos() {
    pedidos.value = [];
    discountPercentage.value = 0.0;
    discountPercentagecb2.value = '0,00';
    numbersDiscount.value = '0,00';
    numbersDiscountcb2.value = '0,00';
    totalcheckBox1.value = 0.0;
    totalcheckBox2.value = 0.0;
    update();
  }

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
    update();
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
    update();
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
    update();
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
    update();
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
    update();
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
    update();
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
    update();
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
    update();
  }

  //adiciona itens no pedido
  void adicionarPedidos(
      String nomeProduto, String unidade, String price, int idProduto,
      {bool isPesage = false, String quantity = ''}) {
    int index =
        pedidos.indexWhere((pedido) => pedido['nomeProduto'] == nomeProduto);

    String priceString = price;

    String priceSemMilhares = priceString.replaceAll('.', '');

    String priceComPonto = priceSemMilhares.replaceAll(',', '.');

    double precoDouble = double.parse(priceComPonto);

    double quantidade;

    try {
      if (quantity != '' && quantity.isNotEmpty && quantity.isBlank == false) {
        String cleanedQuantity = quantity.replaceAll(RegExp(r'[^0-9.]'), '');
        print('quantidade: $cleanedQuantity');

        quantidade = double.parse(cleanedQuantity);
      } else {
        quantidade = 0.0;
      }

      if (index != -1) {
        if (isPesage) {
          double quant = (pedidos[index]['quantidade'] ?? 0.0) + quantidade;
          String quantidadeStr = quant.toStringAsFixed(3);
          pedidos[index]['quantidade'] = double.parse(quantidadeStr);

          var totalFormated = (quantidade * precoDouble).toStringAsFixed(3);

          pedidos[index]['total'] = double.parse(totalFormated);
        } else {
          pedidos[index]['quantidade'] =
              (pedidos[index]['quantidade'] ?? 1.0) + 1.0;
          pedidos[index]['total'] =
              (pedidos[index]['quantidade'] * pedidos[index]['price']);
        }
      } else {
        pedidos.add({
          'idProduto': idProduto,
          'nomeProduto': nomeProduto,
          'quantidade': isPesage == false ? 1.0 : quantidade,
          'unidade': unidade,
          'price': precoDouble,
          'total': quantidade.isGreaterThan(0.0)
              ? precoDouble * quantidade
              : precoDouble
        });
      }

      scrollController.addListener(() {});
      update();
    } catch (e) {
      print('informativo: $e');
    }
  }

  //cancela o pedido e zera a lista
  void cancelarPedido() {
    if (pedidos.isNotEmpty) {
      pedidos.clear();
      totalcheckBox1.value = 0.0;
    }
    update();
  }

  //remove item do pedido
  void removerPedido(int index) {
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
      totalSomaPedidos();
      if (checkbox1.value) {
        calculateTotal(); // Se o checkbox1 estiver marcado, recalcula o total considerando o desconto em reais
      } else if (checkbox2.value) {
        calculateTotalPercentage(); // Se o checkbox2 estiver marcado, recalcula o total considerando o desconto percentual
      }
      update();
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
    update();
  }

  // ****** métodos para utilizar ao iniciar o controller *****

  //inicializa os métodos necessários
  @override
  void onInit() {
    super.onInit();
    fetchDataFromDatabase();
    getidCaixa();
    loadStatusBalanca();
    scrollController.addListener(() {});
    detectBalanca();
  }

  //busca o id do usuario logado
  Future<int?> getIdUser() async {
    var user = await service.getUserLogged();

    if (user != null) {
      return user.id_user;
    }
    return null;
  }

  //busca o id do caixa
  Future<void> getidCaixa() async {
    var caixa = await service.getCaixaIdWithIdUserAndStatus0();
    caixaId.value = caixa!;
  }

  //busca o ip da empresa
  Future<void> fetchDataFromDatabase() async {
    final dado_empresa? dadoEmpresa = await service.getIpEmpresaFromDatabase();
    if (dadoEmpresa != null) {
      ip.value = dadoEmpresa.ip_empresa!;
      update();
    }
  }

  // ******* Buscas de dados *******

  //busca o status da balanca
  Future<void> loadStatusBalanca() async {
    dado_empresa? balancaFromDb = await service.getDataEmpresa();
    if (balancaFromDb != null &&
        balancaFromDb.balanca != null &&
        balancaFromDb.balanca!.isNotEmpty &&
        balancaFromDb.balanca != 'NENHUMA' &&
        balancaFromDb.status_balanca != 0) {
      statusBalanca.value = balancaFromDb.status_balanca!;
      update();
    } else {
      statusBalanca.value = 0;
      update();
    }
  }

  //busca o status do TEF
  Future<void> loadStatusTef() async {
    dado_empresa? tefFromDb = await service.getDataEmpresa();
    if (tefFromDb != null &&
        tefFromDb.tef != null &&
        tefFromDb.tef!.isNotEmpty &&
        tefFromDb.tef != 'NENHUMA' &&
        tefFromDb.status_tef != 0) {
      statusTef.value = tefFromDb.status_tef!;
      update();
    } else {
      statusTef.value = 0;
      update();
    }
  }

  // escutar balança
  Future<void> listenBalance(dynamic filteredProducts, int index, String? nome,
      String? unidade, String? preco, int? idProduto) async {
    final ScrollController scrollController = ScrollController();

    var balancaController = Dependencies.balancaController();
    try {
      if (filteredProducts[index].venda_kg == 1) {
        if (statusBalanca.value == 1) {
          balancaController.iniciarEscutaDados();
          if (balancaController.pesoLido.value.isNotEmpty) {
            print("peso da balança:  ${balancaController.pesoLido.value}");
            adicionarPedidos(nome!, unidade!, preco!, idProduto!,
                isPesage: true, quantity: balancaController.pesoLido.value);
          }

          print(pedidos.toString());
        }
      } else {
        adicionarPedidos(nome!, unidade!, preco!, idProduto!);

        totalSoma();
        if (!pedidos.contains(nome)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            }
          });
        }
      }
    } catch (e) {
      print("erro ao iniciar o controller pdv: $e");
    }
  }

  Future<void> detectBalanca() async {
    await loadStatusTef();
    if (statusBalanca.value == FixedVariables.BALANCE_CONFIGURED) {
      balancaController.detectBalanca();
    }
  }
}
