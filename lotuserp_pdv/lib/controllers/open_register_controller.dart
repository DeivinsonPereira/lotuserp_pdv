import 'package:get/get.dart';

class OpenRegisterController extends GetxController {
  var isButtonEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    isButtonEnabled.value = true;
  }

  void toggleIsButtonEnabled() {
    isButtonEnabled.value = !isButtonEnabled.value;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    isButtonEnabled.value = true;
  }
}
