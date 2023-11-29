import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    const double maxWidthDermined = 265;
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
                Container(
                        constraints: const BoxConstraints(maxWidth: maxWidthDermined),
                        height: 50,
                        width: maxWidthDermined,
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
              ],
            ),
          ),
        ],
      ),
    );
    // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {  },)
  }
}
