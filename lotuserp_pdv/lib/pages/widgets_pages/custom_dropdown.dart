import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class CustomDropdown extends StatefulWidget {
  final  items;
  final double paddingBottom;
  final double paddingTop;
  const CustomDropdown({
    super.key,
    required this.items,
    required this.paddingBottom,
    required this.paddingTop,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.paddingBottom, top: widget.paddingTop),
      child: Container(
        padding: const EdgeInsets.only(
          left: 13,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.customSwatchColor.shade800,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          style: TextStyle(
            color: CustomColors.customSwatchColor.shade800,
            fontSize: 16,
          ),
          borderRadius: BorderRadius.circular(4),
          itemHeight: 48,
          icon: Icon(
            Icons.arrow_drop_down,
            color: CustomColors.customSwatchColor.shade800,
          ),
        ),
      ),
    );
  }
}
