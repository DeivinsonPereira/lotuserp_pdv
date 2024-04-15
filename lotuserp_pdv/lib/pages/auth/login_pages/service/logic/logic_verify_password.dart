import 'package:lotuserp_pdv/services/dependencies.dart';

class LogicVerifyPassword {

  var adminConfigController = Dependencies.adminConfigController();

  bool verify() {
    if (adminConfigController.passwordConfigController.text.isNotEmpty && 
      adminConfigController.passwordConfigController.text.length == 6) {
      return true;
    } else {
      return false;
    }
  }
}