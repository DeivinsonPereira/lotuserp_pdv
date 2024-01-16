import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/global_widget/buttons.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';
import 'package:lotuserp_pdv/pages/common/format_numbers.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/pages/payment/component/confirm_buttom.dart';
import 'package:lotuserp_pdv/pages/payment/component/dialog_payment_widget.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/tef_elgin_service.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late NumberFormat formatoBrasileiro;

  void pushSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PdvController controller = InjectionDependencies.pdvController();
    PaymentController paymentController =
        InjectionDependencies.paymentController();
    IsarService service = IsarService();
    InjectionDependencies.informationController();
    var paymentCount = 0.0;

    var remainingValue = 0.0;

    var ramainingValueCb2 = 0.0;

    var size = MediaQuery.of(context).size;

    Logger logger = Logger();

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    Future<void> processTefPayment(Map<String, dynamic> payment) async {
      String paymentType = payment['nome'];
      String valorTransacao = payment['valor'];
      String paymentId = payment['id'];

      try {
        // Formata o valor para centavos
        String valorFormatado =
            valorTransacao.replaceAll(RegExp(r'[.,]'), '');

        // Prepara os parâmetros para a chamada TEF
        Map<String, String> tefParams = {
          'funcao': paymentType == 'TEF DEBITO'
              ? 'debito'
              : paymentType == 'TEF CREDITO'
                  ? 'credito'
                  : 'pix',
          'valor': valorFormatado,
          // Adicione outros parâmetros necessários
        };

        if (paymentType == 'TEF CREDITO') {
          tefParams['parcelas'] =
              paymentController.installments.value.toString();
          tefParams['financiamento'] = '1';
        }

        var valueDouble = FormatNumbers.formatStringToDouble(valorTransacao);

        // Chama o serviço TEF
        String? tefResponseJson = await TefService.startTef(
            tefParams, valueDouble, paymentController.installments.toString());
        if (tefResponseJson == null) throw 'Resposta do TEF nula';
        Map<String, dynamic> tefResponse = jsonDecode(tefResponseJson);
        if (tefResponse['COMP_DADOS_CONF'] != null) {
          Map<String, dynamic> compDadosConf =
              jsonDecode(tefResponse['COMP_DADOS_CONF']);
          if (compDadosConf['mensagem'] == 'Transacao aprovada') {
            paymentController.updatePaymentStatus(paymentId, true);
          } else {
            throw 'Erro na transação TEF: ${compDadosConf['mensagem']}';
          }
          if (tefParams['funcao'] == 'credito') {
            Get.back();
          }
        } else {
          throw 'Resposta do TEF inválida';
        }
      } catch (e) {
        Get.snackbar(
          'Erro',
          'Erro na transação TEF: Operação cancelada',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        // Trata o erro
        logger.e('Erro durante a transação TEF: $e');
      }
    }

    // Dialog para escolher numero de parcelas
    Widget choiceNumbersOfInstallments(Map<String, dynamic> payment) {
      return Dialog(
        alignment: Alignment.topCenter,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 300,
          width: 400,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: CustomColors.customSwatchColor,
                child: const Center(
                  child: Text(
                    'Parcelas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26),
                  ),
                ),
              ),

              //Conteúdo
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Informativo
                    const Text(
                      'DIGITE O NÚMERO DE PARCELAS',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 250,

                      //Caixa de texto
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return paymentController.installments.value = '';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: paymentController.paymentControllerText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.bookmarks_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          paymentController.paymentControllerText.clear();
                          paymentController.clearInstallments();
                          Get.back();
                        },
                        child: const Text(
                          'VOLTAR',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: CustomColors.confirmButtonColor,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          String text = paymentController
                              .paymentControllerText.text
                              .trim();

                          if (text.isEmpty || int.tryParse(text) == null) {
                            Get.snackbar('Erro',
                                'O campo não pode ser vazio, por favor preencha com um número de parcelas válidas.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM);
                          } else if (int.parse(text) <= 0) {
                            Get.snackbar('Erro', 'Parcelas inválidas',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            paymentController.updateInstallments();
                            processTefPayment(payment);
                          }
                        },
                        child: const Text(
                          'CONTINUAR',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    // botão para iniciar a transação TEF
    Widget buildPaymentButton(Map<String, dynamic> payment) {
      IconData icon =
          payment['transacaoBemSucedida'] ? Icons.check : Icons.credit_card;
      Color iconColor =
          payment['transacaoBemSucedida'] ? Colors.white : Colors.black;

      return Container(
        width: 60,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
          color: payment['transacaoBemSucedida']
              ? CustomColors.confirmButtonColor
              : CustomColors.customContrastColor,
        ),
        child: IconButton(
          icon: Icon(icon),
          color: iconColor,
          onPressed: () {
            paymentController.paymentControllerText.text = '1';
            !payment['transacaoBemSucedida']
                ? payment['nome'] == 'TEF DEBITO' ||
                        payment['nome'] == 'PIX INTEGRADO'
                    ? processTefPayment(payment)
                    : Get.dialog(choiceNumbersOfInstallments(payment))
                : Get.snackbar('Erro', 'Pagamento já processado',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    icon: const Icon(Icons.error),
                    snackPosition: SnackPosition.BOTTOM);
          },
        ),
      );
    }

    //linha do cabeçalho
    Widget lineHeader(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ButtonsWidgets().backButtonPayment(),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Pagamento',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),

          //botão para acessar o menu de descontos
          ButtonsPayment().textDiscountOnSale(context, pushSetState),
        ],
      );
    }

    //lista de pedidos dos itens solicitados
    Widget listViewPedidosList() {
      return Expanded(
        child: GetBuilder<PdvController>(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: _.pedidos.length,
                itemBuilder: (context, index) {
                  var priceFormatado =
                      formatoBrasileiro.format(_.pedidos[index]['price']);

                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: CustomColors.customSwatchColor[100],
                          ),
                          child: IconButton(
                            onPressed: () {
                              _.removerPedido(index);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.trash,
                              size: 20,
                            ),
                            color: const Color.fromARGB(255, 170, 46, 37),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _.pedidos[index]['nomeProduto'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                    '${_.pedidos[index]['quantidade']} x R\$ $priceFormatado ${_.pedidos[index]['unidade']}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    }

    //dados informados no rodapé do container do lado esquerdo.
    Widget subtotalDiscountTotal() {
      return GetBuilder<PdvController>(builder: (_) {
        double totalValue = 0.0;

        for (var element in _.pedidos) {
          totalValue += element['total'];
        }

        String newValuetotalCb2 =
            _.numbersDiscountcb2.value.replaceAll(RegExp(r'[^\d]'), '');

        double valorMinusDiscountCb2 =
            totalValue - (double.parse(newValuetotalCb2) / 100);

        String totalValueFormated = formatoBrasileiro.format(totalValue);
        String totalFormat = NumberFormat('#,##0.00', 'pt_BR').format(
            _.checkbox1.value ? _.totalcheckBox1.value : valorMinusDiscountCb2);
        String numberDiscount = _.checkbox1.value
            ? (!_.numbersDiscount.value.isBlank!
                ? _.numbersDiscount.value
                : '0,00')
            : (!_.numbersDiscountcb2.value.isBlank!
                ? _.numbersDiscountcb2.value
                : '0,00');

        return SizedBox(
          height: 78,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: RowWidget().Rows('Total Bruto', totalValueFormated,
                      isSubtotal: true)),
              Expanded(
                flex: 1,
                child: RowWidget().Rows(
                  'Descontos ',
                  numberDiscount,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: RowWidget()
                      .Rows('Total Liquido', totalFormat, istotal: true)),
            ],
          ),
        );
      });
    }

    //icones para escolha de forma de pagamento
    Widget cardsPayment(IconData? icon, String text, String? descricao) {
      return InkWell(
        onTap: () {
          if (descricao != null) {
            if (descricao == 'TEF DEBITO' ||
                descricao == 'TEF CREDITO' ||
                descricao == 'POS - CARTAO CREDITO' ||
                descricao == 'POS - CARTAO DEBITO') {
              Get.dialog(DialogWidget()
                  .keyboardNumber(pushSetState, text, isTef: true));
            } else {
              Get.dialog(DialogWidget().keyboardNumber(pushSetState, text));
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: 125,
            height: 65,
            child: Card(
              color: CustomColors.customSwatchColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    //Pagamento total
    Widget totalPay(String text, String value,
        {bool calculateTotal = false, bool isRest = false}) {
      double totalValue = 0.0;

      for (var element in controller.pedidos) {
        totalValue += element['total'];
      }
      String newValuetotalCb2 =
          controller.numbersDiscountcb2.value.replaceAll(RegExp(r'[^\d]'), '');

      double valorMinusDiscountCb2 =
          totalValue - (double.parse(newValuetotalCb2) / 100);

      double totalValueCb1 = controller.totalcheckBox1.value;
      double totalPaid2 = paymentController.getTotalPaid();
      remainingValue = totalValueCb1 - totalPaid2;

      ramainingValueCb2 = valorMinusDiscountCb2 - totalPaid2;

      double trocoCb1 = remainingValue < 0.0 ? 0.0 : remainingValue;
      double trocoCb2 = ramainingValueCb2 < 0.0 ? 0.0 : ramainingValueCb2;

      String remainingValueFormatted = formatoBrasileiro.format(trocoCb1);

      String remainingValueFormattedCb2 = formatoBrasileiro.format(trocoCb2);

      //transforma a virgula em ponto

      String textReplaceMinus = remainingValueFormatted.replaceAll('-', '');
      String textCb2ReplaceMinus =
          remainingValueFormattedCb2.replaceAll('-', '');

      if (calculateTotal || isRest) {
        String totalPaid = paymentController.getTotalPaid().toStringAsFixed(2);
        totalPaid = formatoBrasileiro.format(double.parse(totalPaid));

        return Padding(
          padding: const EdgeInsets.only(right: 1.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              color: const Color.fromARGB(255, 102, 102, 102),
              borderRadius: calculateTotal
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    )
                  : BorderRadius.circular(0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      calculateTotal
                          ? totalPaid
                          : (controller.checkbox1.value
                              ? textReplaceMinus
                              : textCb2ReplaceMinus),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        double totalValue = 0.0;

        for (var element in controller.pedidos) {
          totalValue += element['total'];
        }
        String newValuetotalCb2 = controller.numbersDiscountcb2.value
            .replaceAll(RegExp(r'[^\d]'), '');

        double valorMinusDiscountCb2 =
            totalValue - (double.parse(newValuetotalCb2) / 100);

        double totalValueCb1 = controller.totalcheckBox1.value;
        double totalPaid = paymentController.getTotalPaid();
        remainingValue = totalValueCb1 - totalPaid;

        ramainingValueCb2 = valorMinusDiscountCb2 - totalPaid;

        double trocoCb1 = remainingValue > 0.0 ? 0.0 : remainingValue;
        double trocoCb2 = ramainingValueCb2 > 0.0 ? 0.0 : ramainingValueCb2;

        String remainingValueFormatted = formatoBrasileiro.format(trocoCb1);

        String remainingValueFormattedCb2 = formatoBrasileiro.format(trocoCb2);

        //transforma a virgula em ponto
        String textformatadocb1 = remainingValueFormatted
            .replaceAll(',', '')
            .replaceAll('-', '')
            .replaceAll('.', '');
        String textformatadocb2 = remainingValueFormattedCb2
            .replaceAll(',', '')
            .replaceAll('-', '')
            .replaceAll('.', '');

        String textReplaceMinus = remainingValueFormatted.replaceAll('-', '');
        String textCb2ReplaceMinus =
            remainingValueFormattedCb2.replaceAll('-', '');

        double textToDouble = double.parse(textformatadocb1) / 100;
        double textToDoubleCb2 = double.parse(textformatadocb2) / 100;

        controller.updateTroco(
            controller.checkbox1.value ? textToDouble : textToDoubleCb2);

        return Container(
          decoration: BoxDecoration(
              color: CustomColors.customContrastColor,
              border: Border.all(width: 1, color: Colors.black),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.checkbox1.value
                        ? textReplaceMinus
                        : textCb2ReplaceMinus,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    //Descontos totais das formas de pagamento.
    Widget paymentForms() {
      return GetBuilder<PdvController>(builder: (pdvController) {
        String paymentFormsFormated = formatoBrasileiro.format(paymentCount);
        double totalValue = pdvController.totalcheckBox1.value;

        var totalToPay = totalValue > 0.0 && totalValue > paymentCount
            ? totalValue - paymentCount
            : 0.0;

        var totalToPayFormatted = formatoBrasileiro.format(totalToPay);

        return GetBuilder<PaymentController>(builder: (_) {
          return Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: _.paymentsTotal.length,
                  itemBuilder: (context, index) {
                    var payment = _.paymentsTotal;

                    return Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  width: 60,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: CustomColors.customSwatchColor[100],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      if (_.paymentsTotal[index]
                                              ['transacaoBemSucedida'] ==
                                          true) {
                                        const CustomSnackBar(
                                                title: 'Erro',
                                                message:
                                                    'Pagamento não pode ser excluído, pois, já foi precessado.',
                                                icon: Icons.error,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white)
                                            .show();
                                      } else {
                                        _.deletePayment(index);
                                      }
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.trash,
                                      size: 20,
                                    ),
                                    color:
                                        const Color.fromARGB(255, 170, 46, 37),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  payment[index]['nome'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ]),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    formatoBrasileiro.format(
                                      double.parse(
                                        payment[index]['valor']
                                            .replaceAll(',', '.'),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                payment[index]['nome'] == 'TEF DEBITO' ||
                                        payment[index]['nome'] ==
                                            'TEF CREDITO' ||
                                        payment[index]['nome'] ==
                                            'PIX INTEGRADO'
                                    ? buildPaymentButton(payment[index])
                                    : Container(),
                              ],
                            )
                          ]),
                    );
                  },
                ),
              )),
              SizedBox(
                height: 75,
                width: double.infinity,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: totalPay(
                                'Valor Recebido', paymentFormsFormated,
                                calculateTotal: true),
                          ),
                          Expanded(
                              child: totalPay('Restante', totalToPayFormatted,
                                  isRest: true)),
                          Expanded(
                              child: totalPay('Troco', totalToPayFormatted)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
      });
    }

    //botões e icones abaixo do container da direita
    Widget listIcons() {
      return StreamBuilder(
          stream: service.listenTipo_recebimento(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }

            if (snapshot.hasError) {
              return const SizedBox();
            }

            var tipoRecebimento = snapshot.data;
            return ListView.builder(
                itemCount: tipoRecebimento!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  IconData tipoReceb = FontAwesomeIcons.moneyBill1Wave;
                  switch (tipoRecebimento[index].tipo_forma) {
                    case 0:
                      tipoReceb = FontAwesomeIcons.moneyBill1Wave;
                      break;
                    case 1:
                      tipoReceb = FontAwesomeIcons.moneyCheck;
                      break;
                    case 2:
                      tipoReceb = FontAwesomeIcons.solidCreditCard;
                      break;
                    case 3:
                      tipoReceb = FontAwesomeIcons.creditCard;
                      break;
                    case 4:
                      tipoReceb = FontAwesomeIcons.addressCard;
                      break;
                    case 5:
                      tipoReceb = FontAwesomeIcons.swatchbook;
                      break;
                    case 6:
                      tipoReceb = FontAwesomeIcons.buildingColumns;
                      break;
                    case 7:
                      tipoReceb = FontAwesomeIcons.ticket;
                      break;
                    case 8:
                      tipoReceb = FontAwesomeIcons.clipboard;
                      break;
                    case 9:
                      tipoReceb = FontAwesomeIcons.heart;
                      break;
                    case 10:
                      tipoReceb = FontAwesomeIcons.pix;
                      break;
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardsPayment(tipoReceb, tipoRecebimento[index].descricao!,
                          tipoRecebimento[index].descricao),
                    ],
                  );
                });
          });
    }

    //botão para finalizar o pedido
    Widget finalizeButton() {
      double totalValue = controller.totalcheckBox1.value;
      double totalPaid = paymentController.getTotalPaid();
      double remainingValue = totalValue - totalPaid;

      controller.totalSomaPedidos();
      var formattednumber = double.parse(
          controller.numbersDiscountcb2.value.replaceAll(',', '.'));

      double totalValue2 = controller.totBruto.value - formattednumber;
      double totalPaid2 = paymentController.getTotalPaid();
      double remainingValue2 = totalValue2 - totalPaid2;

      bool isButtonEnabled = controller.checkbox1.value
          ? remainingValue <= 0
          : false || controller.checkbox2.value
              ? remainingValue2 <= 0
              : false;

      Color buttonColor = isButtonEnabled
          ? const Color(0xFF3C4055)
          : const Color.fromARGB(193, 211, 211, 211);

      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 50,
          child: InkWell(
            onTap: isButtonEnabled
                ? () {
                    paymentController.verifyOpenTransactionTEF()
                        ? Get.snackbar('Erro', 'Existem transações pendentes',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM)
                        :
                        //Popup para confirmar o pedido
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            'Confirmar Pedido',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: CustomColors
                                                    .customSwatchColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: const Center(
                                                child: Text(
                                                  'Tem certeza que deseja finalizar o pedido?',
                                                  style: TextStyle(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      color: Colors.grey,
                                                    ),
                                                    child: const ConfirmButtom(
                                                        text: 'Não'),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                      color: Color(0xFF86C337),
                                                    ),
                                                    child: const ConfirmButtom(
                                                      text: 'Sim',
                                                      isConfirmation: true,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          );
                  }
                : null,
            child: const Center(
              child: Text(
                'Finalizar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      );
    }

    //tamanho da tela
    Widget bodyLayout() {
      return Expanded(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 625),
          child: Row(
            children: [
              //container do lado esquerdo
              Expanded(
                flex: 1,
                child: Container(
                    height: 670,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        listViewPedidosList(),
                        subtotalDiscountTotal(),
                      ],
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              //contaner do lado direito
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: paymentForms(),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: listIcons(),
                    ),
                    SizedBox(
                      height: 100,
                      child: finalizeButton(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                lineHeader(context),
                bodyLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
