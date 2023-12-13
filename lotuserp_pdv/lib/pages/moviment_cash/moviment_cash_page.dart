import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/caixa_controller.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/moviment_cash/components/custom_text_tipo.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'components/custom_text_descricao.dart';
import 'components/custom_text_forma.dart';

class MovimentCashPage extends StatelessWidget {
  const MovimentCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Get.find();
    var userName = passwordController.userController.text;

    MovimentRegisterController movimentRegisterController =
        Get.put(MovimentRegisterController());

    tz.initializeTimeZones();
    var atualDate = DateTime.now();
    var formattedDate = DateFormat('dd/MM/yyyy').format(atualDate);
    var saoPauloTimeZone = tz.getLocation('America/Sao_Paulo');
    var saoPauloDateTime = tz.TZDateTime.from(atualDate, saoPauloTimeZone);
    var hourFormatted = DateFormat('HH:mm:ss').format(saoPauloDateTime);
    // ignore: unused_local_variable
    var parsedDateTime = DateFormat('HH:mm:ss').parse(hourFormatted);

    CaixaController caixaController = Get.put(CaixaController());

    return SingleChildScrollView(
      child: Dialog(
        child: SizedBox(
          height: 460,
          width: 610,
          child: Scaffold(
            //appBar
            appBar: AppBar(
                toolbarHeight: 50,
                backgroundColor: CustomColors.customSwatchColor,
                automaticallyImplyLeading: false,
                title: const Row(
                  children: [
                    //title do appBar
                    Row(
                      children: [
                        //icone prefixo
                        Icon(
                          FontAwesomeIcons.cashRegister,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),

                        //texto abertura de caixa
                        Text(
                          'Sangria / Suprimento de Caixa',
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

                //actions appBar (botão fechar)
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

            //corpo
            body: Column(
              children: [
                Column(
                  children: [
                    //Container superior
                    SizedBox(
                      height: 410,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Data do movimento
                                Container(
                                  width: 250,
                                  height: 50,
                                  color: Colors.grey[350],
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        color: CustomColors.customSwatchColor,
                                        child: const Center(
                                          child: Text(
                                            'DATA MOVIMENTO',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: CustomColors.customSwatchColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),

                                // Nome do Operador
                                Container(
                                  width: 250,
                                  height: 50,
                                  color: Colors.grey[350],
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        color: CustomColors.customSwatchColor,
                                        child: const Center(
                                          child: Text(
                                            'OPERADOR',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        userName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: CustomColors.customSwatchColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Número do caixa
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: SizedBox(
                                    height: 65,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 2.0, bottom: 8.0),
                                      child: Container(
                                        color: Colors.grey[350],
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              color: CustomColors
                                                  .customSwatchColor,
                                              child: const Center(
                                                child: Text(
                                                  'CAIXA',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                caixaController.idCaixa.value,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: CustomColors
                                                        .customSwatchColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //tipo de movimentação
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 1, left: 8.0, bottom: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.grey[350],
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              'TIPO: ',
                                              style: TextStyle(
                                                color: CustomColors
                                                    .customSwatchColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomTextTipo(
                                              controller:
                                                  movimentRegisterController
                                                      .tipoDeMovimentoController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  width: 270,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 1, right: 8.0, bottom: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.grey[350],
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              'FORMA: ',
                                              style: TextStyle(
                                                color: CustomColors
                                                    .customSwatchColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: CustomTextForma(
                                                  controller:
                                                      movimentRegisterController
                                                          .formaDePagamentoController)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //valor da movimentação
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 250,
                              color: Colors.grey[350],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DESCRIÇÃO',
                                        style: TextStyle(
                                          color: CustomColors.customSwatchColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      CustomTextDescricao()
                                    ],
                                  ),
                                  Text(
                                    'VALOR MOVIMENTAÇÃO',
                                    style: TextStyle(
                                        height: 3,
                                        color:
                                            CustomColors.customSwatchColor[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: FormWidgets().textFieldOpenRegister(
                                        Icons.add,
                                        '0,00',
                                        movimentRegisterController
                                            .openRegisterController),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //botões Voltar e Confirmar
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              color: Colors.black,
                              child: Expanded(
                                flex: 1,
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
                                              const Color(0xFF86C337),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        onPressed: () async {
                                          
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
