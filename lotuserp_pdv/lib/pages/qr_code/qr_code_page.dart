import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/search_product_pdv_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../services/dependencies.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    PaymentController paymentController = Dependencies.paymentController();
    SearchProductPdvController searchProductPdvController =
        Dependencies.searchProductPdvController();

    return Dialog(
      child: Container(
        color: Colors.white,
        height: 500,
        width: 400,
        child: Column(children: [
          //header
          const HeaderPopup(
              text: 'QR Code NFC-e', icon: FontAwesomeIcons.qrcode),

          //QR Code
          Expanded(
            child: Center(
              child: QrImageView(
                data: paymentController.qrCode,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: CustomColors.confirmButtonColor,
                  child: TextButton(
                    onPressed: () {
                      // chamar impressão do XML
                    },
                    child: const Text(
                      'IMPRIMIR',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: CustomColors.informationBox,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'FECHAR ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Botões
        ]),
      ),
    );
  }
}
