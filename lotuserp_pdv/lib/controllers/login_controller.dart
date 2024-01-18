import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/usuario_logado.dart';
import '../core/app_routes.dart';
import '../pages/common/custom_snack_bar.dart';
import 'password_controller.dart';

class LoginController extends GetxController {
  IsarService service = IsarService();
  PasswordController passwordController = Dependencies.passwordController();

  RxBool obscureText = false.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }

  Future<List<String>> getUsers() async {
    return await service.getUsersLogin();
  }

  //captura possíveis erros no login
  Future<void> handleLogin() async {
    //verifica se os campos estão vazios
    if (_areFieldsEmpty()) {
      const CustomSnackBar(message: 'Por favor, preencha todos os campos.')
          .show();
      return;
    }

    String login = passwordController.userController.text.toUpperCase();
    String? savedLogin = await service.getLoginFromDatabase(login);

    // Verifica se o login existe
    if (savedLogin == null || !(await _areloginEquals())) {
      const CustomSnackBar(
              message:
                  'O login ou usuário digitado não existe. Por favor, tente novamente.')
          .show();
      return;
    }

    // Verifica se login está igual ao usuario digitado
    if (await _arePasswordsEquals()) {
      await _proceedToHome(savedLogin);
    } else {
      const CustomSnackBar(
              message:
                  'A senha digitada está incorreta. Por favor, tente novamente.')
          .show();
    }
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

    String? savedHashedPassword = await service.getPasswordFromDatabase(login);
    return passwordCrypto == savedHashedPassword;
  }

  // faz a verificação do login
  Future<bool> _areloginEquals() async {
    String login = passwordController.userController.text.toUpperCase();
    String? savedLogin = await service.getLoginFromDatabase(login);
    return login.toUpperCase() == savedLogin!.toUpperCase();
  }
}
