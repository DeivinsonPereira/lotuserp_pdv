import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductPdvController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var search = ''.obs;

  var file = ''.obs;
  var nome = ''.obs;
  var unidade = ''.obs;
  var preco = ''.obs;
  var idProduto = 0.obs;

  bool isSearch = false;

  // **** atualizar ****

  //atualizar isSearch
  void updateIsSearch(bool decision) {
    isSearch = decision;
    update();
  }

  //atualizar file
  void updateFile(String value) {
    file.value = value;
  }

  //atualizar campo de pesquisa
  void updateSearch() {
    search.value = searchController.text;
    update();
  }

  //atualizar nome
  void updateNome(String value) {
    nome.value = value;
  }

  //atualizar unidade
  void updateUnidade(String value) {
    unidade.value = value;
  }

  //atualizar preco
  void updatePreco(String value) {
    preco.value = value;
  }

  //atualizar idProduto
  void updateIdProduto(int value) {
    idProduto.value = value;
  }

  // ***** limpar ****

  //limpar todos os campos
  void clearAll() {
    searchController.clear();
    search.value = '';
    nome.value = '';
    unidade.value = '';
    preco.value = '';
    idProduto.value = 0;
    update();
  }
}
