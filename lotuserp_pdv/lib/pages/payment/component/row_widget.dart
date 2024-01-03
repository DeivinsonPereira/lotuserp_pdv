// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

var formatoBrasileiro = NumberFormat.currency(
  locale: 'pt_BR',
  symbol: '',
);

class RowWidget {
  Widget Rows(String text, String total,
      {bool isSubtotal = false, bool istotal = false}) {
    return Padding(
      padding: isSubtotal
          ? const EdgeInsets.only(right: 1.0)
          : (istotal
              ? const EdgeInsets.only(left: 1.0)
              : const EdgeInsets.all(0)),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: istotal
              ? const BorderRadius.only(bottomRight: Radius.circular(10))
              : (isSubtotal
                  ? const BorderRadius.only(bottomLeft: Radius.circular(10))
                  : BorderRadius.circular(0)),
          color: istotal
              ? CustomColors.customContrastColor
              : const Color.fromARGB(255, 102, 102, 102),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: istotal ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  total,
                  style: TextStyle(
                      color: istotal ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsPayment {
  PdvController controller = Get.isRegistered<PdvController>()
      ? Get.find<PdvController>()
      : Get.put(PdvController());
  double originalDiscountPercentage = 0.0;
  double originalTotalValue = 0.0;

  Widget iconBackspace() {
    return SizedBox(
      width: 150,
      height: 37,
      child: InkWell(
        onTap: () {
          controller.checkbox1.value
              ? controller.removeNumberDiscount()
              : controller.removeNumberDiscountCb2();
        },
        child: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildNumberButton(String number) {
    return InkWell(
      onTap: () {
        controller.checkbox1.value
            ? controller.addNumberDiscount(number)
            : controller.addPercentageDiscount(number);
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

  // Subtotal in dialog discount
  Widget subtotalInDialog(String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(() {
                double valor = 0.0;
                for (var element in controller.pedidos) {
                  valor += element['total'];
                }
                String newValueCb1 = controller.numbersDiscount.value
                    .replaceAll(RegExp(r'[^\d]'), '');
                double valorMinusDiscountcb1 =
                    valor - (double.parse(newValueCb1) / 100);

                final formattedValueCb1 =
                    formatoBrasileiro.format(valorMinusDiscountcb1);

                String newValueCb2 = controller.numbersDiscountcb2.value
                    .replaceAll(RegExp(r'[^\d]'), '');

                double valorMinusDiscountCb2 =
                    valor - (double.parse(newValueCb2) / 100);

                final formattedValueCb2 =
                    formatoBrasileiro.format(valorMinusDiscountCb2);

                return Obx(
                  () => Text(
                    controller.checkbox1.value
                        ? formattedValueCb1
                        : formattedValueCb2,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  //checkbox para desconto em reais
  Widget checkedDiscountBoxButton(String text) {
    return InkWell(
        onTap: () {
          controller.checkbox1.value = !controller.checkbox1.value;
          if (controller.checkbox1.value) {
            controller.checkbox2.value = false;
          }
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Obx(
            () => Checkbox(
              shape: const CircleBorder(),
              checkColor: Colors.white,
              activeColor: CustomColors.customContrastColor,
              value: controller.checkbox1.value,
              /*mudar para variavel */
              onChanged: (bool? value) {
                controller.checkbox1.value = !controller.checkbox1.value;
                if (controller.checkbox1.value) {
                  controller.checkbox2.value = false;
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(
                () => Text(
                  //arrumar questão do desconto em porcentagem.
                  controller.checkbox1.value
                      ? controller.numbersDiscount.value
                      : controller.numbersDiscountcb2.value,

                  style: !controller.checkbox1.value
                      ? const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                      : TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customContrastColor),
                ),
              )
            ],
          )
        ]));
  }

  //checkbox para desconto em percentual
  Widget checkedPercentualBoxButton(
    String text,
  ) {
    return InkWell(
        onTap: () {
          controller.checkbox2.value = !controller.checkbox2.value;
          if (controller.checkbox2.value) {
            controller.checkbox1.value = false;
          }
        },
        child: Row(children: [
          Obx(
            () => Checkbox(
              shape: const CircleBorder(),
              checkColor: Colors.white,
              activeColor: CustomColors.customContrastColor,
              value: controller.checkbox2.value,
              /*mudar para variavel */
              onChanged: (bool? value) {
                controller.checkbox2.value = !controller.checkbox2.value;
                if (controller.checkbox2.value) {
                  controller.checkbox1.value = false;
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(() {
                final formattedDiscountPercentage = formatoBrasileiro
                    .format(controller.discountPercentage.value);
                return Text(
                  !controller.checkbox2.value
                      ? '$formattedDiscountPercentage% '
                      : '${controller.discountPercentagecb2.value}%',
                  style: !controller.checkbox2.value
                      ? const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                      : TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customContrastColor),
                );
              }),
            ],
          )
        ]));
  }

  //botão de desconto
  Widget textDiscountOnSale(BuildContext context, Function callback) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
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
                                    buildNumberButton('1'),
                                    buildNumberButton('2'),
                                    buildNumberButton('3'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    buildNumberButton('4'),
                                    buildNumberButton('5'),
                                    buildNumberButton('6'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    buildNumberButton('7'),
                                    buildNumberButton('8'),
                                    buildNumberButton('9'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    buildNumberButton('00'),
                                    buildNumberButton('0'),
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
                          checkedDiscountBoxButton('Desconto em Reais'),
                          const SizedBox(
                            height: 50,
                          ),
                          checkedPercentualBoxButton('Desconto percentual'),
                          const SizedBox(
                            height: 50,
                          ),
                          subtotalInDialog('Subtotal'),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      controller.numbersDiscount('0,00');
                      controller.discountPercentage(0.00);
                      controller.discountPercentagecb2('00,00');
                      controller.numbersDiscountcb2('0,00');
                    },
                    child: const Text(
                      'CANCELAR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      callback();
                      Get.back();
                    },
                    child: const Text(
                      'CONFIRMAR',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            });
      },
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.tags,
            color: CustomColors.customSwatchColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Desconto na venda',
            style: TextStyle(color: CustomColors.customSwatchColor),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
