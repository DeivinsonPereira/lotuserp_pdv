import 'package:get/get.dart';

class ResponseServidorController extends GetxController {
  var openRegisterId = 0.obs;
  var enviado = 0.obs;

  //atualizar openRegisterId
  void updateOpenRegisterId(int value) {
    openRegisterId.value = value;
    update();
  }

  void updateEnviadoOpenRegister(int value) {
    enviado.value = value;
    update();
  }
}
