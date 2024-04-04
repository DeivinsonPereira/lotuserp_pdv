// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/config_controller.dart';
import '../../../../services/dependencies.dart';

class CustomDropdownButtonColor extends StatelessWidget {
  final List<String> options;
  final String value;

  const CustomDropdownButtonColor({
    Key? key,
    required this.options,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configcontroller();

    return GetBuilder<Configcontroller>(builder: (_) {
      return DropdownButtonHideUnderline(
        child: SizedBox(
          width: Get.width * 0.075,
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
              _.updateColorBackground(newValue!);
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
                        Text(value, style: const TextStyle(fontSize: 12)),
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
