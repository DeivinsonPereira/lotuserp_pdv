// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../../controllers/config_controller.dart';
import '../../../core/app_routes.dart';
import '../../../services/dependencies.dart';
import 'widget/custom_field_dropdown.dart';
import 'widget/custom_text_form_field.dart';
import 'widget/list_dropdown_option.dart';
import 'widget/text_field_list.dart';

class ConfigMobile extends StatelessWidget {
  const ConfigMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Configcontroller configController = Dependencies.configcontroller();

    // Campos de configuração da empresa
    Widget _textFormFieldsCompany() {
      return Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: CustomTextFormFieldMobile(
                  icon: TextFieldList.textFieldUrl['icon'],
                  controller: TextFieldList.textFieldUrl['controller'],
                  variableName: TextFieldList.textFieldUrl['label'],
                  useIconButton:
                      TextFieldList.textFieldUrl['useIconButton'] ?? false,
                  isUrl: TextFieldList.textFieldUrl['isUrl'] ?? false),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Row(children: [
                    for (var i = 0; i <= 1; i++) ...{
                      //Campos de texto de configuração do PDV
                      CustomTextFormFieldMobile(
                        icon: TextFieldList.textFieldListRow[i]['icon'],
                        controller: TextFieldList.textFieldListRow[i]
                            ['controller'],
                        variableName: TextFieldList.textFieldListRow[i]
                            ['label'],
                        useIconButton: TextFieldList.textFieldListRow[i]
                                ['useIconButton'] ??
                            false,
                        numericKeyboard: TextFieldList.textFieldListRow[i]
                                ['numericKeyboard'] ??
                            false,
                        isUrl:
                            TextFieldList.textFieldListRow[i]['isUrl'] ?? false,
                      ),
                    }
                  ]),
                  Row(children: [
                    for (var i = 2; i <= 3; i++) ...{
                      //Campos de texto de configuração do PDV
                      CustomTextFormFieldMobile(
                        icon: TextFieldList.textFieldListRow[i]['icon'],
                        controller: TextFieldList.textFieldListRow[i]
                            ['controller'],
                        variableName: TextFieldList.textFieldListRow[i]
                            ['label'],
                        useIconButton: TextFieldList.textFieldListRow[i]
                                ['useIconButton'] ??
                            false,
                        numericKeyboard: TextFieldList.textFieldListRow[i]
                                ['numericKeyboard'] ??
                            false,
                        isUrl:
                            TextFieldList.textFieldListRow[i]['isUrl'] ?? false,
                      ),
                    }
                  ])
                ],
              ),
            )
          ],
        ),
      );
    }

    // Tamanho da impressora
    Widget _nameScaleAndSizePrinter() {
      return GetBuilder<Configcontroller>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Expanded(
                child: CustomFieldDropdownMobile(
                  icon: FontAwesomeIcons.print,
                  options: ListDropdownOption().listOptionsSizePrinter,
                  value: _.tamanhoImpressora.value != ''
                      ? _.tamanhoImpressora.value
                      : 'SEM IMPRESSORA',
                  text: 'Tamanho da Impressora',
                  isSizePrinter: true,
                ),
              )
            ],
          ),
        );
      });
    }

    // Botão de confirmação
    Widget _buttonConfirm() {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          height: 75,
          child: ElevatedButton(
            onPressed: () async {
              if (configController.verificacoes(context) == true) {
              } else {
                configController.confirmarDados(context);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: CustomColors.customContrastColor,
              minimumSize: const Size(300, 50),
            ),
            child: const Text(
              'Confirmar',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
    }

    // Logo da empresa
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/Logo_Nova_Transparente.png',
          width: 250,
        ),
      );
    }

    // Campos de texto do formulário para configuração do sistema
    Widget _textFormFieldsCamp() {
      var size = Get.size;
      return Padding(
        padding: const EdgeInsets.only(right: 11.0),
        child: SizedBox(
          width: size.width * 0.92,
          height: size.height * 0.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _logo(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _textFormFieldsCompany(),
              ),
              _nameScaleAndSizePrinter(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    _buttonConfirm(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    // Botão voltar
    Widget _backButton(String route) {
      return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Get.offNamed(route);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      );
    }

    // Conteiner do conteúdo
    Widget _centerContainer() {
      return Container(
        width: Get.size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: _textFormFieldsCamp(),
      );
    }

    // Scaffold do conteúdo
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _backButton(PagesRoutes.loginRoute),
              _centerContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
