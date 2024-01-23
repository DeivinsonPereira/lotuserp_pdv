// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/text_field_list.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/injection_dependencies.dart';
import 'widget/custom_field_dropdown.dart';
import 'widget/custom_text_form_field.dart';
import 'widget/list_dropdown_option.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextFieldController textFieldController = Dependencies.textFieldController();
  Configcontroller configController = Dependencies.configcontroller();
  IsarService service = IsarService();

  @override
  Widget build(BuildContext context) {
    // Campos de configuração da empresa
    Widget _textFormFieldsCompany() {
      return Form(
        child: Column(
          children: [
            CustomTextFormField(
                icon: TextFieldList.textFieldUrl['icon'],
                controller: TextFieldList.textFieldUrl['controller'],
                variableName: TextFieldList.textFieldUrl['label'],
                useIconButton:
                    TextFieldList.textFieldUrl['useIconButton'] ?? false,
                isUrl: TextFieldList.textFieldUrl['isUrl'] ?? false),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(children: [
                for (var i = 0;
                    i < TextFieldList.textFieldListRow.length;
                    i++) ...{
                  //Campos de texto de configuração do PDV
                  CustomTextFormField(
                    icon: TextFieldList.textFieldListRow[i]['icon'],
                    controller: TextFieldList.textFieldListRow[i]['controller'],
                    variableName: TextFieldList.textFieldListRow[i]['label'],
                    useIconButton: TextFieldList.textFieldListRow[i]
                            ['useIconButton'] ??
                        false,
                    numericKeyboard: TextFieldList.textFieldListRow[i]
                            ['numericKeyboard'] ??
                        false,
                    isUrl: TextFieldList.textFieldListRow[i]['isUrl'] ?? false,
                  ),
                }
              ]),
            )
          ],
        ),
      );
    }

    // Campo balança e TEF
    Widget _dropdownBalanceAndTef() {
      return GetBuilder<Configcontroller>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20),
            child: Row(
              children: [
                CustomFieldDropdown(
                    options: ListDropdownOption.listOptionsBalance,
                    text: 'Balança',
                    icon: Icons.balance,
                    value: _.balanca.value,
                    isBalance: true),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: CustomFieldDropdown(
                      options: ListDropdownOption.listOptionsTef,
                      text: 'TEF',
                      icon: Icons.credit_card,
                      value: _.tef.value),
                ),
              ],
            ),
          );
        },
      );
    }

    //campos de texto do formulário para configuração do sistema
    Widget _textFormFieldsCamp() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _textFormFieldsCompany(),
          ),
          _dropdownBalanceAndTef(),
        ],
      );
    }

    //botão voltar
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

    //Botão de configurar impressora
    Widget _buttonConfigPrinter() {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Get.toNamed(PagesRoutes.printerPageRoute);
          },
          icon: const Icon(
            Icons.print,
            color: Colors.white,
            size: 40,
          ),
          label: const Text(
            'Configurar Impressora',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(300, 50),
              backgroundColor: CustomColors.customSwatchColor),
        ),
      );
    }

    //Botão de confirmação
    Widget _buttonConfirm() {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ElevatedButton(
          onPressed: () async {
            if (configController.verificacoes() == true) {
            } else {
              configController.confirmarDados();
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
      );
    }

    //Conteúdo do lado direito
    Widget _contentRight() {
      var size = MediaQuery.of(context).size;

      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/Logo_Nova_Transparente.png',
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              _buttonConfirm(),
              _buttonConfigPrinter(),
            ],
          ),
        ),
      );
    }

    //Conteiner do conteúdo
    Widget _centerContainer() {
      return Container(
        width: Get.size.width * 0.83,
        height: Get.size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _textFormFieldsCamp(),
            ),
            Expanded(
              flex: 1,
              child: _contentRight(),
            ),
          ],
        ),
      );
    }

    //Scaffold do conteúdo
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _backButton(PagesRoutes.loginRoute),
            const SizedBox(
              height: 75,
            ),
            _centerContainer(),
          ],
        ),
      ),
    );
  }
}
