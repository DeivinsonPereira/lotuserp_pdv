// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../product_monitor_page.dart';

class SearchApresentation extends GetView<ProdutoController> {
  final dynamic produtos;
  final bool isProd;
  const SearchApresentation({
    super.key,
    this.produtos,
    this.isProd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
            itemCount: isProd ? controller.product.length : produtos.length,
            itemBuilder: (context, index) {
              //transformar o valor de pvenda em String brl
              controller.updateValorVendaFormatted(isProd
                  ? controller.product[index].pvenda
                  : produtos[index].pvenda);
              controller.updateSaldoProdutoFormatted(isProd
                  ? controller.product[index].saldo_produto
                  : produtos[index].saldo_produto);

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].id_produto.toString()
                              : produtos[index].id_produto.toString(),
                          size: 75,
                        ),
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].descricao
                              : produtos[index].descricao,
                          size: 500,
                          isDescription: true,
                        ),
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].unidade
                              : produtos[index].unidade ?? 'n/a',
                          size: 50,
                        ),
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].gtin
                              : produtos[index].gtin ?? 'n/a',
                          size: 150,
                        ),
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].pvenda.toString()
                              : produtos[index].pvenda.toString(),
                          size: 80,
                          isPvenda: true,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        LegendSearch(
                          legend: isProd
                              ? controller.product[index].saldo_produto
                                  .toString()
                              : produtos[index].saldo_produto.toString(),
                          size: 92,
                          isSaldoProduto: true,
                        ),
                        const SizedBox(
                          width: 70,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    child: const Divider(),
                  )
                ],
              );
            },
          )),
    );
  }
}
