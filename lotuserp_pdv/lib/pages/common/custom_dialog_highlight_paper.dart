// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';

class CustomDialogHighlightPaper extends StatelessWidget {
  final Function() function;
  const CustomDialogHighlightPaper({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: Get.size.height * 0.5,
        width: Get.size.width * 0.4,
        child: Column(
          children: [
            HeaderPopupMonitor(
              text: 'DESTAQUE A IMPRESSÃO',
              icon: Icons.broken_image_rounded,
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Destaque o comprovante e aperte em continuar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.confirmButtonColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: function,
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
