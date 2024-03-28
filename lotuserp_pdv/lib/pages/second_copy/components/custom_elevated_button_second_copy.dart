// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/pages/second_copy/components/identify_button.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../core/custom_colors.dart';

class CustomElevatedButtonSecondCopy extends StatelessWidget {
  final Function() function;
  final String text;
  final bool isNFCE;
  const CustomElevatedButtonSecondCopy({
    Key? key,
    required this.function,
    required this.text,
    required this.isNFCE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            backgroundColor: StyleElevatedButton().getColor(isNFCE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            text,
            style: StyleElevatedButton().getStyle(isNFCE),
          ),
        ));
  }
}

class StyleElevatedButton {
  var checkboxController = Dependencies.checkboxController();

  // Retorna o estilo do texto para o botão
  TextStyle getStyle(bool isNFCE) {
    if (isNFCE) {
      if (IdentifyButton.NFCE.index ==
          checkboxController.selectedOption.value) {
        return CustomTextStyleButton.isSelected();
      } else {
        return CustomTextStyleButton.isNotSelected();
      }
    } else {
      if (IdentifyButton.TEF.index == checkboxController.selectedOption.value) {
        return CustomTextStyleButton.isSelected();
      } else {
        return CustomTextStyleButton.isNotSelected();
      }
    }
  }

  // Retorna o estilo do botão
  Color getColor(bool isNFCE) {
    var checkboxController = Dependencies.checkboxController();
    if (isNFCE) {
      if (IdentifyButton.NFCE.index ==
          checkboxController.selectedOption.value) {
        return CustomTextButton.isSelected;
      } else {
        return CustomTextButton.isNotSelected;
      }
    } else {
      if (IdentifyButton.TEF.index == checkboxController.selectedOption.value) {
        return CustomTextButton.isSelected;
      } else {
        return CustomTextButton.isNotSelected;
      }
    }
  }
}

// Constrói o TextStyle para os botões
abstract class CustomTextStyleButton {
  static TextStyle isSelected() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  static TextStyle isNotSelected() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }
}

// Constrói a cor dos botões
abstract class CustomTextButton {
  static Color isSelected = const Color.fromARGB(255, 211, 211, 211);
  static Color isNotSelected = CustomColors.informationBox;
}
