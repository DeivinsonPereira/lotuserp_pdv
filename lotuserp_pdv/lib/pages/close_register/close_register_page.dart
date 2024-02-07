// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/caixa_fechamento.dart';

import 'package:lotuserp_pdv/controllers/close_register_controller.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/global_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/tipo_recebimento.dart';
import '../../repositories/close_register_servidor_repository.dart';
import '../../services/dependencies.dart';
import '../common/header_popup.dart';
import '../printer/printer_popup.dart';

class CloseRegisterPage extends StatelessWidget {
  const CloseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    IsarService service = IsarService();

    CloseRegisterController controller = Dependencies.closeRegisterController();

    PrinterController printerController = Dependencies.printerController();
    printerController.setPrinterSize();

    PdvController pdvController = Dependencies.pdvController();

    GlobalController globalController = Dependencies.globalController();

    Configcontroller configcontroller = Dependencies.configcontroller();

    // botões confirmar e voltar
    Widget backAndConfirmButtons() {
      return Row(
        children: [
          //voltar
          Expanded(
            child: Container(
              color: Colors.grey,
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

          //Confirmar
          Expanded(
            child: Obx(
              () => Container(
                  color: controller.isButtonEnabled.value == false
                      ? Colors.grey[300]
                      : CustomColors.confirmButtonColor,
                  child: TextButton(
                    onPressed: controller.isButtonEnabled.value == true
                        ? () async {
                            controller.toggleIsButtonEnabled();
                            var atualDateFormatted =
                                DatetimeFormatterWidget.formatDate(
                                    DateTime.now());

                            await globalController
                                .setIdCaixaServidor(globalController.userId);
                            var idCaixaServidor =
                                globalController.idCaixaServidor;
                            List<caixa_fechamento> fechamentosCaixa = [];

                            for (var i = 0;
                                i < controller.closeRegister.length;
                                i++) {
                              var values = controller.closeRegister[i]
                                      ['value'] =
                                  double.parse(controller
                                      .textControllers[i].text
                                      .replaceAll('.', '')
                                      .replaceAll(',', '.'));

                              caixa_fechamento caixaFechamento =
                                  caixa_fechamento()
                                    ..id_caixa = pdvController.caixaId.value
                                    ..id_tipo_recebimento =
                                        controller.dataOfTipoPagamento![i]
                                    ..valor_informado = values;

                              fechamentosCaixa.add(caixaFechamento);
                            }
                            await CloseRegisterServidorRepository()
                                .closeRegisterServidor(atualDateFormatted,
                                    idCaixaServidor, fechamentosCaixa);

                            var tamanhoImpressora =
                                configcontroller.tamanhoImpressora.value;

                            if (tamanhoImpressora != 'SEM IMPRESSORA') {
                              var printerPopupController =
                                  Dependencies.printerPopupController();
                              printerPopupController.isButtonEnabled.value =
                                  true;
                              await Get.dialog(
                                PrinterPopup(onPrint: () async {
                                  printerPopupController.toggleButton();
                                  await printerController
                                      .printCloseCaixa(fechamentosCaixa);
                                  Get.back();
                                }),
                              );
                            }
                            await service
                                .insertCaixaFechamento(fechamentosCaixa);
                            await service.deleteCartaoItem();
                            Get.back();
                          }
                        : null,
                    child: Text(
                      'CONFIRMAR',
                      style: TextStyle(
                        color: controller.isButtonEnabled.value == false
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      );
    }

    // teclado
    Widget keyboardOnDialog() {
      return GetBuilder<CloseRegisterController>(builder: (_) {
        return Column(
          children: [
            Row(
              children: [
                BuildNumberButtom(
                    textInformed: '1',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '2',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '3',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                BuildNumberButtom(
                    textInformed: '4',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '5',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '6',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                BuildNumberButtom(
                    textInformed: '7',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '8',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '9',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                BuildNumberButtom(
                    textInformed: '00',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BuildNumberButtom(
                    textInformed: '0',
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
                BackSpaceIcon(
                    setSelectedTextFieldIndex: _.selectedTextFieldIndex.value),
              ],
            ),
          ],
        );
      });
    }

    //tipos de pagamentos
    Widget tiposPagamentos(int index, List<tipo_recebimento> data) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        height: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data[index].descricao!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    //Campo dos textfield que os usuarios vão digitar
    Widget valoresDigitados(int index, List<tipo_recebimento> data) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        height: 50,
        child: TextField(
          readOnly: true,
          onTap: () {
            controller.setSelectedTextFieldIndex(index);
          },
          textAlign: TextAlign.end,
          controller: controller.textControllers[index],
          keyboardType: TextInputType.none,
          maxLines: 1,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              controller.updateCloseRegister(value, data[index].descricao!);
            }
          },
        ),
      );
    }

    // lista de pagamentos e informações p/ usuario preencher
    Widget listPayments() {
      return SizedBox(
        height: size.height * 0.545,
        width: size.width,
        child: Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            //Teclado
            keyboardOnDialog(),

            //Espaço entre o teclado e a lista
            const SizedBox(
              width: 75,
            ),

            //lista de recebimentos
            Expanded(
              child: SizedBox(
                child: StreamBuilder(
                    stream: service.listenTipo_recebimento(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Text');
                      }
                      if (snapshot.hasError) {
                        return const Text('Text');
                      }
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        return ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            if (data.length <=
                                controller.textControllers.length) {
                            } else {
                              controller.createControllers(
                                  index, data[index].descricao!);
                              controller.dataOfTipoPagamento!
                                  .add(data[index].id);
                            }
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    // tipos de pagamentos
                                    Expanded(
                                        flex: 4,
                                        child: tiposPagamentos(index, data)),

                                    //valores
                                    Expanded(
                                        flex: 3,
                                        child: valoresDigitados(index, data)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
          ],
        ),
      );
    }

    // Corpo / informações
    Widget bodyContent() {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Data Abertura caixa
                    CointainersInformation(
                      size: size,
                      sizeWidth: 0.3,
                      text: 'DATA ABERTURA',
                      isAbertura: true,
                    ),

                    // Usuario logado
                    CointainersInformation(
                      size: size,
                      sizeWidth: 0.275,
                      text: 'USUARIO',
                      isUsuario: true,
                    ),

                    // Numero do caixa
                    CointainersInformation(
                      size: size,
                      sizeWidth: 0.2,
                      text: 'ID CAIXA',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: listPayments(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Criação da tela (inicio)
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.8,
          child: Column(
            children: [
              // cabeçalho
              HeaderPopup(
                  text: 'Fechar Caixa', icon: FontAwesomeIcons.cashRegister),

              // corpo
              bodyContent(),

              // botões voltar e confirmar
              backAndConfirmButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

// icone backEspace do teclado.. apaga os numeros digitados
class BackSpaceIcon extends StatelessWidget {
  BackSpaceIcon({
    Key? key,
    required this.setSelectedTextFieldIndex,
  }) : super(key: key);

  final int setSelectedTextFieldIndex;

  CloseRegisterController controller = Dependencies.closeRegisterController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 37,
      child: InkWell(
        onTap: () {
          controller.removeNumbers(setSelectedTextFieldIndex);
        },
        child: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
      ),
    );
  }
}

// teclado botoes
class BuildNumberButtom extends StatelessWidget {
  BuildNumberButtom({
    Key? key,
    required this.textInformed,
    required this.setSelectedTextFieldIndex,
  }) : super(key: key);

  final String textInformed;
  final int setSelectedTextFieldIndex;

  CloseRegisterController controller = Dependencies.closeRegisterController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CloseRegisterController>(
      builder: (_) {
        return InkWell(
          onTap: () {
            _.textControllers[setSelectedTextFieldIndex].text += textInformed;
            _.updateCloseRegister(textInformed,
                _.closeRegister[setSelectedTextFieldIndex]['tipo']);
          },
          child: SizedBox(
            width: 100,
            child: Center(
              child: Text(
                textInformed,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
        );
      },
    );
  }
}

//caixa de informações parte superior do contúdo
class CointainersInformation extends StatelessWidget {
  CointainersInformation({
    Key? key,
    required this.size,
    required this.sizeWidth,
    required this.text,
    this.isAbertura = false,
    this.isUsuario = false,
  }) : super(key: key);

  final Size size;
  final double sizeWidth;
  final String text;
  bool isAbertura;
  bool isUsuario;

  @override
  Widget build(BuildContext context) {
    SideBarController controller = Dependencies.sidebarController();
    PasswordController passwordController = Dependencies.passwordController();
    CloseRegisterController closeRegisterController =
        Dependencies.closeRegisterController();

    return Container(
      height: 55,
      width: size.width * sizeWidth,
      color: Colors.grey[400],
      child: Column(children: [
        Container(
          height: 20,
          width: double.infinity,
          color: CustomColors.customSwatchColor,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        isAbertura
            ? Obx(
                () => Text(
                  controller.dataAbertura.value,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customSwatchColor),
                ),
              )
            : isUsuario
                ? Text(
                    passwordController.userController.text,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor),
                  )
                : Obx(() => Text(
                      closeRegisterController.caixaId
                          .toString()
                          .padLeft(6, '0'),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor),
                    ))
      ]),
    );
  }
}
