import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class ButtonsWidgets {
  var enteredNumberDiscount = '';

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

  Widget checkedBoxButton(String text, RxDouble totalValue) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Checkbox(
            value: true /*mudar para variavel */,
            onChanged: (bool? value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(() {
                final value = totalValue.value;
                final formattedValue = formatoBrasileiro.format(value);
                return Text(formattedValue);
              }),
            ],
          )
        ]));
  }

  Widget checkedPercentualBoxButton(String text, String totalValue) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Checkbox(
            value: true /*mudar para variavel */,
            onChanged: (bool? value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(text), Text(totalValue)],
          )
        ]));
  }

  Widget checkedDiscountBoxButton(String text, BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Checkbox(
            value: true /*mudar para variavel */,
            onChanged: (bool? value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Obx(() => Text(!controller.numbersDiscount.value.isBlank!
                  ? controller.numbersDiscount.value
                  : '0,00'))
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
                      height: 200,
                      width: 600,
                      child: Column(
                        children: [
                          checkedBoxButton('Subtotal', controller.total),
                          checkedDiscountBoxButton(
                              'Desconto em Reais', context),
                          checkedBoxButton(
                              'Desconto percentual', controller.total),
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
