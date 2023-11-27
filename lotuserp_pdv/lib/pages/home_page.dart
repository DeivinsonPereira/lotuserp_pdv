import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/home_controller.dart';
import 'package:lotuserp_pdv/pages/close_register_page.dart';
import 'package:lotuserp_pdv/pages/data_manager_page.dart';
import 'package:lotuserp_pdv/pages/manage_cash_page.dart';
import 'package:lotuserp_pdv/pages/open_register_page.dart';
import 'package:lotuserp_pdv/pages/point_of_sale_page.dart';
import 'package:lotuserp_pdv/pages/products_page.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: SizedBox(
                  height: 100,
                  width: 100,
                  child:
                      Image.asset('assets/images/Logo_Nova_Transparente.png'),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 6,
                  children: <Widget>[
                    Button().homeButton(
                      'Abrir Caixa',
                      Icons.attach_money,
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
                      Icons.swap_horiz,
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
                      Icons.money_off,
                      () {
                        Get.to(() => const CloseRegisterPage());
                      },
                    ),
                    Button().homeButton(
                      'Produtos',
                      Icons.shopping_bag,
                      () {
                        Get.to(() => const ProductsPage());
                      },
                    ),
                    Button().homeButton(
                      'PDV',
                      Icons.shopping_cart,
                      () {
                        Get.to(() => const PointOfSalePage());
                      },
                    ),
                    Button().homeButton(
                      'Carga de Dados',
                      Icons.wifi,
                      () {
                        Get.to(() => const DataManagerPage());
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
