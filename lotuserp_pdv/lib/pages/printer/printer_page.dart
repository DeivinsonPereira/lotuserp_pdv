import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class PrinterPage extends StatelessWidget {
  const PrinterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<PrinterController>(
      init: PrinterController(),
      initState: (_) {},
      builder: (controller) {
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
                              onPressed: controller.selectedPrinter == null ||
                                      !controller.isConnected.value
                                  ? null
                                  : () {
                                      controller.connectDevice();
                                    },
                              child: const Text('Conectado'),
                            ),
                            ElevatedButton(
                              onPressed: controller.selectedPrinter == null ||
                                      controller.isConnected.value
                                  ? null
                                  : () {
                                      if (controller.selectedPrinter != null) {
                                        controller.bluetoothManager
                                            .disconnect();
                                      }
                                      controller.isConnected.value = false;
                                    },
                              child: const Text('Desconectado'),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                controller.scan();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 20),
                                child: Text(
                                  "Rescan",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.isScanning.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: Column(
                                  children: controller.devices
                                      .map(
                                        (device) => SizedBox(
                                          width: size.width * 0.3,
                                          child: ListTile(
                                            leading:
                                                controller.isConnected.value &&
                                                        controller
                                                                .selectedPrinter
                                                                ?.name ==
                                                            device.name
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      )
                                                    : const SizedBox(
                                                        width: 0,
                                                        height: 0,
                                                      ),
                                            title: Text(device.name),
                                            subtitle: Text(device.address),
                                            onTap: () {
                                              // do something
                                              controller.selectDevice(device);
                                            },
                                            trailing: OutlinedButton(
                                              onPressed: controller
                                                              .selectedPrinter ==
                                                          null ||
                                                      device.name !=
                                                          controller
                                                              .selectedPrinter
                                                              ?.name
                                                  ? null
                                                  : () async {
                                                      controller.print2X1Test();
                                                    },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 20),
                                                child: Text("Print test",
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 75.0),
                        child: ElevatedButton(
                            onPressed: () {
                              controller.print2X1Test();
                            },
                            child: const Text('Teste impressora 58mm'),),
                      )
                    ]),
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
