import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/grupo_produto.dart';
import 'package:lotuserp_pdv/controllers/product.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/product/product_monitor_page.dart';


/*
class ProductsWidgets {
  Widget cards(
    List<GrupoProduto> grupo,
    int index,
  ) {
    ProdutoController controller = Get.find();
    ProductMonitorPage page = ProductMonitorPage();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Column(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      page.m
                      state(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.isSelectedList == index
                                ? const Color.fromRGBO(43, 48, 91, 1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          grupo[index].grupoDescricao ?? '',
                          style: controller.isSelectedList == index
                              ? const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.customSwatchColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectionedIndex(index);
                    state;
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: controller.isSelectedList == index
                              ? const Color.fromRGBO(43, 48, 91, 1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(grupo[index].grupoDescricao ?? ''),
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
                    controller.selectionedIndex(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: controller.isSelectedList == index
                              ? const Color.fromRGBO(43, 48, 91, 1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(grupo[index].grupoDescricao ?? ''),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
*/