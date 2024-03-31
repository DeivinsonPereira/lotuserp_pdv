/*import 'package:flutter/material.dart';

import '../../../../../common/components/custom_text_style.dart';

class CashierCustomerWidget {
  Widget buildText(String text, bool foiPreenchido) {
    if (text.isNotEmpty) {
      return Text(text,
          style: CustomTextStyle.textButtonStyleWhite,
          textAlign: TextAlign.center);
    }else if(text.isEmpty && foiPreenchido){ 
      return const Text(
        'Transação Cancelada'
        ,style: CustomTextStyle.textButtonStyleWhite,
          textAlign: TextAlign.center);
    }else {
      return const Text('');
    }
  }
}*/