import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/auth/login_page.dart';
import 'package:lotuserp_pdv/pages/home/home_page.dart';
import 'package:lotuserp_pdv/pages/payment/payment_page.dart';
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
    )
  ];
}

abstract class PagesRoutes {
  static const String homePageRoute = '/';
  static const String splashRoute = '/splash_page';
  static const String loginRoute = '/login_page';
  static const String paymentRoute = '/payment_page';
}
