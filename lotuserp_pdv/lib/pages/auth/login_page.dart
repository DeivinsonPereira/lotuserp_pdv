// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/services/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

/// LoginPage
///
/// Uma página de login responsável por autenticar usuários.
/// Contém campos para entrada de usuário e senha, e um botão para realizar o login.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialização dos controladores
    PasswordController passwordController = Dependencies.passwordController();
    Dependencies.textFieldController();
    Dependencies.printerController();

    IsarService service = IsarService();

    // Métodos privados para validações

    // retorna se um dos campos esta vazio
    bool _areFieldsEmpty() {
      String enteredPassword = passwordController.passwordController.text;
      String login = passwordController.userController.text;

      return enteredPassword.isEmpty || login.isEmpty;
    }

    // faz a verificação da senha
    Future<bool> _arePasswordsEquals() async {
      var passwordCrypto = passwordController.createHashedPassword();

      String login = passwordController.userController.text;

      String? savedHashedPassword =
          await service.getPasswordFromDatabase(login);
      return passwordCrypto == savedHashedPassword;
    }

    // faz a verificação do login
    Future<bool> _areloginEquals() async {
      String login = passwordController.userController.text.toUpperCase();
      String? savedLogin = await service.getLoginFromDatabase(login);
      return login.toUpperCase() == savedLogin!.toUpperCase();
    }

    // Cria um registro no banco do usuario logado e navega para a homePage
    Future<void> _proceedToHome(String savedLogin) async {
      var userOnline = await service.getUserIdColaborador(savedLogin);
      var idUser = await service.getUserIdUser(savedLogin);
      var usuarioLogado = usuario_logado()
        ..login = savedLogin
        ..id_user = idUser
        ..id_colaborador = userOnline;
      await service.insertUser(usuarioLogado);
      await Get.offNamed(PagesRoutes.homePageRoute);
    }

    //captura possíveis erros no login
    Future<void> _handleLogin() async {
      //verifica se os campos estão vazios
      if (_areFieldsEmpty()) {
        const CustomSnackBar(
          message: 'Por favor, preencha todos os campos.',
        ).show();

        return;
      }
      String login = passwordController.userController.text.toUpperCase();
      String? savedLogin = await service.getLoginFromDatabase(login);

      // Verifica se o login existe
      if (savedLogin == null) {
        const CustomSnackBar(
          message: 'O login digitado não existe. Por favor, tente novamente.',
        ).show();
        return;
      }

      // se o login não existir exibe o snackbar
      if (await _areloginEquals() == false) {
        const CustomSnackBar(
          message: 'O Usuario digitado não existe. Por favor, tente novamente.',
        ).show();
      }

      // Verifica se login está igual ao usuario digitado
      if (await _arePasswordsEquals() && await _areloginEquals()) {
        await _proceedToHome(savedLogin);
      } else {
        const CustomSnackBar(
          message:
              'A senha digitada está incorreta. Por favor, tente novamente.',
        ).show();
      }
      //limpa os campos digitados
      passwordController.clear();
    }

    // Texto no canto superior esquerdo da tela
    Widget _textTop() {
      return const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Text(
          'Bem vindo!',
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
            FormWidgets().customAutocompleteTextField('Usuário', Icons.person),
            const SizedBox(
              height: 15,
            ),
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
            _formsAutentications(),
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

    // Botão entrar
    Widget _buttonConfirm() {
      return Align(
        alignment: const Alignment(0, -0.72),
        child: SizedBox(
          width: 350,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B2F5B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () async => _handleLogin(),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0XFFFFFFFF),
                  fontSize: 24,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
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
          Expanded(child: _buttonConfirm()), // Botão entrar
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
