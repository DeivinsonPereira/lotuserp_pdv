// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/controllers/login_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/autocomplete_widget.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import 'widget/custom_confirm_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialização dos controladores
    PasswordController passwordController = Dependencies.passwordController();

    // Texto no canto superior esquerdo da tela
    Widget _textTop() {
      return const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 20),
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

    // Informações coluna esquerda
    Widget _leftContent() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textTop(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: _formsAutentications(),
            ),
          ],
        ),
      );
    }

    // logo do canto superior direito
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: 180,
          child: Image.asset('assets/images/Logo_Nova_Transparente.png'),
        ),
      );
    }

    //Botão para entrar na tela de configurações
    Widget _configPage() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
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
        ),
      );
    }

    // Informações coluna direita
    Widget _rightContent() {
      return Column(
        children: [
          // Logo do canto superior direito
          _logo(),
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
      );
    }

    // Divide a tela para alocação do conteúdo.
    Widget _divisionPage() {
      return Row(
        children: [
          // Informações coluna esquerda
          Expanded(flex: 3, child: _leftContent()),
          Expanded(flex: 2, child: _rightContent()),
        ],
      );
    }

    // Container branco de fundo da tela de login
    Widget _backgroundContainer() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 50,
          child: Material(
              color: const Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
              child: _divisionPage()));
    }

    // Construção do corpo principal da página de login
    Widget _buildBody() {
      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: _backgroundContainer()),
          ));
    }

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: _buildBody(),
    );
  }
}
