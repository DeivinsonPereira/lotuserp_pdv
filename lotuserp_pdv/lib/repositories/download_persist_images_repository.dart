import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/core/header.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/produto.dart';
import '../services/dependencies.dart';

// FAZ O DOWNLOAD DAS IMAGENS E SALVA NO APLICATIVO
Future<void> downloadImageGroup() async {
  Logger logger = Logger();
  var saveImagePathController = Dependencies.saveImagePathController();
  await saveImagePathController.getGrupos();

  // OBTER O IP DA EMPRESA
  String ip =
      Dependencies.textFieldController().numContratoEmpresaController.text;
  try {
    // OBTER OS GRUPOS
    List<produto_grupo> grupos = saveImagePathController.grupos;
    Directory dir = await getApplicationDocumentsDirectory();
    await deleteExistingFiles('${dir.path}/assets/grupos/');

    for (var grupo in grupos) {
      // BAIXAR A IMAGEM
      String? fileImage = grupo.file_imagem;
      if (fileImage != null || fileImage != '') {
        var url = '${ip}getimagem?categoria=GRU&file=$fileImage&result=JSO';
        var fileName = grupo.file_imagem;

        var response = await http.get(
            Uri.parse(
              url,
            ),
            headers: Header.header);

        if (response.statusCode == 200) {
          try {
            var jsonResponse = jsonDecode(response.body);

            if (jsonResponse['success'] == false ||
                jsonResponse['success'] == null) {
              continue;
            }
          } catch (e) {
            String pathName = '${dir.path}/assets/grupos/$fileName';

            await Directory('${dir.path}/assets/grupos')
                .create(recursive: true);
            File file = File(pathName);
            var result = await file.writeAsBytes(response.bodyBytes);

            logger.d('Imagem baixada com sucesso $result');
          }
        } else {
          logger.e('Erro ao baixar imagem');
        }
      } else {
        logger.e('Erro ao baixar imagem');
      }
    }
  } catch (e) {
    logger.e('Erro ao baixar imagem: $e');
  }
}

Future<void> downloadImageProduct() async {
  Logger logger = Logger();
  var saveImagePathController = Dependencies.saveImagePathController();
  await saveImagePathController.getProdutos();

  // OBTER O IP DA EMPRESA
  String ip =
      Dependencies.textFieldController().numContratoEmpresaController.text;
  try {
    // OBTER OS PRODUTOS
    List<produto> produtos = saveImagePathController.produtos;
    Directory dir = await getApplicationDocumentsDirectory();
    await deleteExistingFiles('${dir.path}/assets/produtos/');

    for (var produto in produtos) {
      // BAIXAR A IMAGEM
      String? fileImage = produto.file_imagem;
      if (fileImage != null || fileImage != '') {
        var url = '${ip}getimagem?categoria=PRO&file=$fileImage&result=JSO';
        var fileName = produto.file_imagem;

        var response = await http.get(
            Uri.parse(
              url,
            ),
            headers: Header.header);

        if (response.statusCode == 200) {
          try {
            var jsonResponse = jsonDecode(response.body);

            if (jsonResponse['success'] == false ||
                jsonResponse['success'] == null) {
              continue;
            }
          } catch (e) {
            Directory dir = await getApplicationDocumentsDirectory();
            String pathName = '${dir.path}/assets/produtos/$fileName';
            await Directory('${dir.path}/assets/produtos')
                .create(recursive: true);
            File file = File(pathName);
            var result = await file.writeAsBytes(response.bodyBytes);

            logger.d('Imagem baixada com sucesso $result');
          }
        } else {
          logger.e('Erro ao baixar imagem');
        }
      } else {
        logger.e('Erro ao baixar imagem');
      }
    }
  } catch (e) {
    logger.e('Erro ao baixar imagem: $e');
  }
}

Future<void> deleteExistingFiles(String folderPath) async {
  final directory = Directory(folderPath);
  if (await directory.exists()) {
    // List all files and subdirectories in the directory
    final entities = directory.listSync();

    for (final entity in entities) {
      if (entity is File) {
        // Delete the file
        await entity.delete();
        if (kDebugMode) {
          print('Arquivo excluído: ${entity.path}');
        }
      } else if (entity is Directory) {
        // Recursively delete subdirectories
        await deleteExistingFiles(entity.path);
      }
    }
  } else {
    if (kDebugMode) {
      print('A pasta não existe: $folderPath');
    }
  }
}

// PERSISTIR AS IMAGENS
Future<void> persistImagesInformationGroup() async {
  IsarService service = IsarService();
  await service.saveImagemGrupos();
}

Future<void> persistImagesInformationProduct() async {
  IsarService service = IsarService();
  await service.saveImagemProdutos();
}

// LISTAR OS ARQUIVOS QUE TEM DENTRO DE DETERMINADO DIRETORIO
Future<void> listDirectiories() async {
  Logger logger = Logger();
  Directory dir = await getApplicationDocumentsDirectory();
  String pathNameGroup = '${dir.path}/assets/grupos/';
  Directory directoryGroup = Directory(pathNameGroup);

  String pathNameProduct = '${dir.path}/assets/produtos/';
  Directory directoryProduct = Directory(pathNameProduct);

  try {
    var entitiesGroup =
        directoryGroup.listSync(recursive: false, followLinks: false);
    var entitiesProduct =
        directoryProduct.listSync(recursive: false, followLinks: false);

    for (FileSystemEntity entity in entitiesGroup) {
      logger.d('Caminho do arquivo existente: ${entity.path}');
    }
    for (FileSystemEntity entity in entitiesProduct) {
      logger.d('Caminho do arquivo existente: ${entity.path}');
    }
  } catch (e) {
    logger.e(e.toString());
  }
}
