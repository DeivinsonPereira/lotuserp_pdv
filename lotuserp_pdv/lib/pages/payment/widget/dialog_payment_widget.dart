import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/payment.controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

class DialogWidget {
  PaymentController controller = Get.find();
  PdvController pdvcontroller = Get.find();

  var formatoBrasileiro = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
  );

  Widget buildNumberButton(String number, Function callback, String name) {
    return InkWell(
      onTap: () {
        controller.addNumberPayment(number);
        callback();
      },
      child: SizedBox(
        width: 150,
        child: Center(
          child: Text(
            number,
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }

  Widget iconBackspace() {
    return SizedBox(
      width: 150,
      height: 37,
      child: InkWell(
        onTap: () {
          controller.removeNumberDiscount();
        },
        child: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget keyboardNumber(Function callback, double value, String name) {
    double totalValue = pdvcontroller.total.value;
    double totalPaid = controller.getTotalPaid();
    double remainingValue = totalValue - totalPaid;

    String remainingValueFormatted =
        remainingValue < 0 ? '0,00' : formatoBrasileiro.format(remainingValue);

    return AlertDialog(
      content: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          buildNumberButton('1', callback, name),
                          buildNumberButton('2', callback, name),
                          buildNumberButton('3', callback, name),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('4', callback, name),
                          buildNumberButton('5', callback, name),
                          buildNumberButton('6', callback, name),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('7', callback, name),
                          buildNumberButton('8', callback, name),
                          buildNumberButton('9', callback, name),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          buildNumberButton('00', callback, name),
                          buildNumberButton('0', callback, name),
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
            width: 500,
            child: Column(
              children: [
                Text(
                  'Falta pagar: $remainingValueFormatted',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122),
                  ),
                ),
                Obx(
                  () {
                    return Text(
                      controller.totalPayment.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.addPaymentsTotal(name, controller.totalPayment.value);
            controller.totalPayment.value = '0,00';
            print(controller.paymentsTotal);
            //implementar lógica para armazenar o valor do disconto numa variável e passar para a tela principal;
            callback();
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
