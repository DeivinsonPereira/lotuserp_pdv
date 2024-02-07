import 'package:get/get.dart';

class PrinterPopupController extends GetxController {
  var isButtonEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    isButtonEnabled.value = true;
    update();
  }

  void toggleButton() {
    isButtonEnabled.value = !isButtonEnabled.value;
    update();
  }
}
