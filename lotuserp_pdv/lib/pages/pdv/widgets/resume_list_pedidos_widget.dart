// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

import '../../../core/custom_colors.dart';
import '../../../services/format_numbers.dart';

class ResumeListPedidosWidget extends StatelessWidget {
  final PdvController controller;
  const ResumeListPedidosWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Constrói o cabeçalho do widget
    Widget _buildHeader() {
      return Padding(
        // Cabeçalho, Resumo
        padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Resumo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${controller.pedidos.length} itens',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    }

    // Constrói o botão para remover item
    Widget _buildDeleteItem(int index) {
      return Container(
        width: 60,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          color: CustomColors.customSwatchColor[100],
        ),
        child: IconButton(
          onPressed: () {
            controller.removerPedido(index);
          },
          icon: const Icon(
            FontAwesomeIcons.trash,
            size: 20,
            color: Color.fromARGB(255, 170, 46, 37),
          ),
        ),
      );
    }

    // Constrói os dados do item
    Widget _buildProductsInformation(int index) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${controller.pedidos[index]['idProduto']} - ${controller.pedidos[index]['nomeProduto']}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${controller.pedidos[index]['quantidade']} x R\$ ${FormatNumbers.formatNumbertoString(controller.pedidos[index]['price'])} ${controller.pedidos[index]['unidade']}  =  R\$ ${FormatNumbers.formatNumbertoString(controller.pedidos[index]['total'])}',
        ),
      ]);
    }

    // Constrói os cards dos itens no carrinho
    Widget _buildCards(int index) {
      return Card(
        elevation: 2,
        child: Row(
          children: [
            // Ícone para remover item
            _buildDeleteItem(index),
            const SizedBox(width: 10), // Espaço entre o ícone e o texto
            // Título e Subtítulo
            Expanded(
              child: _buildProductsInformation(index),
            ),
            // Trailing widget - Espaço ou outro widget, se necessário
            const Text(
              ' ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    // Constrói o conteúdo do widget de resumo
    Widget _buildContent() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() => ListView.builder(
              controller: scrollController,
              itemCount: controller.pedidos.length,
              itemBuilder: (context, index) {
                return _buildCards(index);
              },
            )),
      );
    }

    // Constrói o corpo do widget
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          // lista de pedidos
          Expanded(
            child: _buildContent(),
          ),
        ],
      );
    }

    // Retorna o widget de resumo dos itens no carrinho
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: _buildBody(),
      ),
    );
  }
}
