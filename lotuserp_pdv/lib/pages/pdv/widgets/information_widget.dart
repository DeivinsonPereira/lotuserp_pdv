import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';

class InformationWidget {
  PdvController controller = Get.find();

  Widget quantityInformation(int index, String? file) {
    if (controller.pedidos.isNotEmpty) {
      /*if(controller.pedidos.where((pedido) => ))
      int quantidade = controller.pedidos[index]['quantidade'] ?? 0;

      if (quantidade > 0) {*/
        return Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                alignment: Alignment(0, 0),
                imageUrl: Endpoints.imagemProdutoUrl(file!),
              ),
            ),
            Align(
              alignment: const Alignment(1, 1),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: CustomColors.customContrastColor,
                ),
                child: Center(
                  child: Text('$quantidade'),
                ),
              ),
            ),
          ],
        );
      } else {
        return CachedNetworkImage(
          alignment: Alignment(0, 0),
          imageUrl: Endpoints.imagemProdutoUrl(file!),
        );
      }
    } else {
      return CachedNetworkImage(
        alignment: Alignment(0, 0),
        imageUrl: Endpoints.imagemProdutoUrl(file!),
      );
    }
  }
}
