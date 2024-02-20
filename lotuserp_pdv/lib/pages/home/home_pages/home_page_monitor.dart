// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import '../../../services/dependencies.dart';
import 'component/drawer_widget_monitor.dart';

//principal class
class HomePageMonitor extends StatefulWidget {
  const HomePageMonitor({super.key});

  @override
  State<HomePageMonitor> createState() => _HomePageMonitorState();
}

class _HomePageMonitorState extends State<HomePageMonitor> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SideBarController sideBarController = Dependencies.sidebarController();
    Dependencies.informationController();
    Dependencies.configcontroller();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              const DrawerWidgetMonitor(),
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
