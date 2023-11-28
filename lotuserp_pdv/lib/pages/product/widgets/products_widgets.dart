import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class ProductsWidgets {
  Widget cards(String text, bool isSelectedList, VoidCallback onTap) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          child:
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: isSelectedList == false
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                  color: CustomColors.customSwatchColor,
                                  fontSize: 22),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(43, 48, 91, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: isSelectedList == false
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                  color: CustomColors.customSwatchColor,
                                  fontSize: 22),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(43, 48, 91, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: isSelectedList == false
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                  color: CustomColors.customSwatchColor,
                                  fontSize: 16),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(43, 48, 91, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
