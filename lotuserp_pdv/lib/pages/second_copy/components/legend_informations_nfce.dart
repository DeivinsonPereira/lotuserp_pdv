// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LegendInformationsNfce extends StatelessWidget {
  const LegendInformationsNfce({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LegendWidgetNfce(data: '', size: Get.size.width * 0.01),
          LegendWidgetNfce(data: 'Id Venda', size: Get.size.width * 0.08),
          LegendWidgetNfce(data: 'Situacão', size: Get.size.width * 0.08),
          LegendWidgetNfce(data: 'Hora Venda', size: Get.size.width * 0.13),
          LegendWidgetNfce(data: 'Valor', size: Get.size.width * 0.04),
        ],
      ),
    );
  }
}

class LegendWidgetNfce extends StatelessWidget {
  final String data;
  final double size;

  const LegendWidgetNfce({
    Key? key,
    required this.data,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Center(
        child: Text(data,
            style: const TextStyle(fontSize: 20, color: Colors.black26)),
      ),
    );
  }
}
