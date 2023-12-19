// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../moviment_cash/moviment_cash_page.dart';
import '../../open_register/open_register_page.dart';
import '../../../shared/isar_service.dart';

// Side bar grande
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController;

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    PasswordController passwordController = Get.find();
    IsarService service = IsarService();
    var userName = passwordController.userController.text;

    return Drawer(
      width: 250,
      backgroundColor: CustomColors.customSwatchColor,
      shape: const Border(right: BorderSide.none),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 15),
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/images/Logo Nova Branco Vertical.png',
                  width: 75,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(
              () => Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PDV System',
                      style: TextStyle(
                          color: CustomColors.customContrastColor,
                          fontSize: 30),
                    ),
                    const Text(
                      'Versão',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      '2.0.22',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      sideBarController.hours.value,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    Text(
                      sideBarController.dataAbertura.value,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    Text(
                      userName,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.handHoldingDollar,
                navigationIcon: PagesRoutes.openRegister,
                text: 'Abrir caixa',
                abrirCaixa: true,
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.moneyBillTransfer,
                navigationIcon: PagesRoutes.movimentRegister,
                text: 'Movimentar caixa',
                movimentarCaixa: true,
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.cashRegister,
                navigationIcon: PagesRoutes.finishRegister,
                text: 'Fechar caixa',
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.bottleWater,
                navigationIcon: PagesRoutes.products,
                text: 'Produtos',
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.moneyBill1Wave,
                navigationIcon: PagesRoutes.pdvMonitor,
                text: 'PDV',
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.download,
                navigationIcon: PagesRoutes.loadData,
                text: 'Carga de dados',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAllNamed(PagesRoutes.loginRoute);
                    service.deleteLoggedUser();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        Text('Sair Sistema',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Botões para o side bar Grande
// ignore: must_be_immutable
class IconbuttomLargeSideBar extends StatelessWidget {
  final String navigationIcon;
  final IconData icon;
  final String text;
  bool? abrirCaixa = false;
  bool? movimentarCaixa = false;

  IconbuttomLargeSideBar({
    Key? key,
    required this.navigationIcon,
    required this.icon,
    required this.text,
    this.abrirCaixa,
    this.movimentarCaixa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();

    return InkWell(
      onTap: () async {
        var dadosUsuario = await service.getUserLogged();
        bool caixaExistente =
            await service.checkUserCaixa(dadosUsuario!.id_user!);
        abrirCaixa == true
            ? (caixaExistente
                ? Get.snackbar(
                    'Atenção',
                    'já existe um caixa aberto para o usuário logado.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  )
                // ignore: use_build_context_synchronously
                : showDialog(
                    context: context,
                    builder: (context) {
                      return const OpenRegisterPage(); // Your AlertDialog widget
                    },
                  ))
            : (
                movimentarCaixa == true
                    ? (!caixaExistente
                        ? Get.snackbar(
                            'Atenção',
                            'Não existe um caixa aberto para o usuário logado.',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          )
                        // ignore: use_build_context_synchronously
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return const MovimentCashPage(); // Your AlertDialog widget
                            }))
                    : Get.toNamed(navigationIcon),
              );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
