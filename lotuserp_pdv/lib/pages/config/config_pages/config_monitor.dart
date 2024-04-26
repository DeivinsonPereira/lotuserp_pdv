// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/widget/text_field_list.dart';

import '../../../services/dependencies.dart';
import '../../common/custom_logo.dart';
import 'widget/custom_field_dropdown.dart';
import 'widget/custom_field_dropdown_color.dart';
import 'widget/custom_text_form_field.dart';
import 'widget/list_dropdown_option.dart';

class ConfigMonitor extends StatefulWidget {
  const ConfigMonitor({super.key});

  @override
  State<ConfigMonitor> createState() => _ConfigMonitorState();
}

class _ConfigMonitorState extends State<ConfigMonitor> {
  TextFieldController textFieldController = Dependencies.textFieldController();
  Configcontroller configController = Dependencies.configcontroller();
  var logoController = Dependencies.logoController();

  @override
  Widget build(BuildContext context) {
    // Campos de configuração da empresa
    Widget _textFormFieldsCompany() {
      return Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomTextFormFieldMonitor(
                  icon: TextFieldList.textFieldUrl['icon'],
                  controller: TextFieldList.textFieldUrl['controller'],
                  variableName: TextFieldList.textFieldUrl['label'],
                  useIconButton:
                      TextFieldList.textFieldUrl['useIconButton'] ?? false,
                  isUrl: TextFieldList.textFieldUrl['isUrl'] ?? false),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(children: [
                for (var i = 0;
                    i < TextFieldList.textFieldListRow.length;
                    i++) ...{
                  //Campos de texto de configuração do PDV
                  CustomTextFormFieldMonitor(
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
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: CustomFieldDropdownMonitor(
                          options: ListDropdownOption().listOptionsBalance,
                          text: 'Balança',
                          icon: FontAwesomeIcons.scaleBalanced,
                          value: _.balanca.value,
                          isBalance: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 2),
                      child: CustomTextFormFieldMonitor(
                        icon: FontAwesomeIcons.gaugeHigh,
                        controller:
                            textFieldController.velocidadeBalancaController,
                        variableName: 'Vel. Balança',
                        numericKeyboard: true,
                        isSpeed: true,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: CustomFieldDropdownMonitor(
                            options: ListDropdownOption().listOptionsTef,
                            text: 'TEF',
                            icon: FontAwesomeIcons.solidCreditCard,
                            value: _.tef.value,
                            isTef: true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    //nome da balança e tamanho da impressora e cor do background
    Widget _nameScaleAndSizePrinterAndColor() {
      return GetBuilder<Configcontroller>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 7, 0),
                child: CustomFieldDropdownMonitor(
                  options: configController.devicesManufacturer,
                  text: 'Nome da Balança',
                  icon: FontAwesomeIcons.usb,
                  value: _.deviceNameSelected.value,
                  isBalanceName: true,
                ),
              ),

              /* Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 2, right: 7),
                child: CustomTextFormFieldMonitor(
                  icon: FontAwesomeIcons.usb,
                  controller: textFieldController.nomeBalancaController,
                  variableName: 'Nome Balança',
                  numericKeyboard: false,
                  isNome: true,
                ),
              ),*/
              Expanded(
                child: CustomFieldDropdownMonitor(
                  icon: FontAwesomeIcons.print,
                  options: ListDropdownOption().listOptionsSizePrinter,
                  value: _.tamanhoImpressora.value != ''
                      ? _.tamanhoImpressora.value
                      : 'SEM IMPRESSORA',
                  text: 'Tamanho da Impres...',
                  isSizePrinter: true,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomFieldDropdownColor(
                  text: 'Cor do Fundo',
                  value: _.colorBackground['name'] as String,
                  options: List<String>.from(ListDropdownOption()
                      .listColors
                      .map((color) => color['name'] as String)),
                ),
              )
            ],
          ),
        );
      });
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
          _nameScaleAndSizePrinterAndColor(),
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
                child: CustomLogo().getLogoPadrao(width: 250, height: 87),
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
              flex: 3,
              child: _textFormFieldsCamp(),
            ),
            Expanded(
              flex: 2,
              child: _contentRight(),
            ),
          ],
        ),
      );
    }

    //Scaffold do conteúdo
    return GetBuilder<Configcontroller>(
      builder: (_) {
        return Scaffold(
          backgroundColor: _.colorBackground['color'] as Color,
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
      },
    );
  }
}
