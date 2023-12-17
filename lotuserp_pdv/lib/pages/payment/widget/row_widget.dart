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
  Widget Rows(
    String text,
    String total,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            total,
          ),
        ],
      ),
    );
  }
}

class ButtonsPayment {
  PdvController controller = Get.find();
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
                      callback();
                      Get.back();
                    },
                    child: const Text('CONFIRMAR'),
                  ),
                  TextButton(
                    onPressed: () {
                      callback();
                      Get.back();
                    },
                    child: const Text(
                      'CANCELAR',
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
