// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/home/component/icon_button_list.dart';

import '../../../services/dependencies.dart';
import '../../logout/logout_page.dart';
import 'icon_button_side_bar.dart';

// Side bar (Drawer)
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Dependencies.sidebarController();
    PasswordController passwordController = Dependencies.passwordController();

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
                      color: CustomColors.customContrastColor, fontSize: 26),
                ),
                const Text(
                  '2.0.22',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  sideBarController.hours.value,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 40.0, height: 1.0),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          sideBarController.dateNowFormated.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14.0),
                        ),
                        const Text(
                          ' - ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    }

    //Botoes do Drawer
    Widget buttonsDrawer() {
      return Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: IconButtonList.iconButtonlist.length,
                itemBuilder: (context, index) {
                  return IconButtonSideBar(
                    icon: IconButtonList.iconButtonlist[index]['icon'],
                    navigationIcon: IconButtonList.iconButtonlist[index]
                        ['navigationIcon'],
                    text: IconButtonList.iconButtonlist[index]['text'],
                    isLoadData: IconButtonList.iconButtonlist[index]
                        ['loadData'],
                    isAbrirCaixa: IconButtonList.iconButtonlist[index]
                        ['abrirCaixa'],
                    isMovimentarCaixa: IconButtonList.iconButtonlist[index]
                        ['movimentarCaixa'],
                    isPdv: IconButtonList.iconButtonlist[index]['pdv'],
                    isFecharCaixa: IconButtonList.iconButtonlist[index]
                        ['fecharCaixa'],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    //Sair do sistema
    Widget sairSistema() {
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 0.1),
              child: Container(
                padding: const EdgeInsets.all(9),
                height: 85,
                width: 83.33,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(45, 252, 252, 252),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Get.dialog(const LogoutPage());
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Sair\nSistema',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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

          //Botões do Drawer
          buttonsDrawer(),

          // Sair do Sistema (Logout)
          sairSistema(),
        ],
      ),
    );
  }
}
