import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/global_widget/buttons.dart';

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

    print(controller.pedidos.length);

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
          ButtonsWidgets().textDiscountOnSale(),
        ],
      );
    }

    Widget listViewPedidosList() {
      return Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: controller.pedidos.length,
            itemBuilder: (context, index) {
              print(controller.pedidos.length);
              total =
                  formatoBrasileiro.format(controller.pedidos[index]['total']);

              var priceFormatado =
                  formatoBrasileiro.format(controller.pedidos[index]['price']);

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
      );
    }

    Widget subtotalDiscountTotal() {
      return Expanded(
        flex: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              ),
            )
          ],
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
              Expanded(child: Container())
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
