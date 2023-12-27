import 'package:get/get.dart';

import '../../controllers/global_controller.dart';
import '../../controllers/printer_controller.dart';
import '../../controllers/side_bar_controller.dart';

abstract class InjectionDependencies {
  
  static SideBarController sidebarController() {

    if (Get.isRegistered<SideBarController>()) {
      return Get.find<SideBarController>();
    } else {
      return Get.put(SideBarController());
    }
  }

  static GlobalController globalController() {

    if (Get.isRegistered<GlobalController>()) {
      return Get.find<GlobalController>();
    } else {
      return Get.put(GlobalController());
    }
  }

  static PrinterController printerController() {
    if (Get.isRegistered<PrinterController>()) {
      return Get.find<PrinterController>();
    } else {
      return Get.put(PrinterController());
    }
  }


}