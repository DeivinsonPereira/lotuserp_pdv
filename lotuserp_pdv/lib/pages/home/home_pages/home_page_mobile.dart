import 'package:flutter/material.dart';

import '../../../controllers/side_bar_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import 'component/drawer_widget_mobile.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SideBarController sideBarController = Dependencies.sidebarController();
    Dependencies.informationController();
    Dependencies.configcontroller();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerWidgetMobile(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customSwatchColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white,
                  )),
                  width: size.width,
                  child: Center(
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/Logo_Nova_Transparente.png',
                        width: 500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
