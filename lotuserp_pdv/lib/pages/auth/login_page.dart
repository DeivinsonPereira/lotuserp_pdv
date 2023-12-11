import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/controllers/home_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Get.put(PasswordController());
    // ignore: unused_local_variable
    TextFieldController textFieldController = Get.put(TextFieldController());
    IsarService service = IsarService();

    bool areFieldsEmpty() {
      String enteredPassword = passwordController.passwordController.text;
      String login = passwordController.userController.text;

      return enteredPassword.isEmpty || login.isEmpty;
    }

    Future<bool> arePasswordsEquals() async {
      var passwordCrypto = passwordController.createHashedPassword();

      String login = passwordController.userController.text;

      String? savedHashedPassword =
          await service.getPasswordFromDatabase(login);
      return passwordCrypto == savedHashedPassword;
    }

    Future<bool> areloginEquals() async {
      String login = passwordController.userController.text.toUpperCase();
      String? savedLogin = await service.getLoginFromDatabase(login);
      return login.toUpperCase() == savedLogin!.toUpperCase();
    }

    return GetBuilder(
      init: HomeController(),
      builder: (_) => Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 50,
                child: Material(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
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
                              ),
                              Form(
                                child: Column(
                                  children: [
                                    FormWidgets().customTextField(
                                        'Usuário', Icons.person),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormWidgets().customTextFieldIcon(
                                        Icons.lock, 'Senha',
                                        obscureText: true),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: 180,
                                child: Image.asset(
                                    'assets/images/Logo_Nova_Transparente.png'),
                              ),
                            ),
                            Expanded(
                              child: Align(
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
                                    onPressed: () async {
                                      //verifica se os campos estão vazios
                                      if (areFieldsEmpty()) {
                                        Get.snackbar(
                                          'Campos vazios',
                                          'Por favor, preencha todos os campos.',
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        return;
                                      }
                                      String login = passwordController
                                          .userController.text
                                          .toUpperCase();
                                      String? savedLogin = await service
                                          .getLoginFromDatabase(login);

                                      // Verifica se o login existe
                                      if (savedLogin == null) {
                                        Get.snackbar(
                                          'Login inválido',
                                          'O login digitado não existe. Por favor, tente novamente.',
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        return;
                                      }

                                      if (await areloginEquals() == false) {
                                        Get.snackbar(
                                          'Login inválido',
                                          'O Usuario digitado não existe. Por favor, tente novamente.',
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }

                                      // Verifica se login está igual ao usuario digitado

                                      if (await arePasswordsEquals() &&
                                          await areloginEquals()) {
                                        var userOnline = await service
                                            .getUserIdColaborador(savedLogin);
                                        var usuarioLogado = UsuarioLogado()
                                          ..login = savedLogin
                                          ..idColaborador = userOnline;
                                        await service.insertUser(usuarioLogado);
                                        Get.toNamed('/');
                                      } else {
                                        Get.snackbar(
                                          'Senha incorreta',
                                          'A senha digitada está incorreta. Por favor, tente novamente.',
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }

                                      passwordController.clear();
                                    },
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: FloatingActionButton(
                                    backgroundColor:
                                        CustomColors.customSwatchColor,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
