import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/buttons_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/pdv_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class PdvMonitorPage extends StatefulWidget {
  const PdvMonitorPage({super.key});

  @override
  State<PdvMonitorPage> createState() => _PdvMonitorPageState();
}

class _PdvMonitorPageState extends State<PdvMonitorPage> {
  int isSelectedList = -1;
  int idGrupo = -1;

  late NumberFormat formatoBrasileiro;
  final ScrollController scrollController = ScrollController();
  IsarService service = IsarService();

  late String ip;

  @override
  void initState() {
    super.initState();

    // Certifique-se de que o controlador de rolagem está associado ao ListView
    fetchDataFromDatabase();
    scrollController.addListener(() {});
  }

  Future<void> fetchDataFromDatabase() async {
    final dado_empresa? dadoEmpresa = await service.getIpEmpresaFromDatabase();
    if (dadoEmpresa != null) {
      ip = dadoEmpresa.ip_empresa!;
    }
  }

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    PdvController controller = Get.put(PdvController());

    var precos = [];
    String total;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    List<String> listaGrupos = [];

    List<produto> getProdutoById(List<produto> product) {
      return product.where((product) => product.id_grupo == idGrupo).toList();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.pedidos.clear();
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 650,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                //Abrir câmera para ler o código de barras do produto
                              },
                            ),
                            disabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            border: InputBorder.none,
                            hintText: 'Busque um produto',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 53, 53, 53),
                                fontSize: 18),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 35,
                        ),
                      )
                    ],
                  ),
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
                                          isSelectedList = index;
                                          if (index != 0) {
                                            idGrupo = grupo[index - 1].id_grupo;
                                          }
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 20),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: isSelectedList == index
                                                  ? const Color.fromRGBO(
                                                      43, 48, 91, 1)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            children: [
                                              Text(
                                                listaGrupos[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: isSelectedList == index
                                                      ? Colors.white
                                                      : CustomColors
                                                          .customSwatchColor,
                                                  fontSize:
                                                      isSelectedList == index
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
                  ),

                  //Tabela de produtos.

                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder(
                          stream: service.listenProdutos(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Produto não encontrado');
                            }
                            if (snapshot.hasData) {
                              var produto = snapshot.data!;

                              dynamic filteredProducts;
                              if (isSelectedList >= 0) {
                                if (listaGrupos[isSelectedList] != 'TODOS') {
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

                                  if (isSelectedList >= 0) {
                                    if (listaGrupos[isSelectedList] ==
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
                                      // caso o listaGrupos[isSelectedList] não seja igual a 'todos'
                                      file =
                                          filteredProducts[index].file_imagem ??
                                              "Valor Padrão";
                                      nome =
                                          filteredProducts[index].descricao ??
                                              "null";

                                      preco = formatoBrasileiro.format(
                                          filteredProducts[index].pvenda);

                                      unidade =
                                          filteredProducts[index].unidade ?? "";
                                    }

                                    if (file != null) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.adicionarPedidos(
                                                nome!,
                                                unidade!,
                                                preco,
                                                () => setState);

                                            controller.totalSoma();
                                            if (!controller.pedidos
                                                .contains(nome)) {
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                scrollController.jumpTo(
                                                    scrollController.position
                                                        .maxScrollExtent);
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
                                                        '${ip}getimagem?categoria=PRO&file=$file&result=URL',
                                                  ),

                                                  if (controller.getQuantidade(
                                                          nome!) >
                                                      0) // Verifica se a quantidade é maior que 0
                                                    Positioned(
                                                      top: 5,
                                                      right: 5,
                                                      child: Container(
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
                                                        child: Text(
                                                          '${controller.getQuantidade(nome)}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
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
                                                  color:
                                                      TextColors.subtitleColor),
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
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            ButtonsPdv().iconsOptions(FontAwesomeIcons.user,
                                'Cliente', () => Container()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.clipboardList,
                                'Produtos',
                                () => Container()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.cashRegister,
                                'Gaveta',
                                () => Container()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.weightScale,
                                'Balança',
                                () => Container()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.solidTrashCan,
                                'Cancelar',
                                () => controller.cancelarPedido()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.moneyBillTrendUp,
                                'Vendas',
                                () => Container()),
                            ButtonsPdv().iconsOptions(
                                FontAwesomeIcons.fileImport,
                                'Importar',
                                () => Container()),
                            ButtonsPdv().iconsOptions(FontAwesomeIcons.userTie,
                                'Vendedor', () => Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
              // Container do Resumo de pedidos
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Flexible(
                    flex: 6,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                            height: 568,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  // Cabeçalho, Resumo
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            itemCount:
                                                controller.pedidos.length,
                                            itemBuilder: (context, index) {
                                              total = formatoBrasileiro.format(
                                                  controller.pedidos[index]
                                                      ['total']);

                                              return Card(
                                                elevation: 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    leading: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          controller
                                                              .removerPedido(
                                                                  index,
                                                                  () =>
                                                                      setState);
                                                        });
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    subtitle: Text(
                                                        '${controller.pedidos[index]['quantidade']} x R\$ ${controller.pedidos[index]['unidade']}'),
                                                    trailing: const Text(
                                                      ' ',
                                                      style: TextStyle(
                                                          fontSize: 16),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                    //botão de pagamento e total
                  Flexible(
                    flex: 1,

                    child: InkWell(
                      onTap: () {
                        Get.toNamed(PagesRoutes.paymentRoute);
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
                                child: Builder(builder: (context) {
                                  total = formatoBrasileiro
                                      .format(controller.totalcheckBox1.value);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        total,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
