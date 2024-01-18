import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/text_field_list.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/injection_dependencies.dart';
import 'widget/custom_text_form_field.dart';

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
    //campos de texto do formulário para configuração do sistema
    Widget textFormFieldsCamp() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Column(
              children: [
                for (var i = 0;
                    i < TextFieldList.textFieldList.length;
                    i++) ...{
                  //Campos de texto de configuração do PDV
                  CustomTextFormField(
                    icon: TextFieldList.textFieldList[i]['icon'],
                    controller: TextFieldList.textFieldList[i]['controller'],
                    variableName: TextFieldList.textFieldList[i]['label'],
                    useIconButton: TextFieldList.textFieldList[i]
                            ['useIconButton'] ??
                        false,
                    numericKeyboard: TextFieldList.textFieldList[i]
                            ['numericKeyboard'] ??
                        false,
                  ),
                }
              ],
            ),
          ),
        ],
      );
    }

    //botão voltar
    Widget backButton(String route) {
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

    //Botão de confirmação
    Widget buttonConfirm() {
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (configController.verificacoes() == true) {
                    } else {
                      configController.confirmarDados();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors
                        .customContrastColor, // Define a cor de fundo como amarelo
                    minimumSize:
                        const Size(300, 50), // Define a largura mínima como 200
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
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
                      minimumSize: const Size(300, 50),
                      backgroundColor: CustomColors.customSwatchColor),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //Conteiner do conteúdo
    Widget centerContainer() {
      return Container(
        width: 1100,
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: textFormFieldsCamp(),
            ),
            Expanded(
              flex: 1,
              child: buttonConfirm(),
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
            backButton(PagesRoutes.loginRoute),
            const SizedBox(
              height: 75,
            ),
            centerContainer(),
          ],
        ),
      ),
    );
  }
}
