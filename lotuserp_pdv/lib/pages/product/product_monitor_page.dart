import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/product.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class ProductMonitorPage extends StatefulWidget {
  const ProductMonitorPage({super.key});

  @override
  State<ProductMonitorPage> createState() => _ProductMonitorPageState();
}

class _ProductMonitorPageState extends State<ProductMonitorPage> {
  int isSelectedList = -1;
  List<int> indexText = [];

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    ProdutoController controller = Get.put(ProdutoController());

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
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
                  SizedBox(
                      height: 180,
                      width: 700,
                      child: StreamBuilder(
                          stream: service.listenGrupo(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Grupo não encontrado');
                            }
                            if (snapshot.hasData) {
                              var grupo = snapshot.data!;
                              for (var i = 0; i < grupo.length; i++) {
                                indexText.add(i);
                              }
                              
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                ),
                                itemCount: grupo.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return LayoutBuilder(
                                      builder: (context, constraints) {
                                    if (constraints.maxWidth > 1200) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15.0,
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSelectedList = index;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: isSelectedList ==
                                                              index
                                                          ? const Color
                                                              .fromRGBO(
                                                              43, 48, 91, 1)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    grupo[index]
                                                            .grupoDescricao ??
                                                        '',
                                                    style: isSelectedList ==
                                                            index
                                                        ? const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 14)
                                                        : TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: CustomColors
                                                                .customSwatchColor,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (constraints.maxWidth < 1200 &&
                                        constraints.maxWidth > 800) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15.0,
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSelectedList = index;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: isSelectedList ==
                                                              index
                                                          ? const Color
                                                              .fromRGBO(
                                                              43, 48, 91, 1)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    grupo[index]
                                                            .grupoDescricao ??
                                                        '',
                                                    style: isSelectedList ==
                                                            index
                                                        ? const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white)
                                                        : TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: CustomColors
                                                                .customSwatchColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15.0,
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSelectedList = index;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: isSelectedList ==
                                                              index
                                                          ? const Color
                                                              .fromRGBO(
                                                              43, 48, 91, 1)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    grupo[index]
                                                            .grupoDescricao ??
                                                        '',
                                                    style: isSelectedList ==
                                                            index
                                                        ? const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white)
                                                        : TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: CustomColors
                                                                .customSwatchColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  });
                                },
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          })),
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
                        ),
                      ),
                      Positioned(
                          top: 40,
                          left: 50,
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 435,
                            ),
                            width: 500,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Resumo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '0 Itens',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )),
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
