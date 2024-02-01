import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/search_product_pdv_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';
import 'package:lotuserp_pdv/services/print_xml.dart/print_nfce_xml.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../controllers/response_servidor_controller.dart';
import '../../services/dependencies.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.paymentController();
    Dependencies.textFieldController();
    Dependencies.configcontroller();
    SearchProductPdvController searchProductPdvController =
        Dependencies.searchProductPdvController();
    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();

    return Dialog(
      child: GetBuilder<PaymentController>(builder: (_) {
        return Container(
          color: Colors.white,
          height: 500,
          width: 400,
          child: Column(children: [
            //header
            HeaderPopup(
                text: 'QR Code NFC-e', icon: FontAwesomeIcons.qrcode),

            //QR Code
            Expanded(
              child: Center(
                child: _.qrCode.isEmpty
                    ? Container()
                    : QrImageView(
                        data: _.qrCode.value,
                        version: QrVersions.auto,
                        size: 300.0,
                      ),
              ),
            ),
            // botões

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: _.xml.value != '' && _.xml.value.isNotEmpty
                        ? CustomColors.confirmButtonColor
                        : Colors.grey[300],
                    child: TextButton(
                      onPressed: () async {
                        if (_.xml.value != '' && _.xml.value.isNotEmpty) {
                          await PrintNfceXml().printNfceXml();
                          Get.back();
                          searchProductPdvController.clearSearch();
                        }
                      },
                      child: Text(
                        _.xml.value != '' && _.xml.value.isNotEmpty
                            ? 'IMPRIMIR'
                            : 'AGUARDE',
                        style: const TextStyle(
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
                        if (responseServidorController.xmlNotaFiscal.value ==
                            false) {
                          Get.back();
                        } else {
                          Get.back();
                          searchProductPdvController.clearSearch();
                        }
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
        );
      }),
    );
  }
}
