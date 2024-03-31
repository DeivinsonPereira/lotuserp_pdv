import 'dart:io';

import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/produto.dart';

class SaveImagePathController extends GetxController {
  final List<produto_grupo> grupos = [];
  final List<produto> produtos = [];
  List<produto> favoritesProducts = [];

  final List<String> pathImagesGroup = [];
  final List<String> pathImagesProduct = [];
  final List<String> pathImagesFavorites = [];
  List<String> pathImagesDesc = [];
  List<String> pathImagesBarcode = [];

  var imageFiles = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    addImagePathGroup();
  }

  /////////////////////
  /// IMAGENS GRUPO ///
  /////////////////////

  // Busca os dados dos grupos do banco de dados local
  Future<void> getGrupos() async {
    IsarService service = IsarService();
    clearGrupos();
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
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathGroup();
    pathImagesGroup.clear();
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
    clearProducts();
    produtos.assignAll(await service.searchProdutos());
    update();
  }

  // adiciona o path da imagem na variavel de forma simples (faz essa adição, junto com a inserção no banco de dados)
  void addImagePathProductSimple(String path) async {
    if (path.isNotEmpty) {
      clearProducts();
    }
    pathImagesProduct.add(path);
    update();
  }

  // adiciona o path da imagem dos produtos na variavel de forma mais completa
  Future<void> addImagePathProduct(int idGrupo) async {
    IsarService service = IsarService();
    pathImagesProduct.clear();
    List<String?> path = await service.searchImagePathProduct(idGrupo);
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesProduct.add(paths!);
      }
    }
  }

  Future<void> addImagePathFavorite() async {
    IsarService service = IsarService();
    pathImagesFavorites.clear();
    List<String?> path = await service.searchImagePathFavorite();
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesFavorites.add(paths!);
      }
    }
  }

  Future<void> addImagePathFavorites() async {
    await getProdutos();

    if (favoritesProducts.isNotEmpty) {
      clearFavoritesProducts();
    }
    favoritesProducts =
        produtos.where((element) => element.favorito == 1).toList();
  }

  Future<void> addImagePathDesc(String value) async {
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathDesc(value);
    if (pathImagesBarcode.isNotEmpty) {
      clearPathImagesDesc();
    }
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesDesc.add(paths!);
      }
    }
  }

  Future<void> addImagePathBarcode(String value) async {
    IsarService service = IsarService();
    List<String?> path = await service.searchImagePathBarcode(value);
    if (pathImagesBarcode.isNotEmpty) {
      clearPathImagesBarcode();
    }
    if (path.isNotEmpty) {
      for (var paths in path) {
        pathImagesBarcode.add(paths!);
      }
    }
  }

  void clearPathImagesBarcode() {
    pathImagesBarcode.clear();
    update();
  }

  void clearPathImagesDesc() {
    pathImagesDesc.clear();
    update();
  }

  void clearFavoritesProducts() {
    favoritesProducts.clear();
    update();
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
