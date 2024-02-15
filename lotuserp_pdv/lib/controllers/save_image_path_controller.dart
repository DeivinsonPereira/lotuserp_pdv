import 'dart:io';

import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/produto.dart';

class SaveImagePathController extends GetxController {
  final List<produto_grupo> grupos = [];
  final List<produto> produtos = [];

  final List<String> pathImagesGroup = [];
  final List<String> pathImagesProduct = [];
  final List<String> pathImagesFavorites = [];
  var imageFiles = <File>[].obs;

  /////////////////////
  /// IMAGENS GRUPO ///
  /////////////////////

  // Busca os dados dos grupos do banco de dados local
  Future<void> getGrupos() async {
    IsarService service = IsarService();
    grupos.assignAll(await service.searchGrupos());
    update();
  }

  // adiciona o path da imagem na variavel de forma simples (faz essa adição, junto com a inserção no banco de dados)
  void addImagePathSimple(String path) async {
    pathImagesGroup.add(path);
    update();
  }

  // adiciona o path da imagem na variavel de forma mais completa
  Future<void> addImagePathGroup() async {
    if (pathImagesGroup.isNotEmpty) {
      pathImagesGroup.clear();
    }
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathGroup();
    if (path.isNotEmpty) {
      for (var file in path) {
        pathImagesGroup.add(file!);
      }
      update();
    }
  }

  void clear() {
    pathImagesGroup.clear();
    update();
  }

  void clearGrupos() {
    grupos.clear();
    update();
  }

  void clearPathImages() {
    pathImagesGroup.clear();
    update();
  }

  void clearAll() {
    clear();
    clearGrupos();
    clearPathImages();
    update();
  }

  ///////////////////////
  /// IMAGENS PRODUTO ///
  ///////////////////////

  Future<void> getProdutos() async {
    IsarService service = IsarService();
    produtos.assignAll(await service.searchProdutos());
    update();
  }

  // adiciona o path da imagem na variavel de forma simples (faz essa adição, junto com a inserção no banco de dados)
  void addImagePathProductSimple(String path) async {
    pathImagesProduct.add(path);
    update();
  }

  // adiciona o path da imagem dos produtos na variavel de forma mais completa
  Future<void> addImagePathProduct(int idGrupo) async {
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathProduct(idGrupo);
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesProduct.add(paths!);
      }
    }
  }

  Future<void> addImagePathFavorite() async {
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathFavorite();
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesFavorites.add(paths!);
      }
    }
  }

  void clearProductImages() {
    pathImagesProduct.clear();
    update();
  }

  void clearProducts() {
    produtos.clear();
    update();
  }

  void clearAllProducts() {
    clear();
    clearGrupos();
    clearPathImages();
    update();
  }
}
