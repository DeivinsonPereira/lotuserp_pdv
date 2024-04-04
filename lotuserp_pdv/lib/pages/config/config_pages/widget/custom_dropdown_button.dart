// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

class CustomDropdownButtonMonitor extends StatelessWidget {
  final List<String> options;
  final String value;
  final String text;
  bool? isBalance;
  bool? isTef;
  bool? isSizePrinter;

  CustomDropdownButtonMonitor({
    Key? key,
    required this.options,
    required this.value,
    required this.text,
    this.isBalance = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configcontroller();

    return GetBuilder<Configcontroller>(builder: (_) {
      return DropdownButtonHideUnderline(
        child: SizedBox(
          width: isTef!
              ? Get.width * 0.175
              : isSizePrinter!
                  ? Get.width * 0.06
                  : 95,
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: value,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (newValue) {
              isBalance == true
                  ? _.updateBalanca(newValue!)
                  : isTef == true
                      ? _.updateTef(newValue!)
                      : _.updateTamanhoImpressora(newValue!);
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}

class CustomDropdownButtonMobile extends StatelessWidget {
  final List<String> options;
  final String value;
  final String text;
  bool? isBalance;
  bool? isTef;
  bool? isSizePrinter;

  CustomDropdownButtonMobile({
    Key? key,
    required this.options,
    required this.value,
    required this.text,
    this.isBalance = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configcontroller();

    return GetBuilder<Configcontroller>(builder: (_) {
      return DropdownButtonHideUnderline(
        child: SizedBox(
          width: isTef!
              ? Get.width * 0.15
              : isSizePrinter!
                  ? Get.width * 0.7
                  : 95,
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: value,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (newValue) {
              isBalance == true
                  ? _.updateBalanca(newValue!)
                  : isTef == true
                      ? _.updateTef(newValue!)
                      : _.updateTamanhoImpressora(newValue!);
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
