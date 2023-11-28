import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/product/widgets/products_widgets.dart';

class ProductMonitorPage extends StatefulWidget {
  const ProductMonitorPage({super.key});

  @override
  State<ProductMonitorPage> createState() => _ProductMonitorPageState();
}

class _ProductMonitorPageState extends State<ProductMonitorPage> {
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
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
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
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.camera_alt),
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              border: InputBorder.none,
                              hintText: 'Busque um produto',
                              labelStyle: TextStyle(
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
                    height: 80,
                    width: 700,
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
                                Text('0 Itens', style: TextStyle(fontSize: 20),),
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
