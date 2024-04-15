import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/search_product_pdv_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/common/custom_dialog_highlight_paper.dart';
import 'package:lotuserp_pdv/pages/common/header_popup.dart';
import 'package:lotuserp_pdv/pages/common/loading_screen.dart';
import 'package:lotuserp_pdv/services/print_xml.dart/print_nfce_xml.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../controllers/response_servidor_controller.dart';
import '../../services/abrir_gaveta/abrir_gaveta.dart';
import '../../services/dependencies.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();
    Dependencies.textFieldController();
    Dependencies.configcontroller();
    SearchProductPdvController searchProductPdvController =
        Dependencies.searchProductPdvController();
    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();
    var printerController = Dependencies.printerController();

    return Dialog(
      child: GetBuilder<PaymentController>(builder: (_) {
        return Container(
          color: Colors.white,
          height: 500,
          width: 400,
          child: Column(children: [
            //header
            HeaderPopupMonitor(
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
                    height: 60,
                    color: _.xml.value != '' && _.xml.value.isNotEmpty
                        ? CustomColors.confirmButtonColor
                        : Colors.grey[300],
                    child: TextButton(
                      onPressed: () async {
                        Get.dialog(const LoadingScreen());
                        paymentController.toggleIsButtonPrintEnabled(false);
                        if (_.xml.value != '' && _.xml.value.isNotEmpty) {
                          var configController =
                              Dependencies.configcontroller();
                          String tamanhoImpressora =
                              configController.tamanhoImpressora.value;
                          if (tamanhoImpressora != 'SEM IMPRESSORA') {
                            await PrintNfceXml().printNfceXml();
                            if (tamanhoImpressora == '80mm') {
                              for (var i = 0;
                                  i < paymentController.comprovanteTef.length;
                                  i++) {
                                await printerController.printTransactionCard(
                                    paymentController.comprovanteTef[i]);
                              }
                            } else if (tamanhoImpressora == '58mm') {
                              if (paymentController.comprovanteTef.isNotEmpty) {
                                Completer completer1 = Completer();
                                Get.dialog(
                                  barrierDismissible: false,
                                  CustomDialogHighlightPaper(
                                    function: () async {
                                      Get.back();
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      completer1.complete();
                                    },
                                  ),
                                );

                                await completer1.future;
                                for (var i = 0;
                                    i < paymentController.comprovanteTef.length;
                                    i++) {
                                  await printerController.printTransactionCard(
                                      paymentController.comprovanteTef[i]);
                                  if (i ==
                                      paymentController.comprovanteTef.length -
                                          2) {
                                    Completer completer2 = Completer();

                                    Get.dialog(
                                      barrierDismissible: false,
                                      CustomDialogHighlightPaper(
                                        function: () async {
                                          Get.back();
                                          await Future.delayed(
                                              const Duration(seconds: 1));
                                          completer2.complete();
                                        },
                                      ),
                                    );

                                    await completer2.future;
                                  }
                                }
                              }
                            }
                            await AbrirGaveta().open();
                            Get.back();
                            Get.back();
                            searchProductPdvController.clearSearch();
                            responseServidorController.limparCpfCnpj();
                            paymentController.toggleIsButtonPrintEnabled(true);
                          }
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
                    height: 60,
                    color: CustomColors.informationBox,
                    child: TextButton(
                      onPressed: () async {
                        if (responseServidorController.xmlNotaFiscal.value ==
                            false) {
                          responseServidorController.limparCpfCnpj();
                          Get.back();
                        } else {
                          Get.back();
                          responseServidorController.limparCpfCnpj();
                          searchProductPdvController.clearSearch();
                        }
                        await AbrirGaveta().open();
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
