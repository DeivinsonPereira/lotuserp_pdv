import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: 8, // mudar pelo numero de produtos
        itemBuilder: (context, index) {},
      ),
    );
  }
}
