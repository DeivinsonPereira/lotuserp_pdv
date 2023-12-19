import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/global_widget/buttons.dart';
import 'package:lotuserp_pdv/pages/payment/component/confirm_buttom.dart';
import 'package:lotuserp_pdv/pages/payment/component/dialog_payment_widget.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late NumberFormat formatoBrasileiro;
  PdvController controller = Get.find();

  void pushSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PaymentController controllerPayment = Get.put(PaymentController());

    var paymentCount = 0.0;

    String total;

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
          ButtonsPayment().textDiscountOnSale(context, pushSetState),
        ],
      );
    }

    //lista de pedidos dos itens solicitados
    Widget listViewPedidosList() {
      return Flexible(
        flex: 12,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 525,
            child: ListView.builder(
              itemCount: controller.pedidos.length,
              itemBuilder: (context, index) {
                total = formatoBrasileiro
                    .format(controller.pedidos[index]['total']);

                var priceFormatado = formatoBrasileiro
                    .format(controller.pedidos[index]['price']);

                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.removerPedido(index, () => setState);
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.trash,
                          size: 20,
                          color: Color.fromARGB(255, 170, 46, 37),
                        ),
                      ),
                      title: Text(
                        controller.pedidos[index]['nomeProduto'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          '${controller.pedidos[index]['quantidade']} x R\$$priceFormatado ${controller.pedidos[index]['unidade']}'),
                      trailing: Text(
                        ' $total',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
      String totalFormat = formatoBrasileiro.format(controller.checkbox1.value
          ? controller.totalcheckBox1.value
          : valorMinusDiscountCb2);
      String numberDiscount = controller.checkbox1.value
          ? (!controller.numbersDiscount.value.isBlank!
              ? controller.numbersDiscount.value
              : '0,00')
          : (!controller.numbersDiscountcb2.value.isBlank!
              ? controller.numbersDiscountcb2.value
              : '0,00');

      return Flexible(
        flex: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            RowWidget().Rows('Subtotal', totalValueFormated),
            RowWidget().Rows(
              'Desconto na venda',
              numberDiscount,
            ),
            RowWidget().Rows('Total', totalFormat),
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
                return DialogWidget()
                    .keyboardNumber(pushSetState, paymentCount, text);
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: 125,
            height: 60,
            child: Card(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ]),
            ),
          ),
        ),
      );
    }

    Widget totalPay(String text, String value, {bool calculateTotal = false}) {
      if (calculateTotal) {
        String totalPaid = controllerPayment.getTotalPaid().toStringAsFixed(2);
        totalPaid = formatoBrasileiro.format(double.parse(totalPaid));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Text(
                calculateTotal ? totalPaid : value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
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
        double totalPaid = controllerPayment.getTotalPaid();
        remainingValue = totalValueCb1 - totalPaid;

        ramainingValueCb2 = valorMinusDiscountCb2 - totalPaid;

        String remainingValueFormatted =
            formatoBrasileiro.format(remainingValue);

        String remainingValueFormattedCb2 =
            formatoBrasileiro.format(ramainingValueCb2);

        String text = remainingValue < 0 ? 'Troco' : 'Falta pagar';
        Color textColor = remainingValue < 0 ? Colors.red : Colors.black;

        String textCb2 = ramainingValueCb2 < 0 ? 'Troco' : 'Falta pagar';
        Color textColorCb2 = ramainingValueCb2 < 0 ? Colors.red : Colors.black;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.checkbox1.value ? text : textCb2,
                style: TextStyle(
                  color: controller.checkbox1.value ? textColor : textColorCb2,
                ),
              ),
              Text(
                controller.checkbox1.value
                    ? remainingValueFormatted
                    : remainingValueFormattedCb2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.checkbox1.value ? textColor : textColorCb2,
                ),
              ),
            ],
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
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: controllerPayment.paymentsTotal.length,
                  itemBuilder: (context, index) {
                    var mapPaymentsTotal = controllerPayment.paymentsTotal;

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
                                  Text(mapPaymentsTotal[index]['valor']),
                                  SizedBox(
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {});
                                          controllerPayment
                                              .deletePayment(index);
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.trash,
                                          size: 20,
                                        ),
                                        color: const Color.fromARGB(
                                            255, 170, 46, 37),
                                      )),
                                ],
                              )
                            ]),
                      ),
                    );
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  totalPay('Total pago', paymentFormsFormated,
                      calculateTotal: true),
                  totalPay('Falta pagar', totalToPayFormatted),
                ],
              ))
        ],
      );
    }

    //botões e icones abaixo do container da direita
    Widget listIcons() {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardsPayment(FontAwesomeIcons.moneyBill1Wave, 'Dinheiro'),
              cardsPayment(FontAwesomeIcons.creditCard, 'POS Crédito'),
              cardsPayment(FontAwesomeIcons.solidCreditCard, 'POS Débito'),
              cardsPayment(FontAwesomeIcons.pix, 'PIX'),
              cardsPayment(FontAwesomeIcons.moneyCheckDollar, 'TEF Crédito'),
              cardsPayment(FontAwesomeIcons.moneyCheck, 'TEF Débito'),
              cardsPayment(FontAwesomeIcons.pix, 'TEF PIX'),
              cardsPayment(FontAwesomeIcons.moneyBill, 'TEF Voucher'),
            ],
          ),
        ],
      );
    }

    Widget finalizeButton() {
      double totalValue = controller.totalcheckBox1.value;
      double totalPaid = controllerPayment.getTotalPaid();
      double remainingValue = totalValue - totalPaid;

      bool isButtonEnabled = remainingValue <= 0;
      Color buttonColor =
          isButtonEnabled ? CustomColors.customSwatchColor : Colors.grey;

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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  color: Colors.grey,
                                                ),
                                                child:
                                                    const ConfirmButtom(text: 'Não')),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color:Color(0xFF86C337),
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
                    height: 625,
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
                      flex: 7,
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: paymentForms(),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: listIcons(),
                    ),
                    Flexible(
                      flex: 1,
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
