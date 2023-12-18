// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../controllers/product_controller.dart';
import '../../core/format_txt.dart';
import 'components/popup_widget.dart';

class ProductMonitorPage extends StatelessWidget {
  const ProductMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Get.put(ProdutoController());
    IsarService service = IsarService();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //botão voltar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  controller.searchExecuted.value = false;
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),

            // Conteúdo
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: size.height - 100,
                width: size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]),
                child: Column(
                  //Título
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.palette,
                            color: CustomColors.customSwatchColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Constulta de Produtos',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.customSwatchColor),
                          ),
                        ],
                      ),
                    ),

                    //campo de pesquisa
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2.0, left: 5, right: 5),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                inputFormatters: [UpperCaseTxt()],
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.searchExecuted.value = true;
                                      },
                                      icon: const Icon(Icons.search),
                                    ),
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

                    //Divisor entre o campo de pesquisa e a tabela
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                      child: Divider(),
                    ),

                    // Tabela do resultado da pesquisa
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 45),
                        child: Column(
                          children: [
                            //Legenda da tabela de pesquisa
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
                                LegendSearch(legend: 'Gtin', size: 150),
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

                            //resultado da pesquisa
                            Obx(() => FutureBuilder(
                                  future: controller.searchExecuted.value
                                      ? controller.textOption.value == 'ID'
                                          ? service.searchProdutoById(int.parse(
                                              controller.searchController.text))
                                          : (controller.textOption.value ==
                                                  'DESCRIÇÃO'
                                              ? service.searchProdutoByDesc(
                                                  controller
                                                      .searchController.text)
                                              : service.searchProdutoByBarcode(
                                                  controller
                                                      .searchController.text))
                                      : null,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData &&
                                        controller.searchExecuted.value) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.hasError &&
                                        controller.searchExecuted.value) {
                                      return const Center(
                                        child: Text('Erro ao buscar dados'),
                                      );
                                    }
                                    if (snapshot.hasData &&
                                        controller.searchExecuted.value) {
                                      Container();
                                    }

                                    return const Center(
                                      child: SizedBox(),
                                    );
                                  },
                                )),
                          ],
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
              child: Row(children: [
                Expanded(
                  child: Text(
                    legend,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ]),
            ),
          )
        : Row(children: [
            SizedBox(
                width: !isDescription ? size : 0,
                child: Text(
                  legend,
                  style: TextStyle(color: Colors.grey[600]),
                )),
          ]);
  }
}
