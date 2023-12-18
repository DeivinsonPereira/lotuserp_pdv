import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdutoController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController itensPerPageController = TextEditingController();

  RxString valorVendaFormatted = '0,00'.obs;

  //variavel que define quantos itens a paginação irá mostrar
  RxInt itensPerPage = 10.obs;

  //variavel que mostra o total de páginas
  RxInt totalPages = 0.obs;

  //variavel que mostra o numero do item na páginação atual
  RxInt numPage = 0.obs;

  //variavel para definir a opção selecionada no dropdown de ProdutosPage
  RxString textOption = 'DESCRIÇÃO'.obs;

  //variavel para guardar o texto digitado no campo de pesquisa
  RxString search = ''.obs;

  //variavel para verificar se o botão de pesquisa foi executado ou não.
  RxBool searchExecuted = false.obs;

  //objeto vindo do banco de dados local (snapshot)
  var product = [].obs;

  //atualizar variavel ValorVendaFormatted
  void updateValorVendaFormatted(double value) {
    //formatar value para brl
    String valueFormatted = value.toStringAsFixed(2);
    valueFormatted = valueFormatted.replaceAll('.', ',');
    valueFormatted = NumberFormat('#,###.00', 'pt_BR').format(value);
    //atualizar valorVendaFormatted

    valorVendaFormatted.value = valueFormatted;
  }

  //atualiza a variavel product com o valor do snapshot
  void updateProduct(List value) {
    product.value = value;
  }

  //atualiza a variavel numPage para mais
  void changeNumPagePlus() {
    if (numPage.value < totalPages.value - 1) {
      //verificar se é a ultima página ou não ####################################
      numPage.value++;
    }
  }

  //atualiza a variavel numPage para menos
  void changeNumPageMinus() {
    if (numPage.value > 0) {
      numPage.value--;
    }
  }

  //atualiza a variavel pageSize escolhido pelo usuário ou padrão
  void changePageSize() {
    itensPerPage.value = int.parse(itensPerPageController.text);
  }

  //atualiza a variavel totalPages de acordo com a quantidade de itens por página e o total de itens
  void changeTotalPages(int value) {
    totalPages.value = (value / itensPerPage.value).ceil();
  }

  //substituir valor na variavel search
  void setSearch() {
    searchController.text.runtimeType == int
        ? search.value = searchController.text.toString()
        : search.value = searchController.text;
  }

  //Muda o texto da variavel textOption
  void changeTextOption(String value) {
    textOption.value = value;
  }
}
