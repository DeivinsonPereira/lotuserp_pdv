// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/format_txt.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/buttons_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/pdv_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../controllers/global_controller.dart';
import '../../controllers/search_product_pdv_controller.dart';
import '../common/injection_dependencies.dart';
import '../product/product_monitor_page.dart';

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
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    PasswordController passwordController =
        InjectionDependencies.passwordController();
    GlobalController globalController =
        InjectionDependencies.globalController();
    PdvController controller = InjectionDependencies.pdvController();
    PaymentController paymentController =
        InjectionDependencies.paymentController();
    SearchProductPdvController searchProductPdvController =
        InjectionDependencies.searchProductPdvController();

    IsarService service = IsarService();

    var userName = passwordController.userController.text;

    var precos = [];
    // ignore: unused_local_variable
    String total;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    List<String> listaGrupos = ['TODOS'];

    List<produto> getProdutoById(List<produto> product) {
      return product.where((product) => product.id_grupo == idGrupo).toList();
    }

    var size = MediaQuery.of(context).size;

    globalController.setIdUsuario();
    globalController.setCaixaAbertaId(globalController.userId);
    controller.inicializarGetIdCaixa();
    controller.fetchDataFromDatabase();

    // Pagamento e total
    Widget paymentAndTotal(PdvController controller) {
      return Flexible(
        flex: 1,
        child: InkWell(
          onTap: () {
            if (controller.pedidos.isEmpty) {
              Get.snackbar('Atenção', 'Nenhum item adicionado',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              paymentController.zerarCampos();
              Get.toNamed(PagesRoutes.paymentRoute);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 3),
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
                        child: Obx(
                          () => AutoSizeText(
                            formatoBrasileiro
                                .format(controller.totalcheckBox1.value),
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
                height: 610,
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
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: IconButton(
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
                                        title: Text(
                                          controller.pedidos[index]
                                              ['nomeProduto'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: Text(
                                            '${controller.pedidos[index]['quantidade']} x R\$ ${formatoBrasileiro.format(controller.pedidos[index]['price'])} ${controller.pedidos[index]['unidade']}'),
                                        trailing: const Text(
                                          ' ',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
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
    Widget informationsAndButtons(PdvController controller) {
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
                  height: 85,
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
                      height: 85,
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
                                  '${controller.caixaId.value.toString().padLeft(6, '0')}  -  ',
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
                    FontAwesomeIcons.cashRegister, 'Gaveta', () => Container()),
                ButtonsPdv().iconsOptions(
                    FontAwesomeIcons.weightScale, 'Balança', () => Container()),
                ButtonsPdv().iconsOptions(FontAwesomeIcons.solidTrashCan,
                    'Cancelar', () => controller.cancelarPedido()),
                ButtonsPdv().iconsOptions(FontAwesomeIcons.moneyBillTrendUp,
                    'Vendas', () => Container()),
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
                  ? _SearchProduct(
                      ip: controller.ip.value,
                      formatoBrasileiro: formatoBrasileiro,
                      service: service,
                      controller: searchProductPdvController,
                      pdvController: controller)
                  : StreamBuilder(
                      stream: service.listenProdutos(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Produto não encontrado');
                        }
                        if (snapshot.hasData) {
                          var produto = snapshot.data!;

                          dynamic filteredProducts;
                          if (controller.isSelectedList.value >= 0) {
                            if (listaGrupos[controller.isSelectedList.value] !=
                                'TODOS') {
                              filteredProducts = getProdutoById(produto);
                            } else {
                              filteredProducts = produto;
                            }
                          } else {
                            filteredProducts = [];
                          }

                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: filteredProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              String? nome;
                              String? unidade;
                              String? file;
                              String preco = '';
                              int idProduto = 0;

                              if (controller.isSelectedList.value >= 0) {
                                if (listaGrupos[
                                        controller.isSelectedList.value] ==
                                    'TODOS') {
                                  produto.isNotEmpty
                                      ? file = produto[index].file_imagem!
                                      : file = null;
                                  nome = produto[index].descricao;
                                  preco = formatoBrasileiro
                                      .format(produto[index].pvenda);
                                  if (precos.isNotEmpty) {}
                                  precos.add(preco);
                                  unidade = produto[index].unidade;
                                } else {
                                  file = filteredProducts[index].file_imagem ??
                                      "Valor Padrão";
                                  nome = filteredProducts[index].descricao ??
                                      "null";

                                  preco = formatoBrasileiro
                                      .format(filteredProducts[index].pvenda);

                                  unidade =
                                      filteredProducts[index].unidade ?? "";
                                  idProduto =
                                      filteredProducts[index].id_produto ?? 0;
                                }

                                if (file != null) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.adicionarPedidos(
                                            nome!,
                                            unidade!,
                                            preco,
                                            idProduto,
                                            () => setState);

                                        controller.totalSoma();
                                        if (!controller.pedidos
                                            .contains(nome)) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            scrollController.jumpTo(
                                                scrollController
                                                    .position.maxScrollExtent);
                                          });
                                        }
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              // CachedNetworkImage que exibe a imagem
                                              CachedNetworkImage(
                                                alignment:
                                                    const Alignment(0, 0),
                                                imageUrl:
                                                    '${controller.ip.value}getimagem?categoria=PRO&file=$file&result=URL',
                                              ),

                                              if (controller
                                                      .getQuantidade(nome!) >
                                                  0) // Verifica se a quantidade é maior que 0

                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: controller
                                                              .getQuantidade(
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
                                                          child: Obx(() => Text(
                                                                '${controller.getQuantidade(nome!)}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
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
        child: StreamBuilder(
          stream: service.listenGrupo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Grupo não encontrado');
            }
            if (snapshot.hasData) {
              var grupo = snapshot.data!;
              return Row(
                children: [
                  SizedBox(
                    width: 765,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: grupo.length,
                      itemBuilder: (context, index) {
                        if (listaGrupos.length > 1) {
                          listaGrupos.clear();
                        }
                        listaGrupos.add(
                          'TODOS',
                        );
                        for (var element in grupo) {
                          listaGrupos.add(element.grupo_descricao!);
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 20),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      controller.isSelectedList.value == index
                                          ? const Color.fromRGBO(43, 48, 91, 1)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Text(
                                    listaGrupos[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.isSelectedList.value ==
                                              index
                                          ? Colors.white
                                          : CustomColors.customSwatchColor,
                                      fontSize:
                                          controller.isSelectedList.value ==
                                                  index
                                              ? 18
                                              : 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
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
              controller.pedidos.clear();
              Get.offNamed(PagesRoutes.homePageRoute);
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
              child: TextField(
                controller: searchProductPdvController.searchController,
                inputFormatters: [UpperCaseTxt()],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.barcode_reader),
                  contentPadding: EdgeInsets.only(left: 10, right: 10, top: 12),
                  disabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: InputBorder.none,
                  hintText: 'Busque um produto',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53), fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (value) {
                  searchProductPdvController.updateSearch();
                  if (value == '') {
                    searchProductPdvController.updateIsSearch(false);
                  } else {
                    searchProductPdvController.updateIsSearch(true);
                  }
                },
              ),
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
class _SearchProduct extends StatelessWidget {
  final String ip;
  final NumberFormat formatoBrasileiro;
  final IsarService service;
  final SearchProductPdvController controller;
  final PdvController pdvController;
  const _SearchProduct({
    Key? key,
    required this.ip,
    required this.formatoBrasileiro,
    required this.service,
    required this.controller,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductPdvController>(
      builder: (_) {
        return FutureBuilder(
          future: service.searchProdutoByDesc(_.search.value),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              Get.snackbar(
                'Atenção',
                'Nenhum resultado encontrado',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
            if (snapshot.hasData) {
              List<produto?> produtos = snapshot.data!;

              return GridView.builder(
                itemCount: produtos.length == 1 ? 1 : produtos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  _.updateFile(produtos[index]!.file_imagem!);

                  _.updateNome(produtos[index]!.descricao!);
                  _.updatePreco(
                      formatoBrasileiro.format(produtos[index]!.pvenda));
                  _.updateUnidade(produtos[index]!.unidade!);
                  _.updateIdProduto(produtos[index]!.id_produto);

                  return InkWell(
                    onTap: () {
                      pdvController.adicionarPedidos(
                          _.nome.value,
                          _.unidade.value,
                          _.preco.value,
                          _.idProduto.value,
                          (_) {});
                    },
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              // CachedNetworkImage que exibe a imagem
                              CachedNetworkImage(
                                alignment: const Alignment(0, 0),
                                imageUrl:
                                    '${pdvController.ip.value}/getimagem?categoria=PRO&file=${_.file.value}&result=URL',
                              ),

                              if (pdvController.getQuantidade(_.nome.value) >
                                  0) // Verifica se a quantidade é maior que 0

                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: pdvController
                                              .getQuantidade(_.nome.value) >
                                          0
                                      ? Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color:
                                                CustomColors.customSwatchColor,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Obx(() => Text(
                                                '${pdvController.getQuantidade(_.nome.value)}',
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
                          _.nome.value,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: TextColors.titleColor),
                        ),
                        Text(
                          _.unidade.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: TextColors.subtitleColor),
                        ),
                        Text(
                          'R\$ ${_.preco.value} ',
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
      },
    );
  }
}
