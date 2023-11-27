import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/auth/auth_page.dart';
import 'package:lotuserp_pdv/pages/auth/sign_in_page.dart';
import 'package:lotuserp_pdv/pages/home_page.dart';
import 'package:lotuserp_pdv/pages/login_page.dart';
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
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: PagesRoutes.loginRoute,
      page: () => const LoginPage(),
    ),
    GetPage(name: PagesRoutes.homePageRoute, page: () => const HomePage(),)
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash_page';
  static const String authRoute = '/auth_page';
  static const String signInRoute = '/sign_in_page';
  static const String loginRoute = '/login_page';
  static const String homePageRoute = '/';
}
