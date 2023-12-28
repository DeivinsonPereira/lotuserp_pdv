// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/load_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';

class LoadDataPage extends StatelessWidget {
  const LoadDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    LoadController controller = InjectionDependencies.loadController();
    InjectionDependencies.textFieldController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.5,
        child: Scaffold(
          body: Column(
            children: [
              //cabeçalho
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: size.width,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ícone e texto
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.download,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Carga de Dados',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    //botão de fechar
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              //opções de carregamento
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GetBuilder<LoadController>(
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 110.0),
                            child: Column(
                              children: [
                                _CheckBoxLoadData(
                                  text: 'Dados da Empresa',
                                  checkBoxValue: _.checkbox1.value,
                                  ischeckbox1: true,
                                ),
                                _CheckBoxLoadData(
                                  text: 'Tipos Recebimento',
                                  checkBoxValue: _.checkbox2.value,
                                  ischeckbox2: true,
                                ),
                                _CheckBoxLoadData(
                                  text: 'Usuários',
                                  checkBoxValue: _.checkbox3.value,
                                  ischeckbox3: true,
                                ),
                                _CheckBoxLoadData(
                                  text: 'CARGA GERAL DE PRODUTOS',
                                  checkBoxValue: _.checkbox4.value,
                                  ischeckbox4: true,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //botões voltar e confirmar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //botão voltar
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'VOLTAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  //botão confirmar
                  Expanded(
                    child: Container(
                      color: CustomColors.confirmButtonColor,
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          controller.loadData();
                          Get.back();
                        },
                        child: const Text('CONFIRMAR',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Checkbox para selecionar o carregamento de dados
class _CheckBoxLoadData extends StatelessWidget {
  final String text;
  final bool checkBoxValue;
  final bool ischeckbox1;
  final bool ischeckbox2;
  final bool ischeckbox3;
  final bool ischeckbox4;

  const _CheckBoxLoadData({
    Key? key,
    required this.text,
    required this.checkBoxValue,
    this.ischeckbox1 = false,
    this.ischeckbox2 = false,
    this.ischeckbox3 = false,
    this.ischeckbox4 = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<LoadController>();

    //logica para marcar e desmarcar os checkbox
    void logic(LoadController _) {
      if (ischeckbox1 == true) {
        _.updateCheckBox(ischeckbox1: true);
      }

      if (ischeckbox2 == true) {
        _.updateCheckBox(ischeckbox2: true);
      }

      if (ischeckbox3 == true) {
        _.updateCheckBox(ischeckbox3: true);
      }

      if (ischeckbox4 == true) {
        _.updateCheckBox(ischeckbox4: true);
      }
    }

    return GetBuilder<LoadController>(
      builder: (_) {
        return InkWell(
          onTap: () {
            logic(_);
          },
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: checkBoxValue,
                onChanged: (value) {
                  logic(_);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
