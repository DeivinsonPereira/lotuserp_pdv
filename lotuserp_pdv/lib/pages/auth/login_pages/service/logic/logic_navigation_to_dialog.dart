import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/components/create_password_dialog.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/components/verify_password_dialog.dart';

import '../../../../../collections/admin_config.dart';
import '../../../../../services/dependencies.dart';
import '../../../../../shared/admin_config/get_admin_config.dart';

class LogicNavigationToDialog {
  var adminConfigController = Dependencies.adminConfigController();

  Future<void> goToConfig() async {
    admin_config? password = await GetAdminConfig().getAdmin();

    if (password == null) {
      Get.dialog(barrierDismissible: false, const CreatePasswordDialog());
    } else {
      Get.dialog(barrierDismissible: false, VerifyPasswordDialog(password: password.senha));
    }
  }
}
