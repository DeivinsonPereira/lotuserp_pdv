import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/payment.controller.dart';

class DialogWidget {
  PaymentController controller = Get.find();


  var formatoBrasileiro = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
  );

  Widget buildNumberButton(String number, Function callback) {
    return InkWell(
      onTap: () {
         controller.paymentsTotal = NumberFormat.percentPattern();
        callback();
        print(paymentTotal);
      },
      child: Container(
        width: 150,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }

  Widget iconBackspace() {
    return Container(
      width: 150,
      height: 37,
      child: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget keyboardNumber(Function callback, double value, String name) {
    double totalValue = controller.total.value;
    var totalToPay =
        totalValue > 0.0 && totalValue > value ? totalValue - value : 0.0;

    var totalToPayFormated = formatoBrasileiro.format(totalToPay);

    var totalToPayFormatted = formatoBrasileiro.format(totalToPay);
    return AlertDialog(
      content: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          buildNumberButton('1', callback),
                          buildNumberButton('2', callback),
                          buildNumberButton('3', callback),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('4', callback),
                          buildNumberButton('5', callback),
                          buildNumberButton('6', callback),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('7', callback),
                          buildNumberButton('8', callback),
                          buildNumberButton('9', callback),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('00', callback),
                          buildNumberButton('0', callback),
                          iconBackspace(),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 350,
            width: 300,
            child: Column(
              children: [
                Text(
                  'Falta pagar: $totalToPayFormatted',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122),
                  ),
                ),
                Text(
                  'Pagamento em $name $paymentTotal',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            callback();
            //implementar lógica para armazenar o valor do disconto numa variável e passar para a tela principal;
            Get.back();
          },
          child: const Text('CONFIRMAR'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'CANCELAR',
          ),
        ),
      ],
    );
  }
}
