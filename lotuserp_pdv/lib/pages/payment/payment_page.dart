import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/global_widget/buttons.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/pages/payment/component/confirm_buttom.dart';
import 'package:lotuserp_pdv/pages/payment/component/dialog_payment_widget.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

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

    var paymentCount = 0.0;

    var remainingValue = 0.0;

    var ramainingValueCb2 = 0.0;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

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
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IconButton(
                          onPressed: () {
                            _.removerPedido(index);
                          },
                          icon: const Icon(
                            FontAwesomeIcons.trash,
                            size: 20,
                            color: Color.fromARGB(255, 170, 46, 37),
                          ),
                        ),
                        title: Text(
                          _.pedidos[index]['nomeProduto'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                            '${_.pedidos[index]['quantidade']} x R\$ $priceFormatado ${_.pedidos[index]['unidade']}'),
                      ),
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
      double totalValue = 0.0;

      for (var element in controller.pedidos) {
        totalValue += element['total'];
      }

      String newValuetotalCb2 =
          controller.numbersDiscountcb2.value.replaceAll(RegExp(r'[^\d]'), '');

      double valorMinusDiscountCb2 =
          totalValue - (double.parse(newValuetotalCb2) / 100);

      String totalValueFormated = formatoBrasileiro.format(totalValue);
      String totalFormat = NumberFormat('#,##0.00', 'pt_BR').format(
          controller.checkbox1.value
              ? controller.totalcheckBox1.value
              : valorMinusDiscountCb2);
      String numberDiscount = controller.checkbox1.value
          ? (!controller.numbersDiscount.value.isBlank!
              ? controller.numbersDiscount.value
              : '0,00')
          : (!controller.numbersDiscountcb2.value.isBlank!
              ? controller.numbersDiscountcb2.value
              : '0,00');

      return SizedBox(
        height: 78,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: RowWidget()
                    .Rows('Total Bruto', totalValueFormated, isSubtotal: true)),
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
    }

    //icones para escolha de forma de pagamento
    Widget cardsPayment(IconData? icon, String text) {
      return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogWidget().keyboardNumber(pushSetState, text);
              });
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
      String paymentFormsFormated = formatoBrasileiro.format(paymentCount);
      double totalValue = controller.totalcheckBox1.value;

      var totalToPay = totalValue > 0.0 && totalValue > paymentCount
          ? totalValue - paymentCount
          : 0.0;

      var totalToPayFormatted = formatoBrasileiro.format(totalToPay);

      return Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: paymentController.paymentsTotal.length,
              itemBuilder: (context, index) {
                var mapPaymentsTotal = paymentController.paymentsTotal;

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mapPaymentsTotal[index]['nome'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                formatoBrasileiro.format(
                                  double.parse(
                                    mapPaymentsTotal[index]['valor']
                                        .replaceAll(',', '.'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      paymentController.deletePayment(index);
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.trash,
                                      size: 20,
                                    ),
                                    color:
                                        const Color.fromARGB(255, 170, 46, 37),
                                  )),
                            ],
                          )
                        ]),
                  ),
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
                        child: totalPay('Valor Recebido', paymentFormsFormated,
                            calculateTotal: true),
                      ),
                      Expanded(
                          child: totalPay('Restante', totalToPayFormatted,
                              isRest: true)),
                      Expanded(child: totalPay('Troco', totalToPayFormatted)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
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
                      cardsPayment(
                          tipoReceb, tipoRecebimento[index].descricao!),
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
                    //Popup para confirmar o pedido
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Confirmar Pedido',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: CustomColors.customSwatchColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                                color: Colors.grey,
                                              ),
                                              child: const ConfirmButtom(
                                                  text: 'Não'),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10)),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            lineHeader(context),
            bodyLayout(),
          ],
        ),
      ),
    );
  }
}
