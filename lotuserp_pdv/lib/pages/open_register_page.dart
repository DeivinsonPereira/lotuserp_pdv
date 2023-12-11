import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class OpenRegisterPage extends StatelessWidget {
  const OpenRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Get.find();
    IsarService service = IsarService();
    MovimentRegisterController movimentRegisterController =
        Get.put(MovimentRegisterController());

    var userName = passwordController.userController.text;

    DateTime atualDate = DateTime.now();

    var date = DateFormat('dd/MM/yyyy').format(atualDate);
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(date);
    String hourFormatted = DateFormat('hh:mm').format(atualDate);

    

    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 400,
          width: 450,
          child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 50,
                backgroundColor: CustomColors.customSwatchColor,
                automaticallyImplyLeading: false,
                title: const Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.cashRegister,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Abertura de Caixa:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Container(
                    height: 50,
                    color: Colors.blue,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
            body: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: 450,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 61,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        color: Colors.grey[350],
                                        child: Column(
                                          children: [
                                            Text(
                                              'DATA MOVIMENTO',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: CustomColors
                                                    .customSwatchColor,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              date,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: CustomColors
                                                    .customSwatchColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: 235,
                                        height: 50,
                                        color: Colors.grey[350],
                                        child: Column(
                                          children: [
                                            Text(
                                              'OPERADOR',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: CustomColors
                                                    .customSwatchColor,
                                              ),
                                            ),
                                            Text(
                                              userName,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: CustomColors
                                                    .customSwatchColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: SizedBox(
                                height: 150,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  color: Colors.grey[350],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Positioned(
                                        child: Text(
                                          'VALOR ABERTURA',
                                          style: TextStyle(
                                              height: 3,
                                              color: CustomColors
                                                  .customSwatchColor[900],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                        child: FormWidgets()
                                            .textFieldOpenRegister(
                                                Icons.add,
                                                '0,00',
                                                movimentRegisterController
                                                    .openRegisterController),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      onPressed: () {
                                        movimentRegisterController
                                            .clearOpenRegister();
                                        Get.back();
                                      },
                                      child: const Text(
                                        "VOLTAR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 116, 187, 102),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        movimentRegisterController
                                            .openRegisterValue();
                                        var dadosEmpresa = await service
                                            .getIpEmpresaFromDatabase();

                                        var dadosUsuario =
                                            await service.getUserLogged();
/*
                                        var caixa = Caixa()
                                          ..idEmpresa = dadosEmpresa!.idEmpresa!
                                          ..aberturaIdUser =
                                              dadosUsuario!.idColaborador!
                                          .. aberturaData = dateTime
                                          .. 

                                        late String aberturaHora;
                                        late double aberturaValor;
                                        late int status;
                                        late int fechouIdUser;
                                        late DateTime fechouData;
                                        late String fechouHora;
                                        late double fechouValor;
                                        late int enviado;
                                        late int idCaixaServidor;
*/
                                        movimentRegisterController
                                            .clearOpenRegister();
                                        Get.back();
                                      },
                                      child: const Text(
                                        "CONFIRMAR",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
