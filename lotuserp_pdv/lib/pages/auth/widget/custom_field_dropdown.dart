// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../controllers/config_controller.dart';
import 'custom_dropdown_button.dart';

class CustomFieldDropdown extends StatelessWidget {
  final List<String> options;
  final String text;
  final IconData icon;
  final String value;
  bool? isBalance;

  CustomFieldDropdown({
    Key? key,
    required this.options,
    required this.text,
    required this.icon,
    required this.value,
    this.isBalance = false,
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
                        CustomDropdownButton(
                            options: options,
                            value: value,
                            isBalance: isBalance,
                            text: text),
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
