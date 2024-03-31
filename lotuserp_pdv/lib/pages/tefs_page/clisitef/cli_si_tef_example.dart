/*// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../controllers/config_controller.dart';
import '../../../controllers/payment_controller.dart';
import '../../../services/dependencies.dart';
import 'components/clisitef_controller.dart';

class CliSiTefExemple extends StatefulWidget {
  final Configcontroller configController;
  final PaymentController paymentController;
  final int pagamentoFormaSitef;
  final String paymentTypeNFCE;
  const CliSiTefExemple({
    Key? key,
    required this.configController,
    required this.paymentController,
    required this.pagamentoFormaSitef,
    required this.paymentTypeNFCE,
  }) : super(key: key);

  @override
  State<CliSiTefExemple> createState() => _CliSiTefExempleState();
}

class _CliSiTefExempleState extends State<CliSiTefExemple> {
  MainController controller = MainController();
  var menuController = Dependencies.menuController();
  Logger logger = Logger();
  bool isSecondFill = false;

  @override
  void initState() {
    super.initState();

    CliSiTefConfiguration configuration = CliSiTefConfiguration(
      enderecoSitef: CustomTefIp()
          .getTefIp(context, widget.paymentController.paymentForm[0]),
      codigoLoja: widget.paymentController.paymentForm[0].tef_loja,
      numeroTerminal: widget.paymentController.paymentForm[0].tef_terminal,
      cnpjAutomacao: '08809908000152', // CNPJ VISTA TECNOLOGIA
      cnpjLoja: RemoveSpecialCharacter()
          .remove(widget.paymentController.paymentForm[0].tef_cnpj_empresa),
      tipoPinPad: TipoPinPad.usb,
      parametrosAdicionais: InfoAdicionais()
          .getInfoAdicionais(context, widget.paymentController.paymentForm[0]),
    );

    controller.pdv = CliSiTefPDV(
        client: controller.clisitefPlugin,
        configuration: configuration,
        isSimulated: controller.isSimulated);

    configureCliSitefCallbacks();

    transaction();
    // pinpad();
  }

  Future<void> configureCliSitefCallbacks() async {
    controller.pdv.pinPadStream.stream.listen((PinPadInformation event) {
      setState(() {
        PinPadInformation pinPad = event;
        controller.pinPadInfo =
            'isPresent: ${pinPad.isPresent.toString()} \n isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()} \n isConnected: ${pinPad.isConnected.toString()} \n isReady: ${pinPad.isReady.toString()} \n event: ${pinPad.event.toString()} ';
      });
    });

    controller.pdv.dataStream.stream.listen((CliSiTefData event) {
      if (kDebugMode) {
        print(event.buffer);
        print(event.event);
      }

      if (event.event == DataEvents.menuTitle) {
        controller.lastTitle = event.buffer;
      }

      if (event.event == DataEvents.messageCashier) {
        controller.lastMsgCashier = event.buffer;
      }

      if (event.event == DataEvents.messageCustomer) {
        controller.lastMsgCustomer = event.buffer;
      }

      if (event.event == DataEvents.messageCashierCustomer) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if (event.event == DataEvents.messageQrCode) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if ((event.event == DataEvents.showQrCodeField) ||
          (event.event == DataEvents.removeQrCodeField)) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if (event.event == DataEvents.confirmation) {
        controller.lastMsgCashierCustomer = 'Transação Cancelada';
        Future.delayed(const Duration(seconds: 2), () {
          controller.pdv.client.continueTransaction('0');
          Get.back();
        });
      }

      if (event.event == DataEvents.confirmGoBack) {
        controller.lastMsgCashierCustomer = 'Transação Cancelada';
        Future.delayed(const Duration(seconds: 2), () {
          controller.pdv.client.continueTransaction('0');
          Get.back();
        });
      }

      if (event.event == DataEvents.pressAnyKey) {
        controller.lastMsgCashierCustomer = event.buffer;
        Future.delayed(const Duration(seconds: 3), () {
          Get.back();
        });
      }

      if (event.event == DataEvents.abortRequest) {
        setState(() {
          controller.showAbortButton = true;
          if (controller.abortTransaction) {
            cancelCurrentTransaction();
            controller.showAbortButton = false;
            controller.abortTransaction = false;
          } else {
            controller.pdv.continueTransaction('1');
          }
        });
      } else {
        controller.showAbortButton = false;
      }

      if (event.event == DataEvents.getFieldInternal ||
          event.event == DataEvents.getField ||
          event.event == DataEvents.getFieldBarCode ||
          event.event == DataEvents.getFieldCurrency) {
        controller.pdv.continueTransaction('-1');
      }

      if (event.event == DataEvents.menuOptions) {
        controller.lastMsgCashierCustomer = event.buffer;
      }
      if (!mounted) return;

      setState(() {});
    });
  }

  void pinpad() async {
    try {
      await controller.pdv.isPinPadPresent();

      setState(() {
        PinPadInformation pinPad = controller.pdv.pinPadStream.pinPadInfo;
        if (pinPad.isPresent) {
          controller.pdv.client.setPinpadDisplayMessage('Flutter Clisitef');
        }
        controller.pinPadInfo = '''
             isPresent: ${pinPad.isPresent.toString()}
             isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()}
             isConnected: ${pinPad.isConnected.toString()}
             isReady: ${pinPad.isReady.toString()}
             event: ${pinPad.event.toString()}
            ''';
      });
      print(controller.pinPadInfo);
    } on Exception {
      if (kDebugMode) {
        print('Failed!');
      }
    }
  }

  void transaction() async {
    try {
      GetTotalValueMenu().getValue();
      setState(() {
        controller.dataReceived = [];
      });
      Stream<Transaction> paymentStream = await controller.pdv.payment(
        widget.pagamentoFormaSitef,
        menuController.total.value,
        cupomFiscal: '1',
        dataFiscal: DateTime.now(),
        restricoes: '[27;28]',
      );

      if (controller.isSimulated) {
        if (kDebugMode) {
          print('here is simulated');
        }
      }

      paymentStream.listen((Transaction transaction) {
        try {
          setState(() {
            if (controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('APROV'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('OK'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('Concluida'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('sucesso'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('bem'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('sucedi'.toUpperCase()) ||
                controller.lastMsgCashierCustomer
                    .toUpperCase()
                    .contains('aceit'.toUpperCase()) ||
                controller.transactionStatus ==
                    TransactionEvents.transactionConfirm) {
              controller.dataReceived.add(controller.pdv
                  .cliSitetRespMap[134]!); //Map com todos os campos retornados

              //campos mapeados em propriedades
              controller.dataReceived.add(controller.pdv.cliSiTefResp.nsuHost);
              controller.dataReceived
                  .add(controller.pdv.cliSiTefResp.viaCliente); // imprimir

              controller.dataReceived
                  .add(controller.pdv.cliSiTefResp.viaEstabelecimento);

              operacoes();
            }
          });
        } on Exception catch (e) {
          if (kDebugMode) {
            logger.e(e.toString());
          }
        }
      });
    } on Exception catch (e) {
      setState(() {
        controller.transactionStatus = TransactionEvents.transactionError;
      });
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
  }

  void operacoes() async {
    /* var xmlNfce = await PostNfce().postNfce(context, widget.paymentTypeNFCE);
    if (xmlNfce.isNotEmpty) {
      for (var i = 0; i < 6; i++) {
        Get.back();
      }

      var printXml = await PrintNfceXml().printNfceXml(xmlArgs: xmlNfce);
      while (printXml != true) {
        await Get.dialog(
          barrierDismissible: false,
          ComfirmPrint(
            function: () async {
              return await PrintNfceXml().printNfceXml(xmlArgs: xmlNfce);
            },
          ),
        );
      }*/

    var printCard = await PrintTransactionCard()
        .printTEF(controller.pdv.cliSiTefResp.viaCliente);
    while (printCard != true) {
      await Get.dialog(
        ComfirmPrint(
          function: () async {
            return await PrintTransactionCard()
                .printTEF(controller.pdv.cliSiTefResp.viaCliente);
          },
        ),
      );
    }

    bool printTab = await PrintTab().printTab();
    while (printTab != true) {
      printTab = await Get.dialog(
        ComfirmPrint(
          function: () async {
            return await PrintTab().printTab();
          },
        ),
      );
      //  }
    }
  }

  void cancelCurrentTransaction() async {
    try {
      await controller.pdv.client.abortTransaction(continua: 1);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  void cancel() async {
    try {
      await controller.pdv.cancelTransaction();
      setState(() {
        controller.dataReceived = [];
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Dependencies.cliSiTefController();

    // Constrói a imagem da logo no topo da page
    Widget _buildImage() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: Get.size.height * 0.04),
        child: Image.asset('assets/images/Logo Nova Branco Vertical.png'),
      );
    }

    // Constrói o texto
    Widget _buildText() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: Get.size.height * 0.05),
        child: SizedBox(
          width: Get.size.width * 0.7,
          child: const Text(
            'Aguarde as instruções da maquina de pagamento',
            style: CustomTextStyle.textButtonStyleWhite,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Constrói a imagem do pinpad e cartão
    Widget _buildIconPayment() {
      return Image.asset(
        'assets/images/icone_pagamento.png',
        color: Colors.white,
        scale: 2,
      );
    }

    Widget _buildResult() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: Get.size.height * 0.05),
        child: SizedBox(
          width: Get.size.width * 0.7,
          child: /* CashierCustomerWidget()
              .buildText(controller.lastMsgCashierCustomer),*/
              Text(
            controller.lastMsgCashierCustomer,
            style: CustomTextStyle.textButtonStyleWhite,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget _buildButtonBack() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: IconButton(
              onPressed: () {
                controller.pdv.client.continueTransaction('0');
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 40,
            ),
          ),
        ],
      );
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return Column(
        children: [
          _buildButtonBack(), // provisório para teste
          _buildImage(),
          _buildText(),
          _buildIconPayment(),
          _buildResult(),
        ],
      );
    }

    return Scaffold(
        body: Container(
      width: Get.size.width,
      height: Get.size.height,
      color: CustomColors.backSlider,
      child: _buildBody(),
    ));
  }
}*/