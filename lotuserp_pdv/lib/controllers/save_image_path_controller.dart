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
  var imageFiles = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    getGrupos();
    addImagePath();
    //getProdutos();
  }

  /////////////////////
  /// IMAGENS GRUPO ///
  /////////////////////
  Future<void> getGrupos() async {
    IsarService service = IsarService();
    grupos.assignAll(await service.searchGrupos());
    update();
  }

  void addImagePathSimple(String path) async {
    pathImagesGroup.add(path);
    update();
  }

  Future<void> addImagePath() async {
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
}
