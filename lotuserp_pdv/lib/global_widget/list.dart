import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/product.controller.dart';

class ListWidgets {
  PdvController controller = PdvController();

  Widget listPdvPage(dynamic scrollController, NumberFormat formatoBrasileiro,
      VoidCallback setStateCallback) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        controller: scrollController,
        itemCount: controller.pedidos.length,
        itemBuilder: (context, index) {
          var total =
              formatoBrasileiro.format(controller.pedidos[index]['total']);

          var priceFormatado =
              formatoBrasileiro.format(controller.pedidos[index]['price']);

          return Container(
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    onPressed: () {
                      setStateCallback();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      size: 20,
                      color: Color.fromARGB(255, 170, 46, 37),
                    ),
                  ),
                  title: Text(
                    controller.pedidos[index]['nomeProduto'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                      '${controller.pedidos[index]['quantidade']} x R\$$priceFormatado ${controller.pedidos[index]['unidade']}'),
                  trailing: Text(
                    ' $total',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
