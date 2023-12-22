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
                          onPressed: () {},
                          child: const Text('Conectado'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Desconectado'),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.print,
                          color: Colors.black,
                        ),
                        Text('Impressora'),
                      ],
                    ),
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
