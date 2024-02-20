// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';

import '../../../controllers/password_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../config/config_pages/widget/custom_confirm_button.dart';
import '../../widgets_pages/autocomplete_widget.dart';
import '../../widgets_pages/form_widgets.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialização dos controladores
    PasswordController passwordController = Dependencies.passwordController();
    Dependencies.empresaValidaController();

    // Texto na parte superior da tela
    Widget _textTop() {
      return const Padding(
        padding: EdgeInsets.only(top: 25, bottom: 20),
        child: Text(
          'Bem vindo(a)!',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0XFF2B2F5B),
            fontSize: 30,
          ),
        ),
      );
    }

    // formulários de autenticação para login
    Widget _formsAutentications() {
      return Form(
        child: Column(
          children: [
            // cria o autocomplete do usuario
            AutocompleteWidget(
                controller: passwordController,
                usuario: 'Usuário',
                icon: Icons.person),
            const SizedBox(
              height: 15,
            ),
            // cria o campo de senha
            FormWidgets()
                .customTextFieldIcon(Icons.lock, 'Senha', obscureText: true),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    // logo
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: 250,
          child: Image.asset('assets/images/Logo_Nova_Transparente.png'),
        ),
      );
    }

    //Botão para entrar na tela de configurações
    Widget _configPage() {
      return Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: CustomColors.customSwatchColor,
            onPressed: () {
              passwordController.userController.clear();
              passwordController.passwordController.clear();
              Get.toNamed(PagesRoutes.configRoute);
            },
            child: Icon(
              Icons.settings,
              size: 50,
              color: CustomColors.customContrastColor,
            ),
          ),
        ),
      );
    }

    // Botões de entrar e sair
    Widget _buttonsContent() {
      return SizedBox(
        height: Get.height * 0.40,
        width: Get.width * 0.9,
        child: Column(
          children: [
            // Logo do canto superior direito
            Expanded(
              child: Column(children: [
                // Botão entrar
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: CustomConfirmButton(
                    text: 'Entrar',
                    isConfirm: true,
                  ),
                ),
                // botão de sair
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CustomConfirmButton(text: 'Sair'),
                )
              ]),
            ),
            _configPage()
          ],
        ),
      );
    }

    // TextFields and buttons
    Widget _textFieldsLogoAndButtons() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          _textTop(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: _formsAutentications(),
          ),
          _buttonsContent(),
        ],
      );
    }

    // Container branco de fundo da tela de login
    Widget _backgroundContainer() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Material(
          color: Colors.white,
          child: _textFieldsLogoAndButtons(),
        ),
      );
    }

    // Construção do corpo principal da página de login
    Widget _buildBody() {
      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: _backgroundContainer(),
          ));
    }

    // Scaffold do conteúdo
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SafeArea(child: _buildBody()),
    );
  }
}
