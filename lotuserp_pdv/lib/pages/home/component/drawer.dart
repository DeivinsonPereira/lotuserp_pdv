// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/close_register/close_register_page.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/pages/home/component/icon_button_list.dart';

import '../../load_data/load_data_page.dart';
import '../../moviment_cash/moviment_cash_page.dart';
import '../../open_register/open_register_page.dart';
import '../../../shared/isar_service.dart';

// Side bar (Drawer)
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    PasswordController passwordController =
        InjectionDependencies.passwordController();
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
                    Obx(() => Text(
                          sideBarController.dateNowFormated.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14.0),
                        )),
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
              for (var i = 0;
                  i < IconButtonList.iconButtonlist.length;
                  i++) ...{
                IconButtonSideBar(
                  icon: IconButtonList.iconButtonlist[i]['icon'],
                  navigationIcon: IconButtonList.iconButtonlist[i]
                      ['navigationIcon'],
                  text: IconButtonList.iconButtonlist[i]['text'],
                  loadData: IconButtonList.iconButtonlist[i]['loadData'],
                  abrirCaixa: IconButtonList.iconButtonlist[i]['abrirCaixa'],
                  movimentarCaixa: IconButtonList.iconButtonlist[i]
                      ['movimentarCaixa'],
                  pdv: IconButtonList.iconButtonlist[i]['pdv'],
                  fecharCaixa: IconButtonList.iconButtonlist[i]['fecharCaixa'],
                )
              }
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

// Botões para o side bar
// ignore: must_be_immutable
class IconButtonSideBar extends StatelessWidget {
  final String navigationIcon;
  final IconData icon;
  final String text;
  bool? abrirCaixa = false;
  bool? movimentarCaixa = false;
  bool? pdv = false;
  bool? loadData = false;
  bool? fecharCaixa = false;

  IconButtonSideBar(
      {Key? key,
      required this.navigationIcon,
      required this.icon,
      required this.text,
      this.abrirCaixa,
      this.movimentarCaixa,
      this.pdv,
      this.loadData,
      this.fecharCaixa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();

    return InkWell(
      onTap: () async {
        var dadosUsuario = await service.getUserLogged();
        bool caixaExistente =
            await service.checkUserCaixa(dadosUsuario!.id_user!);

        void showSnackbar(String message) {
          Get.snackbar('Atenção', message,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }

        if (abrirCaixa == true) {
          caixaExistente
              ? showSnackbar('Já existe um caixa aberto para o usuário logado.')
              : Get.dialog(const OpenRegisterPage());
        } else if (movimentarCaixa == true ||
            pdv == true ||
            fecharCaixa == true) {
          if (!caixaExistente) {
            showSnackbar('Não existe um caixa aberto para o usuário logado.');
          } else {
            if (movimentarCaixa == true) {
              Get.dialog(const MovimentCashPage());
            } else if (pdv == true) {
              Get.offAndToNamed(PagesRoutes.pdvMonitor);
            } else if (fecharCaixa == true) {
              Get.dialog(const CloseRegisterPage());
            }
          }
        } else if (loadData == true) {
          Get.dialog(const LoadDataPage());
        } else {
          Get.offAndToNamed(navigationIcon);
        }
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
