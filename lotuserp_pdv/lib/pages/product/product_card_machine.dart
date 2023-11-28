import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/product/widgets/products_widgets.dart';

class ProductCardMachinePage extends StatefulWidget {
  const ProductCardMachinePage({super.key});

  @override
  State<ProductCardMachinePage> createState() => _ProductCardMachinePageState();
}

class _ProductCardMachinePageState extends State<ProductCardMachinePage> {
  List<bool> isSelectedList = List.generate(5, (index) => false);

  void updateSelectedList(int index) {
    setState(() {
      for (int i = 0; i < isSelectedList.length; i++) {
        isSelectedList[i] = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double _maxWidthDermined = 265;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      body: Row(
        children: [
          Padding(
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
                        constraints: const BoxConstraints(maxWidth: _maxWidthDermined),
                        height: 50,
                        width: _maxWidthDermined,
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
                ),
                SizedBox(
                  height: 80,
                  width: _maxWidthDermined,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductsWidgets().cards(
                        'Todos',
                        isSelectedList[0],
                        () => updateSelectedList(0),
                      ),
                      ProductsWidgets().cards(
                        'Casa',
                        isSelectedList[1],
                        () => updateSelectedList(1),
                      ),
                      ProductsWidgets().cards(
                        'Jardim',
                        isSelectedList[2],
                        () => updateSelectedList(2),
                      ),
                      ProductsWidgets().cards(
                        'Ferramentas',
                        isSelectedList[3],
                        () => updateSelectedList(3),
                      ),
                      ProductsWidgets().cards(
                        'Automotivo',
                        isSelectedList[4],
                        () => updateSelectedList(4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {  },)
  }
}
