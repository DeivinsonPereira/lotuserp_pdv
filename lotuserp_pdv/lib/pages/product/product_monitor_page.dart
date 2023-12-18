// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../controllers/product_controller.dart';
import '../../core/format_txt.dart';
import 'components/popup_widget.dart';

class ProductMonitorPage extends StatelessWidget {
  const ProductMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Get.put(ProdutoController());

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //botão voltar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),

            // configuração do container branco
            Container(
              height: size.height - 64,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Título
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: const Center(
                      child: Text(
                        'Constulta de Produtos',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //campo de pesquisa
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //opções de pesquisa
                        Obx(() => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              width: 260,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.textOption.value,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(child: PopupWidget()),
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 5,
                        ),

                        //input de pesquisa
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              inputFormatters: [UpperCaseTxt()],
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  border: InputBorder.none),
                              style: const TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                              controller: controller.searchController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10))),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                              child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.0),
                                    child: Text('Resultado',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ),
                            const Row(
                              children: [
                                LegendSearch(
                                  legend: 'Id',
                                  size: 75,
                                ),
                                LegendSearch(
                                  legend: 'Descricão Produto',
                                  size: 500,
                                  isDescription: true,
                                ),
                                LegendSearch(
                                  legend: 'UN',
                                  size: 50,
                                ),
                                LegendSearch(
                                  legend: 'Valor Venda',
                                  size: 150,
                                ),
                                LegendSearch(
                                  legend: 'Saldo Produto',
                                  size: 150,
                                ),
                              ],
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

class LegendSearch extends StatelessWidget {
  const LegendSearch({
    Key? key,
    required this.legend,
    required this.size,
    this.isDescription = false,
  }) : super(key: key);

  final String legend;
  final double size;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return isDescription
        ? Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(legend)),
                ),
              ]),
            ),
          )
        : Container(
            color: Colors.grey,
            child: Row(children: [
              Container(
                  width: !isDescription ? size : 0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(legend)),
            ]),
          );
  }
}
