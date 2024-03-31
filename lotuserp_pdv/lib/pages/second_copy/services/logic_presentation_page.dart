import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/second_copy/components/identify_button.dart';
import 'package:lotuserp_pdv/pages/second_copy/components/nfce_second_copy_page.dart';

import '../../../services/dependencies.dart';
import '../components/checkbox_controller.dart';
import '../components/tef_second_copy_page.dart';

class LogicPresentationPage {
  Widget getPage() {
    Dependencies.checkboxController();
    return GetBuilder<CheckboxController>(builder: (_) {
      if (_.selectedOption.value == IdentifyButton.NFCE.index) {
        return const NfceSecondCopyPage();
      } else {
        return const TefSecondCopyPage();
      }
    });
  }
}
