// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../../controllers/config_controller.dart';
import 'custom_dropdown_button.dart';

class CustomFieldDropdownMonitor extends StatelessWidget {
  final List<String> options;
  final String text;
  final IconData icon;
  final String value;
  bool? isBalance;
  bool? isBalanceName;
  bool? isTef;
  bool? isSizePrinter;

  CustomFieldDropdownMonitor({
    Key? key,
    required this.options,
    required this.text,
    required this.icon,
    required this.value,
    this.isBalance = false,
    this.isBalanceName = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configcontroller();

    return GetBuilder<Configcontroller>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 52,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Icon(
                              icon,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        CustomDropdownButtonMonitor(
                          options: options,
                          value: value,
                          isBalance: isBalance,
                          text: text,
                          isTef: isTef!,
                          isSizePrinter: isSizePrinter!,
                          isBalanceName: isBalanceName!,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    child: Text(
                      text,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class CustomFieldDropdownMobile extends StatelessWidget {
  final List<String> options;
  final String text;
  final IconData icon;
  final String value;
  bool? isBalance;
  bool? isTef;
  bool? isSizePrinter;

  CustomFieldDropdownMobile({
    Key? key,
    required this.options,
    required this.text,
    required this.icon,
    required this.value,
    this.isBalance = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configcontroller();

    return GetBuilder<Configcontroller>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 9.0),
                          child: Container(
                            width: Get.width * 0.134,
                            height: 46,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Icon(
                              icon,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        CustomDropdownButtonMobile(
                          options: options,
                          value: value,
                          isBalance: isBalance,
                          text: text,
                          isTef: isTef!,
                          isSizePrinter: isSizePrinter!,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    child: Text(
                      text,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
