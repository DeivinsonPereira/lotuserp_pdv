import 'dart:async';

import 'package:flutter_simple_bluetooth_printer/flutter_simple_bluetooth_printer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/default_printer.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/caixa.dart';
import '../collections/caixa_item.dart';
import '../collections/empresa.dart';
import '../collections/usuario_logado.dart';
import 'global_controller.dart';
import 'side_bar_controller.dart';

class PrinterController extends GetxController {
  var bluetoothManager = FlutterSimpleBluetoothPrinter.instance;
  var devices = <BluetoothDevice>[].obs;
  final isScanning = false.obs;
  var isConnected = true.obs;
  StreamSubscription<BTConnectState>? subscriptionBtStatus;
  BTConnectState currentStatus = BTConnectState.disconnect;

  BluetoothDevice? selectedPrinter;

  IsarService service = IsarService();

  //inicia o scan de dispositivos no bluetooth automaticamente
  @override
  Future<void> onInit() async {
    super.onInit();
    await scan();

    subscriptionBtStatus = bluetoothManager.connectState.listen((status) {
      currentStatus = status;
      if (status == BTConnectState.connected) {
        isConnected.value = true;
        update();
      }
      if (status == BTConnectState.disconnect ||
          status == BTConnectState.fail) {
        isConnected.value = false;
        update();
      }
    });

    //seleciona a impressora padrao

    await conectarImpressoraPadrao();
  }

  @override
  void dispose() {
    subscriptionBtStatus?.cancel();
    super.dispose();
  }

  Future<void> conectarImpressoraPadrao() async {
    // Recuperar o dispositivo padrão do banco de dados
    final defaultPrinter = await service.getDefaultPrinter();
    if (defaultPrinter == null) {
      // Não há dispositivo padrão configurado
      return;
    }

    // Conectar-se ao dispositivo padrão
    final devices = await bluetoothManager.getAndroidPairedDevices();
    try {
      final device = devices.firstWhere(
          (d) => d.address == defaultPrinter.address_printer_bluetooth);
      await bluetoothManager.connect(
          address: defaultPrinter.address_printer_bluetooth);
      selectedPrinter = device;
      update();
    } catch (e) {
      return;
    }
  }

  //procura os dispositivos no bluetooth
  Future<void> scan() async {
    devices.clear();

    try {
      isScanning.value = true;
      final bondedDevices = await bluetoothManager.getAndroidPairedDevices();
      devices.addAll(bondedDevices);
      update();
    } on BTException catch (e) {
      return;
    } finally {
      isScanning.value = false;
      update();
    }
  }

  //seleciona a impressora e salva no banco de dados como padrão
  void selectDevice(BluetoothDevice device) async {
    if (selectedPrinter != null) {
      if (device.address != selectedPrinter!.address) {
        await bluetoothManager.disconnect();
        update();
      }
    }
    selectedPrinter = device;
    update();

    final defaultPrinter = default_printer()
      ..address_printer_bluetooth = selectedPrinter!.address;
    await service.insertDefaultPrinter(defaultPrinter);
  }

  //conecta o dispositivo bluetooth
  connectDevice() async {
    if (selectedPrinter == null) return;
    try {
      isConnected.value =
          await bluetoothManager.connect(address: selectedPrinter!.address);
      update();
    } on BTException catch (e) {
      return;
    }
  }

  //faz uma impressão teste
  void print2X1Test() async {
    if (selectedPrinter == null) return;
    const name = "Vista Tecnologia\n\n\n";
    const teste = "teste 123\n\n\n";
    const espaco = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n';

    try {
      await connectDevice();
      if (!isConnected.value) return;
      await bluetoothManager.writeText(name);
      await bluetoothManager.writeText(teste);
      final isSuccess = await bluetoothManager.writeText(espaco);
      if (isSuccess) {
        await bluetoothManager.disconnect();
      }
      update();
    } on BTException {
      return;
    }
  }

  Future<void> print2x1OpenRegister(caixa_item caixaItem) async {
    SideBarController sideBarController = Get.find();
    GlobalController globalController;

    if (Get.isRegistered<GlobalController>()) {
      globalController = Get.find<GlobalController>();
    } else {
      globalController = Get.put(GlobalController());
    }

    if (Get.isRegistered<SideBarController>()) {
      sideBarController = Get.find<SideBarController>();
    } else {
      sideBarController = Get.put(SideBarController());
    }

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String nomeEmpresa = ''; // - ok
      String ruaEmpresa = ''; // - ok
      String numeroEmpresa = ''; // - ok
      String bairroEmpresa = ''; // - ok

      const typeMovimentation = 'ABERTURA DO CAIXA';

      var nameAndData =
          'LOTUS ERP PDV:  ${sideBarController.dateNowFormated.value}'; // - ok
      var hour = '               ${sideBarController.hours.value}'; // - ok

      String datatransacao = caixaItem.data.toString() ?? ''; // - ok
      //variaveis referente à caixaItem
      String registro = caixaItem.id.toString(); // - ok
      datatransacao = caixaItem.data.toString(); // - ok
      String horaTransacao = caixaItem.hora.toString(); // - ok
      String descricao = typeMovimentation; // - ok
      String valorCre = caixaItem.valor_cre.toString(); // - ok
      String valorDeb = caixaItem.valor_deb.toString(); // - ok
      String forma = ''; // - ok

      //variaveis referente a Caixa
      int idCaixa = 0; // - ok
      var usuario = ''; // - ok
      DateTime abertura = DateTime.now(); // - ok

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        nomeEmpresa = dataEmpresa.fantasia ?? '';
        ruaEmpresa = dataEmpresa.endereco ?? '';
        numeroEmpresa = dataEmpresa.cep ?? '';
        bairroEmpresa = dataEmpresa.bairro ?? '';
      }

      tipo_recebimento? tipoPagto =
          await service.search_tipoRecebimento(caixaItem.id_tipo_recebimento);

      if (tipoPagto != null) {
        forma = tipoPagto.descricao ?? '';
      }

      caixa? dataCaixa =
          await service.getCaixaWithIdUser(globalController.userId);
      usuario_logado? us = await service.getUserLogged();

      idCaixa = dataCaixa?.id_caixa ?? 0;
      usuario = us?.login ?? '';
      abertura = dataCaixa?.abertura_data ?? DateTime.now();

      await bluetoothManager.writeText('$nomeEmpresa \n');
      await bluetoothManager.writeText('$ruaEmpresa, $numeroEmpresa \n');
      await bluetoothManager.writeText('$bairroEmpresa \n');
      await bluetoothManager.writeText('\n ------------------------------- \n');
      await bluetoothManager.writeText('$nameAndData \n');
      await bluetoothManager.writeText('$hour \n');
      await bluetoothManager.writeText('\n ------------------------------- \n');
      await bluetoothManager.writeText('Registro: $registro \n');
      await bluetoothManager
          .writeText('Data: $datatransacao $horaTransacao \n');
      await bluetoothManager.writeText('Descrição: $descricao \n');
      await bluetoothManager.writeText('\n\n\n\n\n\n\n');
      await bluetoothManager.writeText('Valor CRE: $valorCre \n');
      await bluetoothManager.writeText('Valor DEB: $valorDeb \n');
      await bluetoothManager.writeText('Forma: $forma \n');
      await bluetoothManager.writeText('\n ------------------------------- \n');
      await bluetoothManager.writeText('ID Caixa: $idCaixa \n');
      await bluetoothManager.writeText('Usuário: $usuario \n');
      await bluetoothManager.writeText('Abertura: $abertura \n');
      await bluetoothManager
          .writeText('\n ------------------------------- \n\n\n\n\n\n\n');
      await bluetoothManager
          .writeText('\n --------------------------------- \n');
      await bluetoothManager.writeText('CONFERIDO POR: ');
      final isSuccess = await bluetoothManager.writeText('\n\n\n\n\n\n\n\n');

      if (isSuccess) {
        await bluetoothManager.disconnect();
      }
      update();
    } on BTException {
      return;
    }
  }
}
