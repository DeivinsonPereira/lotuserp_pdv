import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/second_copy/components/identify_button.dart';
import 'package:lotuserp_pdv/pages/second_copy/components/nfce_second_copy_page.dart';

import '../../../services/dependencies.dart';

class LogicPresentationPage {
  Widget getPage() {
    var checkboxController = Dependencies.checkboxController();
    if (checkboxController.selectedOption.value == IdentifyButton.NFCE.index) {
      return const NfceSecondCopyPage();
    } else {
      return Container();
    }
  }
}
