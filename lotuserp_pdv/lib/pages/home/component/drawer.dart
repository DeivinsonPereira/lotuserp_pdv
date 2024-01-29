// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/home/component/icon_button_list.dart';

import '../../../services/dependencies.dart';
import '../../../shared/isar_service.dart';
import 'icon_button_side_bar.dart';

// Side bar (Drawer)
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController =
        Dependencies.sidebarController();
    PasswordController passwordController =
        Dependencies.passwordController();
    IsarService service = IsarService();

    var userName = passwordController.userController.text;

    //Logo no cabeçalho do Drawer
    Widget logoImageHeaderDrawer() {
      return Align(
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
      );
    }

    //Informações no cabeçalho do Drawer
    Widget informationsDrawer() {
      return Align(
        alignment: Alignment.centerRight,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'PDV System',
                  style: TextStyle(
                      color: CustomColors.customContrastColor, fontSize: 30),
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
                  style: const TextStyle(color: Colors.white, fontSize: 40.0),
                ),
                Obx(() => Text(
                      sideBarController.dateNowFormated.value,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    )),
                Text(
                  userName,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    }

    //Botoes do Drawer
    Widget buttonsDrawer() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < IconButtonList.iconButtonlist.length; i++) ...{
            IconButtonSideBar(
              icon: IconButtonList.iconButtonlist[i]['icon'],
              navigationIcon: IconButtonList.iconButtonlist[i]
                  ['navigationIcon'],
              text: IconButtonList.iconButtonlist[i]['text'],
              isLoadData: IconButtonList.iconButtonlist[i]['loadData'],
              isAbrirCaixa: IconButtonList.iconButtonlist[i]['abrirCaixa'],
              isMovimentarCaixa: IconButtonList.iconButtonlist[i]
                  ['movimentarCaixa'],
              isPdv: IconButtonList.iconButtonlist[i]['pdv'],
              isFecharCaixa: IconButtonList.iconButtonlist[i]['fecharCaixa'],
              isSegundaVia: IconButtonList.iconButtonlist[i]['isSegundaVia'],
              isNfceSegundaVia: IconButtonList.iconButtonlist[i]['isNfceSegundaVia'],
            )
          }
        ],
      );
    }

    //Sair do sistema
    Widget sairSistema() {
      return Expanded(
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
                    Text('Sair Sistema', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Drawer(
      width: 250,
      backgroundColor: CustomColors.customSwatchColor,
      shape: const Border(right: BorderSide.none),
      child: Column(
        children: [
          logoImageHeaderDrawer(),
          informationsDrawer(),

          //linha divisoria
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),

          //Botões do Drawer
          buttonsDrawer(),

          //linha divisoria
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),

          // Sair do Sistema (Logout)
          sairSistema(),
        ],
      ),
    );
  }
}
