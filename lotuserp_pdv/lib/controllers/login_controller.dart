import 'package:get/get.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class LoginController extends GetxController {
  IsarService service = IsarService();

  RxBool obscureText = false.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }

  Future<List<String>> getUsers() async {
    return await service.getUsersLogin();
  }

}
