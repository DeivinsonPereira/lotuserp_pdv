import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/controllers/product.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';

class ProductMonitorPage extends StatefulWidget {
  const ProductMonitorPage({super.key});

  @override
  State<ProductMonitorPage> createState() => _ProductMonitorPageState();
}

class _ProductMonitorPageState extends State<ProductMonitorPage> {
  int isSelectedList = -1;
  int idGrupo = -1;

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    ProdutoController controller = ProdutoController();

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
                            if (listaGrupos[isSelectedList] != 'TODOS') {
                              filteredProducts = getProdutoById(produto);
                            } else {
                              filteredProducts = produto;
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
                                String? file;
                                if (listaGrupos[isSelectedList] == 'TODOS') {
                                  produto.isNotEmpty
                                      ? file = produto[index].fileImagem!
                                      : file = null;
                                } else {
                                  file = filteredProducts[index].fileImagem ??
                                      "Valor Padrão";
                                }

                                if (file != null) {
                                  return CachedNetworkImage(
                                    imageUrl: Endpoints.imagemProdutoUrl(file),
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
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
                              padding: const EdgeInsets.all(15.0),
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
                           /* Padding(padding: EdgeInsets.all(15.0),
                            child: ListView.builder(
                              itemCount: controller.pedidos.length,
                              itemBuilder: (context, index){
                                return ListTile(
                                title: Text(
                                  controller.pedidos[index]['nomeProduto']),
                                subtitle: Text('${controller.pedidos[index]['quantidade']} x R\$ ${controller.pedidos[index]['price']}${controller.pedidos[index]['unidade']}'),
                                trailing: Text('R\$ ${controller.pedidos[index]['total']}'),);
                              
                              //verificar
                                
                              
                              
                            ),
                            ),
},*/
                          ],
                        ),
                      ),
                        ),
                      
                     
                    ],
                  ),
                ),
                Expanded(
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
                          const Text(
                            'R\$ 00.00',
                            style: TextStyle(
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
