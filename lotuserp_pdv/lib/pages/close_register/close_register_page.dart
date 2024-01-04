// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/close_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/side_bar_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../common/header_popup.dart';
import '../common/injection_dependencies.dart';

class CloseRegisterPage extends StatelessWidget {
  const CloseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    IsarService service = IsarService();

    CloseRegisterController controller =
        InjectionDependencies.closeRegisterController();

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
            child: Container(
              color: CustomColors.confirmButtonColor,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    // lista de pagamentos e informações p/ usuario preencher
    Widget listPayments() {
      return SizedBox(
        height: size.height * 0.545,
        width: size.width,
        child: Row(
          children: [
            //Teclado
            const Column(
              children: [
                Row(
                  children: [
                    BuildNumberButtom(text: '1'),
                    BuildNumberButtom(text: '2'),
                    BuildNumberButtom(text: '3'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    BuildNumberButtom(text: '4'),
                    BuildNumberButtom(text: '5'),
                    BuildNumberButtom(text: '6'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    BuildNumberButtom(text: '7'),
                    BuildNumberButtom(text: '8'),
                    BuildNumberButtom(text: '9'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    BuildNumberButtom(text: '00'),
                    BuildNumberButtom(text: '0'),
                    BackSpaceIcon(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 75,
            ),
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
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    // tipos de pagamentos
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
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
                                      ),
                                    ),

                                    //valores
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        height: 50,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller
                                                  .updateCloseRegister(value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
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
                      text: 'NÚMERO CAIXA',
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
              const HeaderPopup(
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
  const BackSpaceIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 37,
      child: InkWell(
        onTap: () {
          /*  controller.checkbox1.value
              ? controller.removeNumberDiscount()
              : controller.removeNumberDiscountCb2();*/
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
  const BuildNumberButtom({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*controller.checkbox1.value
            ? controller.addNumberDiscount(number)
            : controller.addPercentageDiscount(number);*/
      },
      child: SizedBox(
        width: 100,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
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
    SideBarController controller = InjectionDependencies.sidebarController();
    PdvController pdvController = InjectionDependencies.pdvController();
    PasswordController passwordController =
        InjectionDependencies.passwordController();

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
            ? Text(
                controller.dataAbertura.value,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.customSwatchColor),
              )
            : isUsuario
                ? Text(
                    passwordController.userController.text,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor),
                  )
                : Text(
                    pdvController.caixaId.value.toString().padLeft(6, '0'),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor),
                  )
      ]),
    );
  }
}
