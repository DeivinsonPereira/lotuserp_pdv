import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';

class DialogWidget {
  PaymentController controller = InjectionDependencies.paymentController();
  PdvController pdvcontroller = InjectionDependencies.pdvController();

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

  Widget keyboardNumber(Function callback, String name) {
    double totalValue = pdvcontroller.totalcheckBox1.value;
    String numbersDiscountcb2 =
        pdvcontroller.numbersDiscountcb2.value.replaceAll(',', '.');
    double numbersDiscountcb2Formated = double.parse(numbersDiscountcb2);

    double totalValue2 =
        pdvcontroller.totBruto.value - numbersDiscountcb2Formated;
    double totalPaid = controller.getTotalPaid();
    double remainingValue = totalValue - totalPaid;
    double totalValue2withPayment = totalValue2 - totalPaid;

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
          Container(
            alignment: Alignment.topCenter,
            height: 350,
            width: 500,
            child: Row(
              children: [
                //Informação "falta pagar"
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 82,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        color: CustomColors.informationBox,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'À Pagar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              pdvcontroller.checkbox1.value
                                  ? remainingValueFormatted
                                  : formatoBrasileiro
                                      .format(totalValue2withPayment),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // informação valor digitado
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Container(
                        height: 82,
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          color: CustomColors.customContrastColor,
                        ),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Informado',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Obx(
                                () {
                                  return Text(
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.clip,
                                    formatoBrasileiro.format(double.parse(
                                        controller.totalPayment.value
                                            .replaceAll(',', '.'))),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  );
                                },
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
        ],
      ),

      // Botões de confirmação e cancelamento
      actions: [
        //Cancelar
        TextButton(
          onPressed: () {
            controller.totalPayment.value = '0,00';
            Get.back();
          },
          child: const Text(
            'CANCELAR',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        //Confirmar
        TextButton(
          onPressed: () {
            if (controller.totalPayment.value != '0,00') {
              controller.addPaymentsTotal(name, controller.totalPayment.value);
              controller.totalPayment.value = '0,00';
              callback();
            }
            Get.back();
          },
          child: const Text(
            'CONFIRMAR',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
