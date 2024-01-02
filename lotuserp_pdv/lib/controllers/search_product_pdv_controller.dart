import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductPdvController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var search = ''.obs;

  var nome = ''.obs;
  var unidade = ''.obs;
  var preco = ''.obs;
  var idProduto = 0.obs;

  // **** atualizar ****

  //atualizar campo de pesquisa
  void updateSearch() {
    search.value = searchController.text;
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
  }
  


}
