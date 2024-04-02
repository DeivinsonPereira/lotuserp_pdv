// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/pages/common/custom_logo.dart';

import '../../collections/dado_empresa.dart';
import '../../services/dependencies.dart';
import '../../services/tef_elgin/tef_elgin_customization_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var configController = Dependencies.configcontroller();
  var logoController = Dependencies.logoController();

  var _scale = 5.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 800 / _scale;

  @override
  void initState() {
    Dependencies.textFieldController();
    Dependencies.configcontroller();
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
    getDataDb();
    super.initState();
  }

  Future<void> getDataDb() async {
    dado_empresa? data = await configController.getDataDb();
    if (data != null && data.cor_fundo.isNotEmpty) {
      configController.updateColorBackground(data.cor_fundo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomColors.customSwatchColor,
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: configController.colorBackground['color'] as Color,
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
              child: SizedBox(height: 500, child: CustomLogo().getLogoBranca()),
            ),
          ),
        ),
      ),
    );
  }
}
