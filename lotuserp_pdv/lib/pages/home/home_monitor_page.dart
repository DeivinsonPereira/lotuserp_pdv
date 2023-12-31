// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'component/drawer.dart';

//principal class
class HomeMonitorPage extends StatefulWidget {
  const HomeMonitorPage({super.key});

  @override
  State<HomeMonitorPage> createState() => _HomeMonitorPageState();
}

class _HomeMonitorPageState extends State<HomeMonitorPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              const DrawerWidget(),
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
