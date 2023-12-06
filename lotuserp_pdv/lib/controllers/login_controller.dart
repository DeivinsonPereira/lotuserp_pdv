import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscureText = false.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }
}