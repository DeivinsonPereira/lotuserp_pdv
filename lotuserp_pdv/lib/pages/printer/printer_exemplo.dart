import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:maisdecristo_token/screens/base/base.dart';
import 'package:maisdecristo_token/util/util_services.dart';

class Printerr extends StatefulWidget {
  const Printerr({Key? key}) : super(key: key);

  @override
  State<Printerr> createState() => _PrinterrState();
}

class _PrinterrState extends State<Printerr> {
  @override
  void initState() {
    if (Platform.isWindows) defaultPrinterType = PrinterType.usb;
    super.initState();
    portController.text = port;
    _scan();

    // subscription to listen change status of bluetooth connection
    subscriptionBtStatus =
        PrinterManager.instance.stateBluetooth.listen((status) {
      log(' ----------------- status bt $status ------------------ ');
      currentStatus = status;
      if (status == BTStatus.connected) {
        setState(() {
          isConnected = true;
        });
      }
      if (status == BTStatus.none) {
        setState(() {
          isConnected = false;
        });
      }
      if (status == BTStatus.connected && pendingTask != null) {
        if (Platform.isAndroid) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance
                .send(type: PrinterType.bluetooth, bytes: pendingTask!);
            pendingTask = null;
          });
        } else if (Platform.isIOS) {
          PrinterManager.instance
              .send(type: PrinterType.bluetooth, bytes: pendingTask!);
          pendingTask = null;
        }
      }
    });
    //  PrinterManager.instance.stateUSB is only supports on Android
    subscriptionUsbStatus = PrinterManager.instance.stateUSB.listen((status) {
      log(' ----------------- status usb $status ------------------ ');
      currentUsbStatus = status;
      if (Platform.isAndroid) {
        if (status == USBStatus.connected && pendingTask != null) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance
                .send(type: PrinterType.usb, bytes: pendingTask!);
            pendingTask = null;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    subscriptionBtStatus?.cancel();
    subscriptionUsbStatus?.cancel();
    portController.dispose();
    ipController.dispose();
    super.dispose();
  }

  // method to scan devices according PrinterType
  void _scan() {
    devices.clear();
    subscription = printerManager
        .discovery(type: defaultPrinterType, isBle: isBle)
        .listen((device) {
      devices.add(BluetoothPrinter(
        deviceName: device.name,
        address: device.address,
        isBle: isBle,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: defaultPrinterType,
      ));
      setState(() {});
    });
  }

  void setPort(String value) {
    if (value.isEmpty) value = '9100';
    port = value;
    var device = BluetoothPrinter(
      deviceName: value,
      address: ipAddress,
      port: port,
      typePrinter: PrinterType.network,
      state: false,
    );
    selectDevice(device);
  }

  void setIpAddress(String value) {
    ipAddress = value;
    var device = BluetoothPrinter(
      deviceName: value,
      address: ipAddress,
      port: port,
      typePrinter: PrinterType.network,
      state: false,
    );
    selectDevice(device);
  }

  void selectDevice(BluetoothPrinter device) async {
    if (selectedPrinter != null) {
      if ((device.address != selectedPrinter!.address) ||
          (device.typePrinter == PrinterType.usb &&
              selectedPrinter!.vendorId != device.vendorId)) {
        await PrinterManager.instance
            .disconnect(type: selectedPrinter!.typePrinter);
      }
    }

    selectedPrinter = device;
    setState(() {});
  }

  // conectar dispositivo
  _connectDevice() async {
    isConnected = false;
    if (selectedPrinter == null) return;
    switch (selectedPrinter!.typePrinter) {
      case PrinterType.usb:
        await printerManager.connect(
          type: selectedPrinter!.typePrinter,
          model: UsbPrinterInput(
            name: selectedPrinter!.deviceName,
            productId: selectedPrinter!.productId,
            vendorId: selectedPrinter!.vendorId,
          ),
        );
        isConnected = true;
        break;
      case PrinterType.bluetooth:
        await printerManager.connect(
          type: selectedPrinter!.typePrinter,
          model: BluetoothPrinterInput(
            name: selectedPrinter!.deviceName,
            address: selectedPrinter!.address!,
            isBle: selectedPrinter!.isBle ?? false,
            autoConnect: reconnect,
          ),
        );
        break;
      case PrinterType.network:
        await printerManager.connect(
          type: selectedPrinter!.typePrinter,
          model: TcpPrinterInput(
            ipAddress: selectedPrinter!.address!,
          ),
        );
        isConnected = true;
        break;
      default:
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF313233),
          title: const Text('Configurações'),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BaseScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: selectedPrinter == null || isConnected
                                ? null
                                : () {
                                    _connectDevice();
                                  },
                            child: const Text("Conectado",
                                textAlign: TextAlign.center),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: selectedPrinter == null || !isConnected
                                ? null
                                : () {
                                    if (selectedPrinter != null) {
                                      printerManager.disconnect(
                                          type: selectedPrinter!.typePrinter);
                                    }
                                    setState(() {
                                      isConnected = false;
                                    });
                                  },
                            child: const Text("Desconectado",
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownButtonFormField<PrinterType>(
                    value: defaultPrinterType,
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
                    items: <DropdownMenuItem<PrinterType>>[
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
                  Column(
                    children: devices
                        .map(
                          (device) => ListTile(
                            title: Text('${device.deviceName}'),
                            subtitle: Platform.isAndroid &&
                                    defaultPrinterType == PrinterType.usb
                                ? null
                                : Visibility(
                                    visible: !Platform.isWindows,
                                    child: Text("${device.address}")),
                            onTap: () {
                              // do something
                              selectDevice(device);
                            },
                            leading: selectedPrinter != null &&
                                    ((device.typePrinter == PrinterType.usb &&
                                                Platform.isWindows
                                            ? device.deviceName ==
                                                selectedPrinter!.deviceName
                                            : device.vendorId != null &&
                                                selectedPrinter!.vendorId ==
                                                    device.vendorId) ||
                                        (device.address != null &&
                                            selectedPrinter!.address ==
                                                device.address))
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : null,
                            trailing: OutlinedButton(
                              onPressed: selectedPrinter == null ||
                                      device.deviceName !=
                                          selectedPrinter?.deviceName
                                  ? null
                                  : () async {
                                      printReceiveTest();
                                    },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 20),
                                child: Text("Impressão Teste",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Visibility(
                    visible: defaultPrinterType == PrinterType.network &&
                        Platform.isWindows,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: ipController,
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                        decoration: const InputDecoration(
                          label: Text("Endereço de IP"),
                          prefixIcon: Icon(Icons.wifi, size: 24),
                        ),
                        onChanged: setIpAddress,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: defaultPrinterType == PrinterType.network &&
                        Platform.isWindows,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: portController,
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                        decoration: const InputDecoration(
                          label: Text("Porta"),
                          prefixIcon: Icon(Icons.numbers_outlined, size: 24),
                        ),
                        onChanged: setPort,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: defaultPrinterType == PrinterType.network &&
                        Platform.isWindows,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: OutlinedButton(
                        onPressed: () async {
                          if (ipController.text.isNotEmpty) {
                            setIpAddress(ipController.text);
                          }
                          printReceiveTest();
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 50),
                          child: Text("Impressão teste",
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BluetoothPrinter {
  int? id;
  String? deviceName;
  String? address;
  String? port;
  String? vendorId;
  String? productId;
  bool? isBle;

  PrinterType typePrinter;
  bool? state;

  BluetoothPrinter(
      {this.deviceName,
      this.address,
      this.port,
      this.state,
      this.vendorId,
      this.productId,
      this.typePrinter = PrinterType.bluetooth,
      this.isBle = false});
}
*/