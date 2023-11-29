import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/product/product_card_machine.dart';
import 'package:lotuserp_pdv/pages/product/product_monitor_page.dart';
import 'package:lotuserp_pdv/pages/product/product_tablet_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(
            'altura: ${constraints.maxHeight}  largura: ${constraints.maxWidth}');
        if (constraints.maxWidth > 1200) {
          return const ProductMonitorPage();
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const ProductTabletPage();
        } else {
          return const ProductCardMachinePage();
        }
      },
    );
  }
}
