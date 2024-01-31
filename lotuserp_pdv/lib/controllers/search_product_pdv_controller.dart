import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductPdvController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var search = ''.obs;

  var file = [].obs;
  var nome = [].obs;
  var unidade = [].obs;
  var preco = [].obs;
  var idProduto = [].obs;
  var quantity = [].obs;

  var listaGrupos = ['TODOS'];

  bool isSearch = false;
  bool isBarCode = false;

  dynamic filteredProducts;

  // ** atualizar **

  //atualizar isBarCode
  void updateIsBarCode() {
    isBarCode = !isBarCode;
    update();
  }

  //atualizar isSearch
  void updateIsSearch(bool decision) {
    isSearch = decision;
    update();
  }

  //atualizar file
  void updateFile(String value) {
    file.add(value);
  }

  //atualizar campo de pesquisa
  void updateSearch() {
    search.value = searchController.text;
    update();
  }

  //atualizar nome
  void updateNome(String value) {
    nome.add(value);
  }

  //atualizar unidade
  void updateUnidade(String value) {
    unidade.add(value);
  }

  //atualizar preco
  void updatePreco(String value) {
    preco.add(value);
  }

  //atualizar idProduto
  void updateIdProduto(int value) {
    idProduto.add(value);
  }

  // ** limpar ***

  //limpar todos os campos
  void clearAll() {
    nome.value = [];
    unidade.value = [];
    preco.value = [];
    idProduto.value = [];
    file.value = [];
  }

  void clearSearch() {
    searchController.clear();
    search.value = '';
    update();
  }
}
