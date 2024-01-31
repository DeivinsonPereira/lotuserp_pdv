// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../controllers/product_controller.dart';
import '../../services/format_txt.dart';
import '../../services/dependencies.dart';
import 'components/popup_widget.dart';
import 'components/search_apresentation.dart';

class ProductMonitorPage extends StatelessWidget {
  const ProductMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Dependencies.productController();

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
                  Get.currentRoute == PagesRoutes.pdvMonitor
                      ? Get.back()
                      : Get.offNamed(PagesRoutes.homePageRoute);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),

            // Conteúdo
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Container(
                height: size.height - 75,
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
                            'Consulta de Produtos',
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
                          const EdgeInsets.only(top: 2.0, left: 10, right: 10),
                      child: Row(
                        //opções de pesquisa
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<ProdutoController>(
                            builder: (_) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              width: 260,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _.textOption.value,
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
                            ),
                          ),
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
                                          controller.searchExecuted.value =
                                              true;
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
                                  onChanged: (value) {
                                    if (controller.textOption.value ==
                                        'DESCRIÇÃO') {
                                      controller.updateProductVariable(
                                          controller.searchController.text);
                                    } else if (controller.textOption.value ==
                                        'ID') {
                                      controller.updateProductVariableId(
                                          controller.searchController.text);
                                    } else {
                                      controller.updateProductVariableBarCode(
                                          controller.searchController.text);
                                    }
                                  }),
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
                            Row(
                              children: [
                                LegendSearch(
                                    legend: 'Id',
                                    size: 75,
                                    color: Colors.grey[600]),
                                LegendSearch(
                                    legend: 'Descricão Produto',
                                    size: 500,
                                    isDescription: true,
                                    color: Colors.grey[600]),
                                LegendSearch(
                                    legend: 'UN',
                                    size: 50,
                                    color: Colors.grey[600]),
                                LegendSearch(
                                    legend: 'Gtin',
                                    size: 150,
                                    color: Colors.grey[600]),
                                LegendSearch(
                                    legend: 'Valor Venda',
                                    size: 80,
                                    color: Colors.grey[600]),
                                const SizedBox(
                                  width: 70,
                                ),
                                LegendSearch(
                                    legend: 'Saldo Produto',
                                    size: 92,
                                    color: Colors.grey[600]),
                                const SizedBox(
                                  width: 70,
                                )
                              ],
                            ),

                            const Divider(),

                            //resultado da pesquisa
                            controller.textOption.value == 'DESCRIÇÃO'
                                ? const SearchApresentation(
                                    isProd: true,
                                  )
                                : (controller.textOption.value == 'ID'
                                    ? const SearchApresentation()
                                    : controller.textOption.value ==
                                            'CÓDIGO BARRAS'
                                        ? const SearchApresentation()
                                        : const SizedBox()),
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
  const LegendSearch(
      {Key? key,
      required this.legend,
      required this.size,
      this.isSaldoProduto = false,
      this.isDescription = false,
      this.isPvenda = false,
      this.color = Colors.black})
      : super(key: key);

  final String legend;
  final double size;
  final bool isDescription;
  final Color? color;
  final bool isPvenda;
  final bool isSaldoProduto;

  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Dependencies.productController();

    return isDescription
        ? Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    legend,
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          )
        : Row(children: [
            SizedBox(
              width: !isDescription ? size : 0,
              child: Text(
                isPvenda
                    ? controller.valorVendaFormatted.value
                    : (isSaldoProduto
                        ? controller.saldoProdutoFormatted.value
                        : legend),
                style: TextStyle(color: color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: isPvenda || isSaldoProduto
                    ? TextAlign.end
                    : TextAlign.start,
              ),
            ),
          ]);
  }
}
