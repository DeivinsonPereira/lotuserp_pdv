// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/pdv/custom/get_images.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/services/format_numbers.dart';

import '../../../controllers/pdv.controller.dart';
import '../../../controllers/search_product_pdv_controller.dart';
import '../../../shared/isar_service.dart';
import '../custom/pdv_colors.dart';
import 'search_products_presentation.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pdvController = Dependencies.pdvController();
    Dependencies.searchProductPdvController();
    IsarService service = IsarService();
    final ScrollController scrollController = ScrollController();

    // Constrói o nome do produto
    Widget _buildNameProduct(String nome) {
      return Text(
        nome,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: TextColors.titleColor),
      );
    }

    // Constrói a unidade do produto
    Widget _buildUnitProduct(String unidade) {
      return Text(
        unidade,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: TextColors.subtitleColor),
      );
    }

    // Constrói o valor do produto
    Widget _buildPriceProduct(String preco) {
      return Text(
        'R\$ $preco ',
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: TextColors.titleColor),
      );
    }

    // Constrói a quantidade do produto que está no carrinho
    Widget _buildContainerQuantity(produto productSelected) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomColors.customSwatchColor,
        ),
        child: Obx(
          () => Text(
            productSelected.venda_kg == 1
                ? '${pdvController.findWeightByName(productSelected.descricao!)}'
                : '${pdvController.getQuantidade(productSelected.descricao!)}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // Constrói o card do produto
    Widget _buildCardProduct(produto productSelected, int index) {
      return GestureDetector(
        onTap: () {
          pdvController.listenBalance(
            productSelected.descricao,
            productSelected.unidade,
            FormatNumbers.formatNumbertoString(productSelected.pvenda),
            productSelected.id_produto,
            filteredProducts: productSelected,
            index: index,
          );
        },
        child: Column(children: [
          if (index < pdvController.imagesProducts.length) ...{
            Stack(children: [
              getImage(pdvController.imagesProducts[index]),
              if (pdvController.getQuantidade(productSelected.descricao!) >
                  0.0) ...{
                Positioned(
                    top: 5,
                    right: 5,
                    child: _buildContainerQuantity(productSelected))
              }
            ]),
            _buildNameProduct(productSelected.descricao!),
            _buildUnitProduct(productSelected.unidade!),
            _buildPriceProduct(
                FormatNumbers.formatNumbertoString(productSelected.pvenda)),
          }
        ]),
      );
    }

    // Constrói o grid do produto
    Widget _buildGrid() {
      return GetBuilder<PdvController>(
        builder: (_) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 30,
            ),
            itemCount: _.productFiltered.length,
            itemBuilder: (context, index) {
              produto productSelected = _.productFiltered[index];
              return _buildCardProduct(productSelected, index);
            },
          );
        },
      );
    }

    // Retorna o widget dos produtos
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: GetBuilder<SearchProductPdvController>(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _.isSearch
                ? (!_.isBarCode
                    ? SearchProductPresentation(
                        ip: pdvController.ip.value,
                        service: service,
                        controller: _,
                        pdvController: pdvController,
                        scrollController: scrollController,
                      )
                    : SearchProductPresentation(
                        ip: pdvController.ip.value,
                        service: service,
                        controller: _,
                        pdvController: pdvController,
                        isBarCode: true,
                        scrollController: scrollController,
                      ))
                : _buildGrid(),
          );
        }),
      ),
    );
  }
}
