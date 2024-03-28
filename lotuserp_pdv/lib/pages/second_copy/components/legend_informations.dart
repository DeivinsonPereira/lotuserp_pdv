// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/strings_default.dart';

import '../../../controllers/printer_controller.dart';
import '../../../services/dependencies.dart';

// CONSTRÓI CADA LINHA
class LegendInformation extends StatelessWidget {
  final String id;
  String? data;
  String? hora;
  final String idVenda;
  final String valor;
  bool? isPrint;
  String? imagemComprovante;
  int? index;
  bool? isCartao;

  LegendInformation({
    Key? key,
    required this.id,
    required this.idVenda,
    required this.valor,
    this.data = '',
    this.hora = '',
    this.isPrint,
    this.isCartao = false,
    this.index,
    this.imagemComprovante,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      LegendWidget(text: id, size: 75, isCartao: isCartao!),
      LegendWidget(text: data!, size: 100, isCartao: isCartao!),
      LegendWidget(text: hora!, size: 125, isCartao: isCartao!),
      LegendWidget(text: idVenda, size: 100, isCartao: isCartao!),
      LegendWidget(text: valor, size: 100, isCartao: isCartao!),
      LegendWidget(
        text: StringsDefault.print,
        size: 150,
        isCartao: isCartao!,
        isPrint: isPrint,
        index: index,
        imagemComprovante: imagemComprovante,
      ),
    ]);
  }
}

// CONSTRÓI CADA ITEM DA LINHA
class LegendWidget extends StatelessWidget {
  final String text;
  final double size;
  final bool isCartao;
  bool? isPrint;
  String? imagemComprovante;
  int? index;

  LegendWidget({
    Key? key,
    required this.text,
    required this.size,
    required this.isCartao,
    this.isPrint = false,
    this.index,
    this.imagemComprovante,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrinterController printController = Dependencies.printerController();

    return SizedBox(
      width: size,
      child: Center(
        child: isPrint!
            ? IconButton(
                onPressed: () {
                  if (imagemComprovante != null) {
                    printController.printSegundaVia(imagemComprovante!);
                  }
                },
                icon: Icon(
                  Icons.print_outlined,
                  color: CustomColors.customSwatchColor,
                  size: 30,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: isCartao
                        ? Colors.black
                        : const Color.fromARGB(255, 155, 154, 154)),
              ),
      ),
    );
  }
}
