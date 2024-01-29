// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class LegendInformationsNfce extends StatelessWidget {
  const LegendInformationsNfce({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 25.0, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LegendWidgetNfce(data: 'id', size: 100.0),
          LegendWidgetNfce(data: 'Id Venda', size: 100.0),
          LegendWidgetNfce(data: 'Impressão', size: 100.0),
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
            style: const TextStyle(fontSize: 20, color: Colors.black)),
      ),
    );
  }
}
