import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../shared/isar_service.dart';

class AnimatedDrawer extends StatelessWidget {
  const AnimatedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController;

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    return Obx(
      () => AnimatedContainer(
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.transparent),
        ),
        duration: sideBarController.isOpen.value
            ? const Duration(milliseconds: 300)
            : const Duration(milliseconds: 300),
        width: sideBarController.isOpen.value ? 75 : 250,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: sideBarController.isOpen.value
              ? const SmallSidebar()
              : const LargeSideBar(),
        ),
      ),
    );
  }
}

class SmallSidebar extends StatefulWidget {
  const SmallSidebar({super.key});

  @override
  State<SmallSidebar> createState() => _SmallSidebarState();
}

// Side bar pequena
class _SmallSidebarState extends State<SmallSidebar> {
  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController;

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    var size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: CustomColors.customSwatchColor,
      width: 75,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/V_Logo_Branco.png',
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          SizedBox(
            height: size.height - 145,
            child: const Column(
              children: [
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.handHoldingDollar,
                  navigationIcon: PagesRoutes.openRegister,
                  position: 1,
                ),
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.moneyBillTransfer,
                  navigationIcon: PagesRoutes.movimentRegister,
                  position: 2,
                ),
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.cashRegister,
                  navigationIcon: PagesRoutes.finishRegister,
                  position: 3,
                ),
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.bottleWater,
                  navigationIcon: PagesRoutes.products,
                  position: 4,
                ),
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.moneyBill1Wave,
                  navigationIcon: PagesRoutes.pdvMonitor,
                  position: 5,
                ),
                IconbuttomSmallSideBar(
                  icon: FontAwesomeIcons.download,
                  navigationIcon: PagesRoutes.loadData,
                  position: 6,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          IconButton(
            onPressed: () {
              sideBarController.toggle();
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.white,
          ),
          // Adicionar mais itens de menu conforme necessário
        ],
      ),
    );
  }
}

// Botões para o side bar pequeno
class IconbuttomSmallSideBar extends StatelessWidget {
  const IconbuttomSmallSideBar(
      {Key? key,
      required this.navigationIcon,
      required this.icon,
      required this.position})
      : super(key: key);

  final String navigationIcon;
  final IconData icon;
  final int position;

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController;

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          left: position == sideBarController.position.value ? 10 : 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: position == sideBarController.position.value
              ? Colors.white
              : CustomColors.customSwatchColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        width: position == sideBarController.position.value ? size.width : 40,
        height: position == sideBarController.position.value ? 60 : 40,
        child: IconButton(
          onPressed: () {
            Get.toNamed(navigationIcon);
          },
          icon: Icon(
            icon,
            color: position == sideBarController.position.value
                ? CustomColors.customSwatchColor
                : Colors.white,
            size: position == sideBarController.position.value ? 30 : 24,
          ),
        ),
      ),
    );
  }
}

// Side bar grande
class LargeSideBar extends StatelessWidget {
  const LargeSideBar({super.key});

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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.handHoldingDollar,
                navigationIcon: PagesRoutes.openRegister,
                text: 'Abrir caixa',
                position: 1,
              ),
              IconbuttomLargeSideBar(
                icon: FontAwesomeIcons.moneyBillTransfer,
                navigationIcon: PagesRoutes.movimentRegister,
                text: 'Movimentar caixa',
                position: 2,
              ),
              IconbuttomLargeSideBar(
                  icon: FontAwesomeIcons.cashRegister,
                  navigationIcon: PagesRoutes.finishRegister,
                  text: 'Fechar caixa',
                  position: 3),
              IconbuttomLargeSideBar(
                  icon: FontAwesomeIcons.bottleWater,
                  navigationIcon: PagesRoutes.products,
                  text: 'Produtos',
                  position: 4),
              IconbuttomLargeSideBar(
                  icon: FontAwesomeIcons.moneyBill1Wave,
                  navigationIcon: PagesRoutes.pdvMonitor,
                  text: 'PDV',
                  position: 5),
              IconbuttomLargeSideBar(
                  icon: FontAwesomeIcons.download,
                  navigationIcon: PagesRoutes.loadData,
                  text: 'Carga de dados',
                  position: 6),
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
                IconButton(
                  onPressed: () {
                    sideBarController.toggle();
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  color: Colors.white,
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
class IconbuttomLargeSideBar extends StatelessWidget {
  const IconbuttomLargeSideBar({
    Key? key,
    required this.navigationIcon,
    required this.icon,
    required this.text,
    required this.position,
  }) : super(key: key);

  final String navigationIcon;
  final IconData icon;
  final String text;
  final int position;

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController;

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    return InkWell(
      onTap: () => Get.toNamed(navigationIcon),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
            border: Border.all(
              width: 0,
              color: Colors.transparent,
            ),
            color: position == sideBarController.position.value
                ? Colors.white
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: position == sideBarController.position.value ? 30 : 20,
                color: position == sideBarController.position.value
                    ? CustomColors.customSwatchColor
                    : Colors.white,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: TextStyle(
                  color: position == sideBarController.position.value
                      ? CustomColors.customSwatchColor
                      : Colors.white,
                  fontSize:
                      position == sideBarController.position.value ? 20 : 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
