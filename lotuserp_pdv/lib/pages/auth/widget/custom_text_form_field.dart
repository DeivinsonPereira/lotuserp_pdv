// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../controllers/text_field_controller.dart';
import '../../../core/custom_colors.dart';
import '../../../services/injection_dependencies.dart';
import 'custom_snack_bar.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final String variableName;
  bool? numericKeyboard;
  bool? useIconButton;

  CustomTextFormField({
    Key? key,
    required this.icon,
    this.controller,
    required this.variableName,
    this.numericKeyboard = false,
    this.useIconButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldController textFieldController =
        Dependencies.textFieldController();
    IsarService service = IsarService();
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15,
        bottom: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 510,
            child: Text(
              variableName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: numericKeyboard! ? TextInputType.number : null,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: useIconButton!
                    ? Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: CustomColors.customSwatchColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            icon,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            if (controller!.text.isEmpty) {
                              const CustomSnackBar(
                                message: 'O campo obrigatório',
                              ).show();
                            } else {
                              textFieldController.salvarInformacoesContrato();
                              String ip = await service.getIpEmpresa(
                                  isCorrectUrl: true);
                              if (ip.isNotEmpty) {
                                textFieldController
                                    .updateNumeroContratoToIp(ip);
                                controller!.text =
                                    textFieldController.numContratoEmpresa;
                              }
                            }
                          },
                        ),
                      )
                    : Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: CustomColors.customSwatchColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),
              ),
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
