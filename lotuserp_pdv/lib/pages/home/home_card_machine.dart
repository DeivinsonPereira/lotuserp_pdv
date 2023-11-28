import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/close_register_page.dart';
import 'package:lotuserp_pdv/pages/data_manager_page.dart';
import 'package:lotuserp_pdv/pages/manage_cash_page.dart';
import 'package:lotuserp_pdv/pages/open_register_page.dart';
import 'package:lotuserp_pdv/pages/point_of_sale_page.dart';
import 'package:lotuserp_pdv/pages/products_page.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/button.dart';

class HomeCardMachine extends StatelessWidget {
  const HomeCardMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
          child: Container(
            color: Colors.transparent,
            child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                    title:  SizedBox(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                          'assets/images/Logo_Nova_Transparente.png',
                        ),
                      ),
                    ),
                    centerTitle: true,
                  ),
            ),
          ),
        ),
      ),
      body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [
                    CustomColors.customSwatchColor,
                    CustomColors.customSwatchColor[300]!
                  ],),),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Button().homeButton(
                      'Abrir Caixa',
                      'assets/images/abrir_caixa.png',
                      () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const OpenRegisterPage(); // Your AlertDialog widget
                          },
                        );
                      },
                    ),
                    Button().homeButton(
                      'Movimentar Caixa',
                      'assets/images/movimentando_caixa.png',
                      () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const ManageCashPage(); // Your AlertDialog widget
                          },
                        );
                      },
                    ),
                    Button().homeButton(
                      'Fechar Caixa',
                      'assets/images/pagando_cartao.png',
                      () {
                        Get.to(() => const CloseRegisterPage());
                      },
                    ),
                    Button().homeButton(
                      'Produtos',
                      'assets/images/products.png',
                      () {
                        Get.to(() => const ProductsPage());
                      },
                    ),
                    Button().homeButton(
                      'PDV',
                      'assets/images/pdv.png',
                      () {
                        Get.to(() => const PointOfSalePage());
                      },
                    ),
                    Button().homeButton(
                      'Carga de Dados',
                      'assets/images/carga_dados.png',
                      () {
                        Get.to(() => const DataManagerPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
