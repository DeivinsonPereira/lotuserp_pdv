import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/auth/config_page.dart';
import 'package:lotuserp_pdv/pages/auth/login_page.dart';
import 'package:lotuserp_pdv/pages/close_register_page.dart';
import 'package:lotuserp_pdv/pages/data_manager_page.dart';
import 'package:lotuserp_pdv/pages/home/home_page.dart';
import 'package:lotuserp_pdv/pages/home/home_testea.dart';
import 'package:lotuserp_pdv/pages/moviment_cash/moviment_cash_page.dart';
import 'package:lotuserp_pdv/pages/open_register/open_register_page.dart';
import 'package:lotuserp_pdv/pages/payment/payment_page.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_monitor_page.dart';
import 'package:lotuserp_pdv/pages/product/product_page.dart';
import 'package:lotuserp_pdv/pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.loginRoute,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: PagesRoutes.homePageRoute,
      page: () => const HomePage(),
    ),
    GetPage(
      name: PagesRoutes.paymentRoute,
      page: () => const PaymentPage(),
    ),
    GetPage(
      name: PagesRoutes.pdvMonitor,
      page: () => const PdvMonitorPage(),
    ),
    GetPage(
      name: PagesRoutes.configRoute,
      page: () => const ConfigPage(),
    ),
    GetPage(
      name: PagesRoutes.testeDrawer,
      page: () => const HomeTeste(),
    ),
    GetPage(
      name: PagesRoutes.openRegister,
      page: () => const OpenRegisterPage(),
    ),
    GetPage(
      name: PagesRoutes.movimentRegister,
      page: () => const MovimentCashPage(),
    ),
    GetPage(
      name: PagesRoutes.finishRegister,
      page: () => const CloseRegisterPage(),
    ),
    GetPage(
      name: PagesRoutes.products,
      page: () => const ProductPage(),
    ),
    GetPage(
      name: PagesRoutes.loadData,
      page: () => const DataManagerPage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash_page';
  static const String loginRoute = '/login_page';
  static const String configRoute = '/config_page';
  static const String homePageRoute = '/';
  static const String pdvMonitor = '/pdv_monitor';
  static const String paymentRoute = '/payment_page';
  static const String testeDrawer = '/teste_drawer';
  static const String openRegister = '/open_register';
  static const String movimentRegister = '/moviment_register';
  static const String finishRegister = '/finish_register';
  static const String products = '/products';
  static const String loadData = '/load_data';
}
