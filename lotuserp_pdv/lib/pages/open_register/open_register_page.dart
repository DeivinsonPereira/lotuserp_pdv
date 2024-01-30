import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/repositories/open_register_servidor_repository.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../controllers/response_servidor_controller.dart';
import '../../services/dependencies.dart';
import '../common/header_popup.dart';

class OpenRegisterPage extends StatelessWidget {
  const OpenRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Dependencies.passwordController();
    MovimentRegisterController movimentRegisterController =
        Dependencies.movimentRegisterController();
    InformationController informationController =
        Dependencies.informationController();
    IsarService service = IsarService();

    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();

    var userName = passwordController.userController.text;

    tz.initializeTimeZones();
    var atualDate = DateTime.now();
    var formattedDate = DateFormat('dd/MM/yyyy').format(atualDate);

    var saoPauloTimeZone = tz.getLocation('America/Sao_Paulo');
    var saoPauloDateTime = tz.TZDateTime.from(atualDate, saoPauloTimeZone);
    var hourFormatted = DateFormat('HH:mm:ss').format(saoPauloDateTime);

    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 400,
          width: 450,
          child: Scaffold(
            body: Column(
              children: [
                //Cabeçalho
                const HeaderPopup(
                    text: 'Abrir caixa', icon: FontAwesomeIcons.cashRegister),

                //Corpo do dialog
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 290,
                        width: 450,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
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
                                                formattedDate,
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: SizedBox(
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[350],
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'VALOR ABERTURA',
                                          style: TextStyle(
                                              height: 3,
                                              color: CustomColors
                                                  .customSwatchColor[900],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Botões voltar e confirmar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          movimentRegisterController.clearOpenRegister();
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
                          backgroundColor: CustomColors.confirmButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () async {
                          movimentRegisterController.openRegisterValue();
                          var dadosEmpresa =
                              await service.getIpEmpresaFromDatabase();

                          var dadosUsuario = await service.getUserLogged();

                          double openRegisterDouble =
                              movimentRegisterController.openRegisterToDouble();

                          bool caixaExistente = await service
                              .checkUserCaixa(dadosUsuario!.id_user!);

                          var atualDateFormatted =
                              DatetimeFormatterWidget.formatDate(atualDate);

                          await OpenRegisterServidorRepository()
                              .openRegisterServidor(
                                  dadosEmpresa!.id_empresa!,
                                  dadosUsuario.id_user!,
                                  atualDateFormatted,
                                  hourFormatted,
                                  openRegisterDouble);

                          caixa caixas = caixa()
                            ..id_empresa = dadosEmpresa.id_empresa!
                            ..abertura_id_user = dadosUsuario.id_user!
                            ..abertura_data = atualDate
                            ..abertura_hora = hourFormatted
                            ..abertura_valor = openRegisterDouble
                            ..status = 0
                            ..fechou_id_user = null
                            ..fechou_data = null
                            ..fechou_hora = null
                            ..enviado = 0
                            ..id_caixa_servidor =
                                responseServidorController.openRegisterId.value;
                          if (openRegisterDouble > 0.00) {
                            await service.insertCaixaWithCaixaItem(caixas,
                                atualDate, hourFormatted, openRegisterDouble, dadosUsuario.id_user!);
                            movimentRegisterController.clearOpenRegister();

                            Get.back();
                          } else if (openRegisterDouble == 0.00 &&
                              !caixaExistente) {
                            service.insertCaixa(caixas);
                            movimentRegisterController.clearOpenRegister();
                            informationController.searchCaixaId();
                            Get.back();
                          } else if (caixaExistente) {
                            Get.snackbar(
                              'Atenção',
                              'Ja existe um caixa aberto para este usuário.',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
