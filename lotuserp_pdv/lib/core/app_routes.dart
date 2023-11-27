import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/auth/auth_page.dart';
import 'package:lotuserp_pdv/pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: PagesRoutes.authRoute,
      page: () => const AuthPage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash_page';
  static const String authRoute = '/auth_page';
}
