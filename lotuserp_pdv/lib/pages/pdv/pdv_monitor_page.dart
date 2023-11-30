import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';

class PdvMonitorPage extends StatefulWidget {
  const PdvMonitorPage({super.key});

  @override
  State<PdvMonitorPage> createState() => _PdvMonitorPageState();
}

class _PdvMonitorPageState extends State<PdvMonitorPage> {
  int isSelectedList = -1;
  int idGrupo = -1;

  double totalPedido = 0.0;

  late NumberFormat formatoBrasileiro;

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    PdvController controller = Get.put(PdvController());
    var preco;
    var total;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    var controllerTotal; // fazer essa lógica ainda

    List<String> listaGrupos = [];

    List<Produto> getProdutoById(List<Produto> product) {
      return product.where((product) => product.idGrupo == idGrupo).toList();
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                                      listaGrupos.add(element.grupoDescricao!);
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelectedList = index;
                                          if (index != 0) {
                                            idGrupo = grupo[index - 1].idGrupo;
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
                  Expanded(
                      flex: 7,
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
                                var numeroFormatado = formatoBrasileiro
                                    .format(filteredProducts[index].pvenda);
                                if (isSelectedList >= 0) {
                                  if (listaGrupos[isSelectedList] == 'TODOS') {
                                    produto.isNotEmpty
                                        ? file = produto[index].fileImagem!
                                        : file = null;

                                    nome = produto[index].descricao;
                                    preco = numeroFormatado;
                                    unidade = produto[index].unidade;
                                  } else {
                                    // caso o listaGrupos[isSelectedList] não seja igual a 'todos'
                                    file = filteredProducts[index].fileImagem ??
                                        "Valor Padrão";
                                    nome = filteredProducts[index].descricao ??
                                        "null";
                                    preco = preco = numeroFormatado;

                                    unidade =
                                        filteredProducts[index].unidade ?? "";
                                  }

                                  if (file != null) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          controller.adicionarPedidos(
                                              nome!, unidade!, preco!);

                                          controller.totalSoma();
                                          print(controller.pedidos.length);
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  Endpoints.imagemProdutoUrl(
                                                      file),
                                            ),
                                          ),
                                          if (nome != null)
                                            Text(
                                              nome,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          Text(
                                            'R\$  $preco $unidade',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 97, 97, 97),
                                            ),
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
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            // Container do Resumo de pedidos
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                // Cabeçalho, Resumo
                                padding: const EdgeInsets.all(15.0),
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
                              SizedBox(
                                // lista de pedidos
                                width: 550,
                                height: 500,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView.builder(
                                    itemCount: controller.pedidos.length,
                                    itemBuilder: (context, index) {
                                      total = formatoBrasileiro.format(
                                          controller.pedidos[index]['total']);
                                      return ListTile(
                                        title: Text(
                                          controller.pedidos[index]
                                              ['nomeProduto'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: Text(
                                            '${controller.pedidos[index]['quantidade']} x R\$ $preco ${controller.pedidos[index]['unidade']}'),
                                        trailing: Text(
                                          'R\$ $total',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    },
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
                Expanded(
                  //botão de pagamento e total
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 25.0, left: 24.0, right: 24.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customContrastColor),
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Pagamento',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'R\$ ${controller.total.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
    );
  }
}