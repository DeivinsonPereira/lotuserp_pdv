// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/image_path_product.dart';

import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/save_image_path_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/buttons_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/pdv_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../controllers/search_product_pdv_controller.dart';
import '../../services/format_txt.dart';
import '../../services/dependencies.dart';
import '../common/custom_cherry_error.dart';
import '../product/product_monitor_page.dart';
import '../cpf_cnpj_page.dart/cpf_cnpj_page.dart';
import '../second_copy/nfce_second_copy_page.dart';
import 'widgets/get_images.dart';

class PdvMonitorPage extends StatefulWidget {
  const PdvMonitorPage({super.key});

  @override
  State<PdvMonitorPage> createState() => _PdvMonitorPageState();
}

class _PdvMonitorPageState extends State<PdvMonitorPage> {
  int idGrupo = -1;

  late NumberFormat formatoBrasileiro;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sideBarController = Dependencies.sidebarController();
    var passwordController = Dependencies.passwordController();
    var globalController = Dependencies.globalController();
    var controller = Dependencies.pdvController();
    var paymentController = Dependencies.paymentController();
    var searchProductPdvController = Dependencies.searchProductPdvController();
    var responseServidorController = Dependencies.responseServidorController();
    Dependencies.configcontroller();
    Dependencies.textFieldController();
    var saveImagePathController = Dependencies.saveImagePathController();
    IsarService service = IsarService();

    var userName = passwordController.userController.text;

    var precos = [];
    // ignore: unused_local_variable
    String total;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    List<String> listaGrupos = ['FAVORITOS'];

    List<produto> getProdutoById(List<produto> product) {
      var produtos =
          product.where((product) => product.id_grupo == idGrupo).toList();
      if (produtos.isNotEmpty) {
        if (saveImagePathController.pathImagesProduct.isEmpty) {
          saveImagePathController.addImagePathProduct(produtos[0].id_grupo!);
        }
      }
      return produtos;
    }

    void getImagesGroupMethod() async {
      saveImagePathController.clearGrupos();
      await saveImagePathController.addImagePathGroup();
    }

    var size = MediaQuery.of(context).size;

    globalController.setIdUsuario();
    globalController.setCaixaAbertaId(globalController.userId);
    controller.fetchDataFromDatabase();
    saveImagePathController.clearProductImages();
    saveImagePathController.addImagePathFavorite();
    saveImagePathController.addImagePathFavorites();

    // Pagamento e total
    Widget paymentAndTotal(PdvController _) {
      return Flexible(
        flex: 1,
        child: InkWell(
          onTap: () {
            if (_.pedidos.isEmpty) {
              const CustomCherryError(message: 'Nenhum item adicionado')
                  .show(context);
            } else {
              Get.toNamed(PagesRoutes.paymentRoute);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 5, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    alignment: Alignment.centerRight,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pagamento',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          formatoBrasileiro.format(_.totalcheckBox1.value),
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    //Resumo e lista de pedidos
    Widget resumeAndListPedidos(PdvController controller) {
      return Flexible(
        flex: 6,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      // Cabeçalho, Resumo
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Resumo',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${controller.pedidos.length} itens',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    // lista de pedidos
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Obx(() => ListView.builder(
                                controller: scrollController,
                                itemCount: controller.pedidos.length,
                                itemBuilder: (context, index) {
                                  total = formatoBrasileiro.format(
                                      controller.pedidos[index]['total']);

                                  return Card(
                                    elevation: 2,
                                    child: Row(
                                      children: [
                                        // Leading widget - Ícone
                                        Container(
                                          width: 60,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            color: CustomColors
                                                .customSwatchColor[100],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              controller.removerPedido(index);
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.trash,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 170, 46, 37),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            width:
                                                10), // Espaço entre o ícone e o texto
                                        // Text widgets - Título e Subtítulo
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.pedidos[index]['idProduto']} - ${controller.pedidos[index]['nomeProduto']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${controller.pedidos[index]['quantidade']} x R\$ ${formatoBrasileiro.format(controller.pedidos[index]['price'])} ${controller.pedidos[index]['unidade']}  =  R\$ $total',
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Trailing widget - Espaço ou outro widget, se necessário
                                        const Text(
                                          ' ',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Informações de caixa, logo, botões, etc...
    Widget informationsAndButtons(PdvController _) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                //container que envolve a logo e informações
                Container(
                  width: 150,
                  height: 90,
                  decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset(
                        'assets/images/Logo Nova Branco Vertical.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Informações
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.customSwatchColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 170,
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  sideBarController.hours.value,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 28),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${_.caixaId.value.toString().padLeft(6, '0')}  -  ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  sideBarController.dataAbertura.value,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                            Text(
                              userName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Botões
                ButtonsPdv().iconsOptions(
                    FontAwesomeIcons.clipboardList,
                    'Produtos',
                    () => showDialog(
                          context: context,
                          builder: (context) {
                            return const ProductMonitorPage();
                          },
                        )),
                ButtonsPdv().iconsOptions(
                    FontAwesomeIcons.addressCard,
                    'CPF/CNPJ',
                    () => {
                          responseServidorController.limparCpfCnpj(),
                          Get.dialog(
                              barrierDismissible: false, const CpfCnpjPage())
                        }),
                /* ButtonsPdv().iconsOptions(
                    FontAwesomeIcons.weightScale, 'Balança', () => Container()),*/
                ButtonsPdv().iconsOptions(FontAwesomeIcons.solidTrashCan,
                    'Cancelar', () => _.cancelarPedido()),
                ButtonsPdv().iconsOptions(FontAwesomeIcons.moneyBillTrendUp,
                    'Vendas', () => Get.dialog(const NfceSecondCopyPage())),
              ],
            ),
          ),
        ),
      );
    }

    //lista de produtos
    Widget listProduct(PdvController controller) {
      return Expanded(
        flex: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: GetBuilder<SearchProductPdvController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _.isSearch
                  ? (!_.isBarCode
                      ? _SearchProduct(
                          ip: controller.ip.value,
                          formatoBrasileiro: formatoBrasileiro,
                          service: service,
                          controller: searchProductPdvController,
                          pdvController: controller,
                          scrollController: scrollController,
                        )
                      : _SearchProduct(
                          ip: controller.ip.value,
                          formatoBrasileiro: formatoBrasileiro,
                          service: service,
                          controller: searchProductPdvController,
                          pdvController: controller,
                          isBarCode: true,
                          scrollController: scrollController,
                        ))
                  : StreamBuilder(
                      stream: service
                          .listenProdutos(), //service.listenProdutosFavorite(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Produto não encontrado');
                        }
                        if (snapshot.hasData) {
                          var produtos = snapshot.data!;
                          List<String> imagesFavorite = [];
                          List<String> imagesProductsCorrect = [];
                          List<produto> favoriteItems = [];
                          getImagesGroupMethod();
                          dynamic filteredProducts;
                          if (controller.isSelectedList.value >= 0) {
                            if (listaGrupos[controller.isSelectedList.value] !=
                                'FAVORITOS') {
                              filteredProducts = getProdutoById(produtos);
                            } else {
                              filteredProducts = produtos;
                            }
                          } else {
                            filteredProducts = [];
                          }

                          return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 30,
                              ),
                              itemCount: listaGrupos[
                                          controller.isSelectedList.value] ==
                                      'FAVORITOS'
                                  ? saveImagePathController
                                      .favoritesProducts.length
                                  : filteredProducts.length,
                              itemBuilder: (BuildContext context, int index) {
                                String? nome;
                                String? unidade;
                                String? file;
                                String preco = '';
                                int? idProduto;

                                List<String> fileImageProduct;
                                List<String> fileImageFavorite;

                                if (controller.isSelectedList.value >= 0) {
                                  if (listaGrupos[controller
                                              .isSelectedList.value] ==
                                          'FAVORITOS' ||
                                      listaGrupos[controller
                                              .isSelectedList.value] ==
                                          '0') {
                                    List<produto> favorite =
                                        saveImagePathController
                                            .favoritesProducts;

                                    produtos.isNotEmpty
                                        ? file = produtos[index].file_imagem!
                                        : file = null;
                                    nome = favorite[index].descricao;
                                    preco = formatoBrasileiro
                                        .format(favorite[index].pvenda);
                                    if (precos.isNotEmpty) {}
                                    precos.add(preco);
                                    unidade = favorite[index].unidade;
                                    idProduto = favorite[index].id_produto;
                                  } else {
                                    file = saveImagePathController
                                            .favoritesProducts[index]
                                            .file_imagem ??
                                        "Valor Padrão";
                                    nome = filteredProducts[index].descricao ??
                                        "null";

                                    preco = formatoBrasileiro
                                        .format(filteredProducts[index].pvenda);

                                    unidade =
                                        filteredProducts[index].unidade ?? "";
                                    idProduto =
                                        filteredProducts[index].id_produto;
                                  }

                                  fileImageProduct =
                                      saveImagePathController.pathImagesProduct;

                                  fileImageFavorite = saveImagePathController
                                      .pathImagesFavorites;

                                  try {
                                    if (fileImageProduct
                                        .map((e) => e.split('/').last)
                                        .contains(filteredProducts[index]
                                            .file_imagem)) {
                                      String filePath = fileImageFavorite
                                          .firstWhere((element) =>
                                              element.split('/').last ==
                                              filteredProducts[index]
                                                  .file_imagem);

                                      imagesProductsCorrect.add(filePath);
                                    } else {
                                      imagesProductsCorrect
                                          .add('assets/images/semimagem.png');
                                    }
                                    // ignore: empty_catches
                                  } catch (e) {}

                                  try {
                                    if (fileImageFavorite
                                        .map((e) => e.split('/').last)
                                        .contains(saveImagePathController
                                            .favoritesProducts[index]
                                            .file_imagem)) {
                                      String filePath = fileImageFavorite
                                          .firstWhere((element) =>
                                              element.split('/').last ==
                                              saveImagePathController
                                                  .favoritesProducts[index]
                                                  .file_imagem);

                                      imagesFavorite.add(filePath);
                                    } else {
                                      imagesFavorite
                                          .add('assets/images/semimagem.png');
                                      // ignore: empty_catches
                                    }
                                    // ignore: empty_catches
                                  } catch (e) {}

                                  return InkWell(
                                    onTap: () async {
                                      await controller.listenBalance(
                                        nome!,
                                        unidade!,
                                        preco,
                                        idProduto!,
                                        filteredProducts: filteredProducts,
                                        index: index,
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              listaGrupos[controller
                                                          .isSelectedList
                                                          .value] ==
                                                      'FAVORITOS'
                                                  ? saveImagePathController
                                                          .pathImagesFavorites
                                                          .isNotEmpty
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: getImage(
                                                              imagesFavorite[
                                                                  index]))
                                                      : const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: index <
                                                              imagesProductsCorrect
                                                                  .length
                                                          ? getImage(
                                                              imagesProductsCorrect[
                                                                  index])
                                                          : Image.asset(
                                                              'assets/images/semimagem.png',
                                                            ),
                                                    ),
                                              if (controller
                                                      .getQuantidade(nome!) >
                                                  0) // Verifica se a quantidade é maior que 0

                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child:
                                                      controller.getQuantidade(
                                                                  nome) >
                                                              0
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: CustomColors
                                                                    .customSwatchColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                              child:
                                                                  Obx(
                                                                      () =>
                                                                          Text(
                                                                            filteredProducts[index].venda_kg == 1
                                                                                ? '${controller.findWeightByName(nome!)}'
                                                                                : '${controller.getQuantidade(nome!)}',
                                                                            style:
                                                                                const TextStyle(
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
                                          nome,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: TextColors.titleColor),
                                        ),
                                        Text(
                                          '$unidade',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: TextColors.subtitleColor),
                                        ),
                                        Text(
                                          'R\$ $preco ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: TextColors.titleColor),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
            );
          }),
        ),
      );
    }

    // linha de grupo de produtos
    Widget lineGroupProduct(PdvController controller) {
      return
          //linha de grupos de produtos
          Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: StreamBuilder(
              stream: service.listenGrupo(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Grupo não encontrado');
                }
                if (snapshot.hasData) {
                  var grupo = snapshot.data!;
                  List<String> imagesGroup = [];
                  return Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.585, //765,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: grupo.isEmpty ? 1 : grupo.length + 1,
                          itemBuilder: (context, index) {
                            List<String> fileImageGroup =
                                saveImagePathController.pathImagesGroup;

                            if (listaGrupos.length > 1) {
                              listaGrupos.clear();
                            }
                            listaGrupos.add(
                              'FAVORITOS',
                            );
                            for (var element in grupo) {
                              if (element.grupo_descricao != null) {
                                listaGrupos.add(element.grupo_descricao!);
                              }
                            }
                            if (index != 0) {
                              if (fileImageGroup
                                  .map((e) => e.split('/').last)
                                  .contains(index <= grupo.length
                                      ? grupo[index - 1].file_imagem
                                      : '')) {
                                String filePath = fileImageGroup.firstWhere(
                                    (element) =>
                                        element.split('/').last ==
                                        grupo[index - 1].file_imagem);

                                imagesGroup.add(filePath);
                              } else {
                                imagesGroup.add('assets/images/semimagem.png');
                              }
                            }

                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.isSelectedList.value = index;
                                    if (index != 0) {
                                      idGrupo = grupo[index - 1].id_grupo;
                                    }
                                  });
                                },
                                child: Row(children: [
                                  SizedBox(
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: listaGrupos[index] !=
                                                    'FAVORITOS'
                                                ? getImage(
                                                    imagesGroup[index - 1])
                                                : Image.asset(
                                                    'assets/images/favorito.png',
                                                    width: 55)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: controller.isSelectedList
                                                            .value ==
                                                        index
                                                    ? CustomColors
                                                        .customSwatchColor
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              listaGrupos[index],
                                              style: TextStyle(
                                                color: controller.isSelectedList
                                                            .value ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: controller
                                                            .isSelectedList
                                                            .value ==
                                                        index
                                                    ? 12
                                                    : 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]));
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      );
    }

    // linha de pesquisa e voltar
    Widget lineSearchAndBackButton(PdvController controller) {
      return Row(
        children: [
          // Icone de voltar
          IconButton(
            onPressed: () {
              bool tefPaymentOpen = paymentController.paymentsTotal.any(
                  (pagamento) => pagamento['transacaoBemSucedida'] == true);
              if (tefPaymentOpen == true) {
                const CustomCherryError(
                  message:
                      'Existem pagamentos em aberto, por favor finalize para voltar.',
                ).show(context);
              } else {
                controller.pedidos.clear();
                Get.offNamed(PagesRoutes.homePageRoute);
              }
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 70, 70, 70),
            ),
          ),

          // Campo de busca
          Flexible(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: GetBuilder<SearchProductPdvController>(builder: (_) {
                return TextField(
                  controller: searchProductPdvController.searchController,
                  inputFormatters: [UpperCaseTxt()],
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        searchProductPdvController.updateIsBarCode();
                      },
                      icon: const Icon(Icons.barcode_reader),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 10, right: 10, top: 12),
                    disabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    border: InputBorder.none,
                    hintText: _.isBarCode
                        ? 'Faça a leitura do código de barras'
                        : 'Busque um produto por nome',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 53, 53, 53), fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: _.isBarCode
                        ? IconButton(
                            onPressed: () {
                              _.updateIsBarCode();
                            },
                            icon: const Icon(
                              FontAwesomeIcons.barcode,
                              color: Colors.black,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _.updateIsBarCode();
                            },
                            icon: const Icon(
                              FontAwesomeIcons.keyboard,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  onChanged: (value) {
                    searchProductPdvController.updateSearch();
                    if (value == '') {
                      searchProductPdvController.updateIsSearch(false);
                    } else {
                      searchProductPdvController.updateIsSearch(true);
                    }
                  },
                );
              }),
            ),
          ),
        ],
      );
    }

    // divisão da tela
    Widget divisionWidget(PdvController controller) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(children: [
                lineSearchAndBackButton(controller),
                lineGroupProduct(controller),
                listProduct(controller),
                informationsAndButtons(controller),
              ]),
            ),
            Expanded(
              flex: 4,
              child: Column(children: [
                resumeAndListPedidos(controller),
                const SizedBox(height: 10),
                paymentAndTotal(controller),
              ]),
            ),
          ],
        ),
      );
    }

    //início do conteúdo
    Widget conteudo(PdvController controller) {
      return SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: divisionWidget(controller),
        ),
      );
    }

    //builder da page
    return GetBuilder<PdvController>(
      init: PdvController(),
      builder: (controller) {
        return Scaffold(
          body: conteudo(controller),
        );
      },
    );
  }
}

// busca produtos pela descrição no campo de pesquisa
// ignore: must_be_immutable
class _SearchProduct extends StatelessWidget {
  final String ip;
  final NumberFormat formatoBrasileiro;
  final IsarService service;
  final SearchProductPdvController controller;
  final PdvController pdvController;
  final ScrollController scrollController;

  bool isBarCode;
  _SearchProduct({
    Key? key,
    required this.ip,
    required this.formatoBrasileiro,
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
    isBarCode
        ? saveImagePathController.addImagePathBarcode(controller.search.value)
        : saveImagePathController.addImagePathDesc(controller.search.value);
    return FutureBuilder(
      future: !isBarCode
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
          List<String> produtosDescPathImage =
              saveImagePathController.pathImagesDesc;
          List<String> produtoBarcodePathImage =
              saveImagePathController.pathImagesBarcode;
          List<String> imagesPath = [];

          controller.clearAll();
          for (var produto in produtos) {
            if (produto!.venda_kg == 1) {
              controller.updateFile(produto.file_imagem ?? '');
              controller.updateNome(produto.descricao ?? '');
              controller.updatePreco(formatoBrasileiro.format(produto.pvenda));
              controller.updateUnidade(produto.unidade ?? '');
              controller.updateIdProduto(produto.id_produto);
            } else if (produto.venda_kg == 0) {
              controller.updateFile(produto.file_imagem ?? '');
              controller.updateNome(produto.descricao ?? '');
              controller.updatePreco(formatoBrasileiro.format(produto.pvenda));
              controller.updateUnidade(produto.unidade ?? '');
              controller.updateIdProduto(produto.id_produto);
            }
          }

          return GridView.builder(
            itemCount: produtos.length == 1 ? 1 : produtos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              if (!isBarCode) {
                try {
                  if (produtosDescPathImage
                      .map((e) => e.split('/').last)
                      .contains(produtos[index]!.file_imagem)) {
                    String filePath = produtosDescPathImage.firstWhere(
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

              if (isBarCode) {
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

                    pdvController.listenBalance(
                        controller.nome[index],
                        controller.unidade[index],
                        controller.preco[index],
                        controller.idProduto[index],
                        filteredProducts: produtos,
                        isBalance: isBalance);
                  } else {
                    isBalance = false;
                    pdvController.adicionarPedidos(
                        controller.nome[index],
                        controller.unidade[index],
                        controller.preco[index],
                        controller.idProduto[index]);
                  }

                  pdvController.totalSoma();
                  if (!pdvController.pedidos.contains(controller.nome[index])) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });
                  }
                },
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          // CachedNetworkImage que exibe a imagem
                          imagesPath.isNotEmpty
                              ? getImage(imagesPath[index])
                              : Image.asset(
                                  'assets/images/semimagem.png',
                                  scale: 1.0,
                                ),

                          if (pdvController
                                  .getQuantidade(controller.nome[index]) >
                              0) // Verifica se a quantidade é maior que 0

                            Positioned(
                              top: 5,
                              right: 5,
                              child: pdvController.getQuantidade(
                                          controller.nome[index]) >
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
                                                ? '${pdvController.findWeightByName(controller.nome[index])}'
                                                : '${pdvController.getQuantidade(controller.nome[index])}',
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
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
