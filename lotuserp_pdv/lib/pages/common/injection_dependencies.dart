import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/caixa_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

import '../../controllers/global_controller.dart';
import '../../controllers/load_controller.dart';
import '../../controllers/moviment_register_controller.dart';
import '../../controllers/password_controller.dart';
import '../../controllers/payment_controller.dart';
import '../../controllers/printer_controller.dart';
import '../../controllers/side_bar_controller.dart';
import '../../controllers/text_field_controller.dart';

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

  static PasswordController passwordController() {
    if (Get.isRegistered<PasswordController>()) {
      return Get.find<PasswordController>();
    } else {
      return Get.put(PasswordController());
    }
  }

  static TextFieldController textFieldController() {
    if (Get.isRegistered<TextFieldController>()) {
      return Get.find<TextFieldController>();
    } else {
      return Get.put(TextFieldController());
    }
  }

  static LoadController loadController() {
    if (Get.isRegistered<LoadController>()) {
      return Get.find<LoadController>();
    } else {
      return Get.put(LoadController());
    }
  }

  static MovimentRegisterController movimentRegisterController() {
    if (Get.isRegistered<MovimentRegisterController>()) {
      return Get.find<MovimentRegisterController>();
    } else {
      return Get.put(MovimentRegisterController());
    }
  }

  static CaixaController caixaController() {
    if (Get.isRegistered<CaixaController>()) {
      return Get.find<CaixaController>();
    } else {
      return Get.put(CaixaController());
    }
  }

  static PdvController pdvController() {
    if (Get.isRegistered<PdvController>()) {
      return Get.find<PdvController>();
    } else {
      return Get.put(PdvController());
    }
  }

  static PaymentController paymentController() {
    if (Get.isRegistered<PaymentController>()) {
      return Get.find<PaymentController>();
    } else {
      return Get.put(PaymentController());
    }
  }
}
