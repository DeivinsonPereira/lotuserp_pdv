import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/moviment_cash/component/custom_text_tipo.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../services/injection_dependencies.dart';
import '../common/header_popup.dart';
import 'component/custom_text_descricao.dart';
import 'component/custom_text_forma.dart';

class MovimentCashPage extends StatefulWidget {
  const MovimentCashPage({super.key});

  @override
  State<MovimentCashPage> createState() => _MovimentCashPageState();
}

class _MovimentCashPageState extends State<MovimentCashPage> {
  IsarService service = IsarService();
  late DateTime dataAbertura = DateTime.now();
  late int idCaixa = 0;

  @override
  void initState() {
    super.initState();
    inicializarDataAbertura();
    inicializarGetIdCaixa();
  }

  Future<void> inicializarDataAbertura() async {
    var userId = await getIdUser();
    DateTime? date = await getDate(userId!);
    if (date != null) {
      setState(() {
        dataAbertura = date;
      });
    }
  }

  Future<int?> getIdUser() async {
    var user = await service.getUserLogged();

    if (user != null) {
      return user.id_user;
    }
    return null;
  }

  Future<DateTime?> getDate(int idUser) async {
    var data = await service.getDateCaixa(idUser);

    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  //encontra o id do caixa referente ao usuario logado
  Future<void> inicializarGetIdCaixa() async {
    var userId = await getIdUser();
    int? caixa = await getIdCaixa(userId!);
    if (caixa != null) {
      setState(() {
        idCaixa = caixa;
      });
    }
  }

  Future<int?> getIdCaixa(int idUser) async {
    int? idCaixa = await service.getCaixaIdWithIdUserAndStatus0();

    if (idCaixa != null) {
      return idCaixa;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController =
        InjectionDependencies.passwordController();

    MovimentRegisterController movimentRegisterController =
        InjectionDependencies.movimentRegisterController();

    InjectionDependencies.caixaController();

    var userName = passwordController.userController.text;
    tz.initializeTimeZones();
    var atualDate = DateTime.now();

    var formattedDateAberturaCaixa =
        DateFormat('dd/MM/yyyy').format(dataAbertura);
    var saoPauloTimeZone = tz.getLocation('America/Sao_Paulo');
    var saoPauloDateTime = tz.TZDateTime.from(atualDate, saoPauloTimeZone);
    var hourFormatted = DateFormat('HH:mm:ss').format(saoPauloDateTime);

    return SingleChildScrollView(
      child: Dialog(
        child: SizedBox(
          height: 460,
          width: 610,
          child: Scaffold(
            body: Column(
              children: [
                // cabeçalho
                const HeaderPopup(
                    text: 'Sangria / Suprimento de Caixa',
                    icon: FontAwesomeIcons.moneyBillTransfer),

                //corpo
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Data da Abertura
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
                                            'DATA ABERTURA',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        formattedDateAberturaCaixa.toString(),
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
                                            Text(
                                              idCaixa
                                                  .toString()
                                                  .padLeft(6, '0'),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: CustomColors
                                                      .customSwatchColor,
                                                  fontWeight: FontWeight.bold),
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

                          //tipo e forma de movimentação
                          Row(
                            children: [
                              //tipo de movimentação
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

                              //forma de pagamento
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

                          //Descrição e valor da movimentação
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 247,
                              color: Colors.grey[350],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //descrição
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
                                      CustomTextDescricao(
                                          controller: movimentRegisterController
                                              .descriptionController)
                                    ],
                                  ),

                                  //valor da movimentação
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'VALOR MOVIMENTAÇÃO',
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
                                                    .movimentRegisterController),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //botões Voltar e Confirmar
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Voltar
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
                            movimentRegisterController.clearMovimentRegister();
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

                      //Confirmar
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF86C337),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed: () async {
                            double movimentRegisterDouble =
                                movimentRegisterController
                                    .movimentRegisterToDouble();

                            caixa_item caixaItem = caixa_item()
                              ..id_caixa = idCaixa
                              ..descricao = movimentRegisterController
                                  .descriptionController.text
                              ..data = DateTime.now()
                              ..hora = hourFormatted
                              ..id_tipo_recebimento =
                                  movimentRegisterController.formaPagamentoId
                              ..valor_cre = movimentRegisterController
                                          .tipoDeMovimentoController.text ==
                                      'CREDITO'
                                  ? movimentRegisterDouble
                                  : 0
                              ..valor_deb = movimentRegisterController
                                          .tipoDeMovimentoController.text ==
                                      'DEBITO'
                                  ? movimentRegisterDouble
                                  : 0
                              ..id_venda = 0
                              ..enviado = 0;

                            service.insertCaixaItem(caixaItem);

                            movimentRegisterController.clearMovimentRegister();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
