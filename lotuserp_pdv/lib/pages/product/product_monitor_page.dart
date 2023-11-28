import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class ProductMonitorPage extends StatelessWidget {
  const ProductMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        },),
        backgroundColor: CustomColors.customSwatchColor,
        title: Row(
          children: [
            const Text(
              'Adicionar Produtos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Container(
                width: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 197, 197, 197),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Faça a sua pesquisa aqui.',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 131, 130, 130),
                    ),
                  ),

                  // Adicione mais propriedades conforme necessário
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
