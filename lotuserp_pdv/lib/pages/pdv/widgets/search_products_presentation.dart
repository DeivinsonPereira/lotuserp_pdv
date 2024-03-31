// busca produtos pela descrição no campo de pesquisa
// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../collections/produto.dart';
import '../../../controllers/pdv.controller.dart';
import '../../../controllers/save_image_path_controller.dart';
import '../../../controllers/search_product_pdv_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../../services/format_numbers.dart';
import '../../../shared/isar_service.dart';
import '../../common/custom_cherry.dart';
import '../custom/get_images.dart';
import '../custom/pdv_colors.dart';

class SearchProductPresentation extends StatelessWidget {
  final String ip;
  final IsarService service;
  final SearchProductPdvController controller;
  final PdvController pdvController;
  final ScrollController scrollController;

  bool? isBarCode;
  SearchProductPresentation({
    Key? key,
    required this.ip,
    required this.service,
    required this.controller,
    required this.pdvController,
    required this.scrollController,
    this.isBarCode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isBalance = false;
    SaveImagePathController saveImagePathController =
        Dependencies.saveImagePathController();
    isBarCode!
        ? saveImagePathController.addImagePathBarcode(controller.search.value)
        : saveImagePathController.addImagePathDesc(controller.search.value);
    return FutureBuilder(
      future: !isBarCode!
          ? service.searchProdutoByDesc(controller.search.value)
          : service.searchProdutoByBarcode(controller.search.value),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          const CustomCherryError(
            message: 'Nenhum resultado encontrado.',
          ).show(context);
        }
        if (snapshot.hasData) {
          List<produto?> produtos = snapshot.data!;
          /*  List<String> produtosDescPathImage =
              saveImagePathController.pathImagesDesc;*/
          List<String> produtoBarcodePathImage =
              saveImagePathController.pathImagesBarcode;
          List<String> imagesPath = [];

          pdvController.setProdutosSearchDesc(produtos);

          controller.clearAll();
          for (var produto in produtos) {
            if (produto!.venda_kg == 1) {
              controller.updateFile(produto.file_imagem ?? '');
              controller.updateNome(produto.descricao ?? '');
              controller.updatePreco(
                  FormatNumbers.formatNumbertoString(produto.pvenda));
              controller.updateUnidade(produto.unidade ?? '');
              controller.updateIdProduto(produto.id_produto);
            } else if (produto.venda_kg == 0) {
              controller.updateFile(produto.file_imagem ?? '');
              controller.updateNome(produto.descricao ?? '');
              controller.updatePreco(
                  FormatNumbers.formatNumbertoString(produto.pvenda));
              controller.updateUnidade(produto.unidade ?? '');
              controller.updateIdProduto(produto.id_produto);
            }
          }

          return GetBuilder<PdvController>(builder: (_) {
            return GridView.builder(
              itemCount: !isBarCode!
                  ? produtos.length == 1
                      ? 1
                      : produtos.length
                  : _.produtosSearchDesc.length == 1
                      ? 1
                      : produtos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                if (!isBarCode!) {
                  try {
                    if (_.produtosSearchDesc
                        .map((e) => e.split('/').last)
                        .contains(produtos[index]!.file_imagem)) {
                      String filePath = _.produtosSearchDesc.firstWhere(
                          (element) =>
                              element.split('/').last ==
                              produtos[index]!.file_imagem);

                      String path = filePath;

                      imagesPath.add(path);
                    } else {
                      imagesPath.add('assets/images/semimagem.png');
                    }
                    // ignore: empty_catches
                  } catch (e) {}
                }

                if (isBarCode!) {
                  try {
                    if (produtoBarcodePathImage
                        .map((e) => e.split('/').last)
                        .contains(produtos[index]!.file_imagem)) {
                      String filePath = produtoBarcodePathImage.firstWhere(
                          (element) =>
                              element.split('/').last ==
                              produtos[index]!.file_imagem);

                      String path = filePath;

                      imagesPath.add(path);
                    } else {
                      imagesPath.add('assets/images/semimagem.png');
                    }
                    // ignore: empty_catches
                  } catch (e) {}
                }

                return InkWell(
                  onTap: () async {
                    if (produtos[index]!.venda_kg == 1) {
                      isBalance = true;

                      _.listenBalance(
                          controller.nome[index],
                          controller.unidade[index],
                          controller.preco[index],
                          controller.idProduto[index],
                          filteredProducts: produtos,
                          isBalance: isBalance);
                    } else {
                      isBalance = false;
                      _.adicionarPedidos(
                          controller.nome[index],
                          controller.unidade[index],
                          controller.preco[index],
                          controller.idProduto[index]);
                    }

                    _.totalSoma();
                    /*  if (!_.pedidos.contains(controller.nome[index])) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          scrollController
                              .jumpTo(scrollController.position.maxScrollExtent);
                        });
                      }*/
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            // CachedNetworkImage que exibe a imagem
                            _.produtosSearchDesc.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:
                                        getImage(_.produtosSearchDesc[index]),
                                  )
                                : Image.asset(
                                    'assets/images/semimagem.png',
                                    scale: 1.0,
                                  ),

                            if (_.getQuantidade(controller.nome[index]) >
                                0) // Verifica se a quantidade é maior que 0

                              Positioned(
                                top: 5,
                                right: 5,
                                child: _.getQuantidade(controller.nome[index]) >
                                        0
                                    ? Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: CustomColors.customSwatchColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Obx(() => Text(
                                              produtos[index]!.venda_kg == 1
                                                  ? '${_.findWeightByName(controller.nome[index])}'
                                                  : '${_.getQuantidade(controller.nome[index])}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      )
                                    : Container(),
                              ),
                          ],
                        ),
                      ),
                      Text(
                        controller.nome[index],
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: TextColors.titleColor),
                      ),
                      Text(
                        controller.unidade[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: TextColors.subtitleColor),
                      ),
                      Text(
                        'R\$ ${controller.preco[index]} ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: TextColors.titleColor),
                      ),
                    ],
                  ),
                );
              },
            );
          });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
