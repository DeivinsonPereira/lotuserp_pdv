import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/app_colors.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor[900],
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              //logo
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(
                        45,
                      ),
                    ),
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormWidgets().textFieldWidget(
                          Icons.wifi,
                          'IP do Servidor',
                        ),
                        FormWidgets().textFieldWidget(
                          Icons.business,
                          'ID da Empresa',
                        ),
                        FormWidgets().textFieldWidget(
                          Icons.note,
                          'ID Série NFC-e',
                        ),
                        FormWidgets().elevatedButtonWidget(
                          PagesRoutes.loginRoute,
                          'Encontrar Empresa'
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
