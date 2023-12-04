import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class ButtonsWidgets {
  var enteredNumberDiscount = '';

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  PdvController controller = Get.find();

  var formatoBrasileiro = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
  );

  Widget iconBackspace() {
    return Container(
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

  Widget buildNumberButton(String number) {
    return InkWell(
      onTap: () {
        controller.addNumberDiscount(number);
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

  Widget buildStartNumberButton(String number) {
    return InkWell(
      onTap: () {
        controller.addNumberDiscount(number);
      },
      child: Container(
        width: 150,
        child: Text(
          number,
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 112, 112, 112),
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  //checkbox para Subtotal
  Widget checkedBoxButton(String text, RxDouble totalValue) {
    return InkWell(
        onTap: () {
          controller.checkbox1.value = !controller.checkbox1.value;
          if (controller.checkbox1.value) {
            controller.checkbox2.value = false;
            controller.checkbox3.value = false;
          }
        },
        child: Row(children: [
          Obx(
            () => Checkbox(
              value: controller.checkbox1.value,
              onChanged: (bool? value) {
                controller.checkbox1.value = !controller.checkbox1.value;
                if (controller.checkbox1.value) {
                  controller.checkbox2.value = false;
                  controller.checkbox3.value = false;
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(() {
                final value = totalValue.value;
                final formattedValue = formatoBrasileiro.format(value);
                return Text(
                  formattedValue,
                  style: !controller.checkbox1.value
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

  //checkbox para desconto em reais
  Widget checkedDiscountBoxButton(String text, BuildContext context) {
    return InkWell(
        onTap: () {
          controller.checkbox2.value = !controller.checkbox2.value;
          if (controller.checkbox2.value) {
            controller.checkbox1.value = false;
            controller.checkbox3.value = false;
          }
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Obx(
            () => Checkbox(
              value: controller.checkbox2.value,
              /*mudar para variavel */
              onChanged: (bool? value) {
                controller.checkbox2.value = !controller.checkbox2.value;
                if (controller.checkbox2.value) {
                  controller.checkbox1.value = false;
                  controller.checkbox3.value = false;
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
                  !controller.numbersDiscount.value.isBlank!
                      ? controller.numbersDiscount.value
                      : '0,00',
                  style: !controller.checkbox2.value
                      ? TextStyle(
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
  Widget checkedPercentualBoxButton(String text, double totalValue) {
    return InkWell(
        onTap: () {
          controller.checkbox3.value = !controller.checkbox3.value;
          if (controller.checkbox3.value) {
            controller.checkbox1.value = false;
            controller.checkbox2.value = false;
          }
        },
        child: Row(children: [
          Obx(
            () => Checkbox(
              value: controller.checkbox3.value,
              /*mudar para variavel */
              onChanged: (bool? value) {
                controller.checkbox3.value = !controller.checkbox3.value;
                if (controller.checkbox3.value) {
                  controller.checkbox1.value = false;
                  controller.checkbox2.value = false;
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
                  '$formattedDiscountPercentage% ',
                  style: !controller.checkbox3.value
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

  Widget textDiscountOnSale(BuildContext context) {
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
                    SizedBox(
                      height: 400,
                      width: 300,
                      child: Column(
                        children: [
                          checkedBoxButton('Subtotal', controller.total),
                          const SizedBox(
                            height: 50,
                          ),
                          checkedDiscountBoxButton(
                              'Desconto em Reais', context),
                          const SizedBox(
                            height: 50,
                          ),
                          checkedPercentualBoxButton('Desconto percentual',
                              controller.discountPercentage.value),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
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
