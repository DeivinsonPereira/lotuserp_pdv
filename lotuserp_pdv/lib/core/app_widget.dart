import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lotuserp_pdv',
      navigatorObservers: [ImmersiveModeObserver()],
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        primarySwatch: CustomColors.customSwatchColor,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}

class ImmersiveModeObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  void setImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}
