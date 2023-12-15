// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

//principal class
class HomeTeste extends StatefulWidget {
  const HomeTeste({super.key});

  @override
  State<HomeTeste> createState() => _HomeTesteState();
}

class _HomeTesteState extends State<HomeTeste> {
  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Obx(
            () => AnimatedContainer(
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
          ),
          Center(
            child: Image.asset(
              'assets/images/Logo_Nova_Transparente.png',
              width: 500,
            ),
          )
        ],
      ),
    );
  }
}

//statefull do side bar pequeno
class SmallSidebar extends StatefulWidget {
  const SmallSidebar({super.key});

  @override
  State<SmallSidebar> createState() => _SmallSidebarState();
}

// Side bar pequena
class _SmallSidebarState extends State<SmallSidebar> {
  SideBarController sideBarController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                  icon: 'assets/images/folder_abrircaixa.png',
                  navigationIcon: PagesRoutes.openRegister,
                ),
                IconbuttomSmallSideBar(
                  icon: 'assets/images/money_moviment.png',
                  navigationIcon: PagesRoutes.movimentRegister,
                ),
                IconbuttomSmallSideBar(
                  icon: 'assets/images/adjust_fechar_caixa.png',
                  navigationIcon: PagesRoutes.finishRegister,
                ),
                IconbuttomSmallSideBar(
                  icon: 'assets/images/notes_products.png',
                  navigationIcon: PagesRoutes.products,
                ),
                IconbuttomSmallSideBar(
                  icon: 'assets/images/pdv_cart.png',
                  navigationIcon: PagesRoutes.pdvMonitor,
                ),
                IconbuttomSmallSideBar(
                  icon: 'assets/images/database_loaddata.png',
                  navigationIcon: PagesRoutes.loadData,
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

// Side bar grande
class LargeSideBar extends StatelessWidget {
  const LargeSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.find();
    PasswordController passwordController = Get.find();
    var userName = passwordController.userController.text;

    return Drawer(
      width: 250,
      backgroundColor: CustomColors.customSwatchColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/images/Logo Nova Branco Vertical.png',
                  width: 50,
                ),
              ),
            ),
          ),
          Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    sideBarController.hours.value,
                    style: const TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
                Text(
                  sideBarController.dataAbertura.value,
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                Text(
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconbuttomLargeSideBar(
                    icon: 'assets/images/folder_abrircaixa.png',
                    navigationIcon: PagesRoutes.openRegister,
                    text: 'Abrir caixa'),
                IconbuttomLargeSideBar(
                    icon: 'assets/images/money_moviment.png',
                    navigationIcon: PagesRoutes.movimentRegister,
                    text: 'Movimentar caixa'),
                IconbuttomLargeSideBar(
                    icon: 'assets/images/adjust_fechar_caixa.png',
                    navigationIcon: PagesRoutes.finishRegister,
                    text: 'Fechar caixa'),
                IconbuttomLargeSideBar(
                    icon: 'assets/images/notes_products.png',
                    navigationIcon: PagesRoutes.products,
                    text: 'Produtos'),
                IconbuttomLargeSideBar(
                    icon: 'assets/images/pdv_cart.png',
                    navigationIcon: PagesRoutes.pdvMonitor,
                    text: 'PDV'),
                IconbuttomLargeSideBar(
                    icon: 'assets/images/database_loaddata.png',
                    navigationIcon: PagesRoutes.loadData,
                    text: 'Carga de dados'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Divider(
              color: Colors.white.withAlpha(300),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                sideBarController.toggle();
              },
              icon: const Icon(Icons.arrow_back_ios_outlined),
              color: Colors.white,
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
  }) : super(key: key);

  final String navigationIcon;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(navigationIcon),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15.0, right: 10.0, bottom: 10),
              child: Image.asset(
                icon,
                color: Colors.white,
                width: 25,
                height: 25,
              ),
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Botões para o side bar pequeno
class IconbuttomSmallSideBar extends StatelessWidget {
  const IconbuttomSmallSideBar({
    Key? key,
    required this.navigationIcon,
    required this.icon,
  }) : super(key: key);

  final String navigationIcon;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: IconButton(
        onPressed: () {
          Get.toNamed(navigationIcon);
        },
        icon: Image.asset(
          icon,
          color: Colors.white,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
