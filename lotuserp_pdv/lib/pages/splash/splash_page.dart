import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';

import '../../services/tef_elgin/tef_elgin_customization_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 5.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 800 / _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 2;
      });
    });
    Future.delayed(const Duration(seconds: 3), () async {
      await TefElginCustomizationService.customizarAplicacao();
      Get.toNamed(PagesRoutes.loginRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: CustomColors.customSwatchColor,
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.ease,
            opacity: _animationOpacityLogo,
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              color: CustomColors.customSwatchColor,
              child: SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
