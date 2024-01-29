import 'package:get/get.dart';

class ResponseServidorController extends GetxController{

  var openRegisterId = 0.obs;

  //atualizar openRegisterId
  void updateOpenRegisterId(int value) {
    openRegisterId.value = value;
    update();
  }

  
}