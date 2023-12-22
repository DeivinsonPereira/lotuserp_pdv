import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class PrinterPage extends StatelessWidget {
  const PrinterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PrinterController printerController = Get.put(PrinterController());

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed:
                              printerController.selectedPrinter == null ||
                                      printerController.isConnected.value
                                  ? null
                                  : () {
                                      printerController.connectDevice();
                                    },
                          child: const Text('Conectado'),
                        ),
                        ElevatedButton(
                          onPressed: printerController.selectedPrinter ==
                                      null ||
                                  !printerController.isConnected.value
                              ? null
                              : () {
                                  if (printerController.selectedPrinter !=
                                      null) {
                                    printerController.bluetoothManager
                                        .disconnect();
                                  }
                                  printerController.isConnected.value = false;
                                },
                          child: const Text('Desconectado'),
                        ),
                      ],
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.print,
                        size: 24,
                      ),
                      labelText: "Tipo de Impressora",
                      labelStyle: TextStyle(fontSize: 18.0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    items: <DropdownMenuItem>[
                      if (Platform.isAndroid || Platform.isIOS)
                        const DropdownMenuItem(
                          value: PrinterType.bluetooth,
                          child: Text("bluetooth"),
                        ),
                      if (Platform.isAndroid || Platform.isWindows)
                        const DropdownMenuItem(
                          value: PrinterType.usb,
                          child: Text("usb"),
                        ),
                      const DropdownMenuItem(
                        value: PrinterType.network,
                        child: Text("Wifi"),
                      ),
                    ],
                    onChanged: (PrinterType? value) {
                      setState(() {
                        if (value != null) {
                          setState(() {
                            defaultPrinterType = value;
                            selectedPrinter = null;
                            isBle = false;
                            isConnected = false;
                            _scan();
                          });
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text('Nome da Impressora'),
                              Text('Horario da conexão'),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Impressão Teste'),
                          ),
                        ]),
                  )
                ]),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
