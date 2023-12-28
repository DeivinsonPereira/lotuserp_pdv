import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/close_register/close_register_page.dart';
import 'package:lotuserp_pdv/pages/load_data/load_data_page.dart';
import 'package:lotuserp_pdv/pages/moviment_cash/moviment_cash_page.dart';
import 'package:lotuserp_pdv/pages/open_register/open_register_page.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_card_machine.dart';
import 'package:lotuserp_pdv/pages/product/product_page.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/button.dart';

class HomeCardMachine extends StatelessWidget {
  const HomeCardMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(25)),
          child: Container(
            color: Colors.transparent,
            child: AppBar(
              backgroundColor: CustomColors.customSwatchColor,
              flexibleSpace: FlexibleSpaceBar(
                title: SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'assets/images/logo-nova-branco.png',
                      fit: BoxFit.cover,
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
        color: Colors.white,
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
                      return const MovimentCashPage(); // Your AlertDialog widget
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
                  Get.to(() => const ProductPage());
                },
              ),
              Button().homeButton(
                'PDV',
                'assets/images/pdv.png',
                () {
                  Get.to(() => const PdvCardMachinePage());
                },
              ),
              Button().homeButton(
                'Carga de Dados',
                'assets/images/carga_dados.png',
                () {
                  Get.to(() => const LoadDataPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
