import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/home_controller.dart';
import 'package:lotuserp_pdv/pages/home/home_card_machine.dart';
import 'package:lotuserp_pdv/pages/home/home_monitor.dart';
import 'package:lotuserp_pdv/pages/home/home_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return const HomeMonitor();
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const HomeTablet();
        } else {
          return const HomeCardMachine();
        }
        
      }),
    );
  }
}
