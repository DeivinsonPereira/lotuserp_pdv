import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/global_widget/buttons.dart';
import 'package:lotuserp_pdv/pages/payment/widget/row_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late NumberFormat formatoBrasileiro;

  @override
  Widget build(BuildContext context) {
    PdvController controller = Get.find();

    var total;

    var formatoBrasileiro = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    );

    Widget lineHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ButtonsWidgets().backButton(),
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
          ButtonsWidgets().textDiscountOnSale(context),
        ],
      );
    }

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
                            controller.removerPedido(index);
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
                        style: TextStyle(fontSize: 16),
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

    Widget subtotalDiscountTotal() {
      var totalFormat = formatoBrasileiro.format(controller.total.value);
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
            RowWidget().Rows('Subtotal', totalFormat),
            RowWidget().Rows('Desconto na venda', '15,00'),
            RowWidget().Rows('Total', controller.discountTotal.toString()),
          ],
        ),
      );
    }

    Widget cardsPaymente(IconData icon, String text) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: 150,
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
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ),
        ),
      );
    }

    Widget bodyLayout() {
      return Expanded(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 625),
          child: Row(
            children: [
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
              SizedBox(
                width: 20,
              ),
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
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardsPaymente(
                                  FontAwesomeIcons.moneyBill, 'Dinheiro'),
                              cardsPaymente(
                                  FontAwesomeIcons.creditCard, 'Cartão'),
                              cardsPaymente(Icons.money, 'Crediário'),
                              cardsPaymente(Icons.pix, 'Pix'),
                            ]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: CustomColors.customSwatchColor,
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: const Text(
                              'Finalizar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
            lineHeader(),
            bodyLayout(),
          ],
        ),
      ),
    );
  }
}
