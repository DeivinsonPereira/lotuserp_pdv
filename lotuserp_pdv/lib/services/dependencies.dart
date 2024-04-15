import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/caixa_controller.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/initial_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/save_image_path_controller.dart';

import '../../controllers/close_register_controller.dart';
import '../../controllers/global_controller.dart';
import '../../controllers/information_controller.dart';
import '../../controllers/load_controller.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/moviment_register_controller.dart';
import '../../controllers/password_controller.dart';
import '../../controllers/payment_controller.dart';
import '../../controllers/printer_controller.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/search_product_pdv_controller.dart';
import '../../controllers/side_bar_controller.dart';
import '../../controllers/text_field_controller.dart';
import '../controllers/admin_config_controller.dart';
import '../controllers/balanca_prix_controller.dart';
import '../controllers/empresa_valida_controller.dart';
import '../controllers/logo_controller.dart';
import '../controllers/open_register_controller.dart';
import '../controllers/response_servidor_controller.dart';
import '../pages/printer/component/printer_popup_controller.dart';
import '../pages/second_copy/components/checkbox_controller.dart';

abstract class Dependencies {
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

  static ProdutoController productController() {
    if (Get.isRegistered<ProdutoController>()) {
      return Get.find<ProdutoController>();
    } else {
      return Get.put(ProdutoController());
    }
  }

  static SearchProductPdvController searchProductPdvController() {
    if (Get.isRegistered<SearchProductPdvController>()) {
      return Get.find<SearchProductPdvController>();
    } else {
      return Get.put(SearchProductPdvController());
    }
  }

  static LoginController loginController() {
    if (Get.isRegistered<LoginController>()) {
      return Get.find<LoginController>();
    } else {
      return Get.put(LoginController());
    }
  }

  static CloseRegisterController closeRegisterController() {
    if (Get.isRegistered<CloseRegisterController>()) {
      return Get.find<CloseRegisterController>();
    } else {
      return Get.put(CloseRegisterController());
    }
  }

  static InformationController informationController() {
    if (Get.isRegistered<InformationController>()) {
      return Get.find<InformationController>();
    } else {
      return Get.put(InformationController());
    }
  }

  static Configcontroller configcontroller() {
    if (Get.isRegistered<Configcontroller>()) {
      return Get.find<Configcontroller>();
    } else {
      return Get.put(Configcontroller());
    }
  }

  static BalancaPrix3FitController balancaController() {
    if (Get.isRegistered<BalancaPrix3FitController>()) {
      return Get.find<BalancaPrix3FitController>();
    } else {
      return Get.put(BalancaPrix3FitController());
    }
  }

  static ResponseServidorController responseServidorController() {
    if (Get.isRegistered<ResponseServidorController>()) {
      return Get.find<ResponseServidorController>();
    } else {
      return Get.put(ResponseServidorController());
    }
  }

  static CheckboxController checkboxController() {
    if (Get.isRegistered<CheckboxController>()) {
      return Get.find<CheckboxController>();
    } else {
      return Get.put(CheckboxController());
    }
  }

  static OpenRegisterController openRegisterController() {
    if (Get.isRegistered<OpenRegisterController>()) {
      return Get.find<OpenRegisterController>();
    } else {
      return Get.put(OpenRegisterController());
    }
  }

  static PrinterPopupController printerPopupController() {
    if (Get.isRegistered<PrinterPopupController>()) {
      return Get.find<PrinterPopupController>();
    } else {
      return Get.put(PrinterPopupController());
    }
  }

  static SaveImagePathController saveImagePathController() {
    if (Get.isRegistered<SaveImagePathController>()) {
      return Get.find<SaveImagePathController>();
    } else {
      return Get.put(SaveImagePathController(), permanent: true);
    }
  }

  static EmpresaValidaController empresaValidaController() {
    if (Get.isRegistered<EmpresaValidaController>()) {
      return Get.find<EmpresaValidaController>();
    } else {
      return Get.put(EmpresaValidaController());
    }
  }

  static InitialController initialController() {
    if (Get.isRegistered<InitialController>()) {
      return Get.find<InitialController>();
    } else {
      return Get.put(InitialController());
    }
  }

  static LogoController logoController() {
    if (Get.isRegistered<LogoController>()) {
      return Get.find<LogoController>();
    } else {
      return Get.put(LogoController(), permanent: true);
    }
  }

  static AdminConfigController adminConfigController() {
    if (Get.isRegistered<AdminConfigController>()) {
      return Get.find<AdminConfigController>();
    } else {
      return Get.put(AdminConfigController());
    }
  }
}
