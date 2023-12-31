import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_simple_bluetooth_printer/flutter_simple_bluetooth_printer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/default_printer.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/pages/common/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/pages/common/format_numbers.dart';
import 'package:lotuserp_pdv/pages/common/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/caixa.dart';
import '../collections/caixa_fechamento.dart';
import '../collections/caixa_item.dart';
import '../collections/empresa.dart';
import '../collections/produto.dart';
import '../collections/usuario_logado.dart';
import '../collections/venda.dart';
import '../collections/venda_item.dart';
import '../pages/payment/component/row_widget.dart';
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

  //cancela o scan
  @override
  void dispose() {
    subscriptionBtStatus?.cancel();
    super.dispose();
  }

  //conecta a impressora padrão e salva no banco de dados
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
    } on BTException {
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
  Future<void> connectDevice() async {
    if (selectedPrinter == null) return;
    try {
      isConnected.value =
          await bluetoothManager.connect(address: selectedPrinter!.address);
      update();
    } on BTException {
      return;
    }
  }

  //faz uma impressão teste
  Future<void> print2X1Test() async {
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

  //faz impressão da abertura do caixa (caso o valor seja superior a 0);
  Future<void> printOpenRegister(caixa_item caixaItem) async {
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    GlobalController globalController =
        InjectionDependencies.globalController();

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String nomeEmpresa = '';
      String ruaEmpresa = '';
      String numeroEmpresa = '';
      String bairroEmpresa = '';

      const typeMovimentation = 'ABERTURA DO CAIXA';

      var name = 'LOTUS ERP PDV:';
      var data = sideBarController.dateNowFormated.value;
      var hour = sideBarController.hours.value;

      //variaveis referente à caixaItem
      String registro = caixaItem.id.toString();
      var datatransacao = sideBarController.dateNowFormated.value;
      String horaTransacao = caixaItem.hora;
      String descricao = typeMovimentation;

      String valorCre = FormatNumbers.formatNumbertoString(caixaItem.valor_cre);
      String valorDeb = FormatNumbers.formatNumbertoString(caixaItem.valor_deb);
      String forma = '';

      //variaveis referente a Caixa
      int idCaixa = 0;
      var usuario = '';
      String? abertura = '';

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        nomeEmpresa = dataEmpresa.fantasia ?? '';
        ruaEmpresa = dataEmpresa.endereco ?? '';
        numeroEmpresa = dataEmpresa.numero ?? '';
        bairroEmpresa = dataEmpresa.bairro ?? '';
      }

      tipo_recebimento? tipoPagto =
          await service.search_tipoRecebimento(caixaItem.id_tipo_recebimento);

      if (tipoPagto != null) {
        forma = tipoPagto.descricao ?? '';
      }
      globalController.setIdUsuario();
      caixa? dataCaixa =
          await service.getCaixaWithIdUser(globalController.userId);
      usuario_logado? us = await service.getUserLogged();

      idCaixa = dataCaixa?.id_caixa ?? 0;
      usuario = us?.login ?? '';
      abertura = DatetimeFormatterWidget.formatDate(
          dataCaixa?.abertura_data ?? DateTime.now());

      bytes += generator.text(nomeEmpresa,
          styles: const PosStyles(align: PosAlign.left, bold: true));
      bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
      bytes += generator.text(bairroEmpresa);
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text(typeMovimentation,
          styles: const PosStyles(
              align: PosAlign.left, bold: true, width: PosTextSize.size2));
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('$name $data - $hour',
          styles: const PosStyles(align: PosAlign.left));
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('Registro: $registro');
      bytes += generator.text('Data: $datatransacao $horaTransacao');
      bytes += generator.text('Descricao: $descricao',
          styles: const PosStyles(codeTable: 'CP1252'));
      bytes += generator.text('');
      bytes += generator.text('Valor CRE: $valorCre');
      bytes += generator.text('Valor DEB: $valorDeb');
      bytes += generator.text('Forma: $forma');
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('ID Caixa: $idCaixa');
      bytes += generator.text('Usuario: $usuario',
          styles: const PosStyles(codeTable: 'CP1252'));
      bytes += generator.text('Abertura: $abertura');
      bytes += generator.text('-------------------------------------------- ',
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          '\n\n--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('CONFERIDO POR: ');
      bytes += generator.text('\n\n');

      /*print('A impressão está comentada');
      String textToPrint = String.fromCharCodes(bytes);
      await bluetoothManager.writeText(textToPrint);*/
    } on BTException {
      return;
    }
  }

  //faz impressão da movimentação do caixa
  Future<void> printMovimentationCaixa(caixaItem) async {
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    GlobalController globalController =
        InjectionDependencies.globalController();

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String nomeEmpresa = '';
      String ruaEmpresa = '';
      String numeroEmpresa = '';
      String bairroEmpresa = '';

      const typeMovimentation = 'MOVIMENTACAO CAIXA';

      var name = 'LOTUS ERP PDV:';
      var data = sideBarController.dateNowFormated.value;
      var hour = sideBarController.hours.value;

      //variaveis referente à caixaItem
      String registro = caixaItem.id.toString();
      var datatransacao = sideBarController.dateNowFormated.value;
      String horaTransacao = caixaItem.hora;
      String descricao = caixaItem.descricao;

      String valorCre = FormatNumbers.formatNumbertoString(caixaItem.valor_cre);
      String valorDeb = FormatNumbers.formatNumbertoString(caixaItem.valor_deb);
      String forma = '';

      //variaveis referente a Caixa
      int? idCaixa = 0;
      var usuario = '';
      String? abertura = '';

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        nomeEmpresa = dataEmpresa.fantasia ?? '';
        ruaEmpresa = dataEmpresa.endereco ?? '';
        numeroEmpresa = dataEmpresa.numero ?? '';
        bairroEmpresa = dataEmpresa.bairro ?? '';
      }

      tipo_recebimento? tipoPagto =
          await service.search_tipoRecebimento(caixaItem.id_tipo_recebimento);

      if (tipoPagto != null) {
        forma = tipoPagto.descricao ?? '';
      }
      globalController.setIdUsuario();
      caixa? dataCaixa =
          await service.getCaixaWithIdUser(globalController.userId);
      usuario_logado? us = await service.getUserLogged();

      idCaixa = await service.getCaixaIdWithIdUserAndStatus0();
      usuario = us?.login ?? '';
      abertura = DatetimeFormatterWidget.formatDate(dataCaixa!.abertura_data);

      bytes += generator.text(nomeEmpresa,
          styles: const PosStyles(align: PosAlign.left, bold: true));
      bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
      bytes += generator.text(bairroEmpresa);
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text(typeMovimentation,
          styles: const PosStyles(
              align: PosAlign.left, bold: true, width: PosTextSize.size2));
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('$name $data - $hour',
          styles: const PosStyles(align: PosAlign.left));
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('Registro: $registro');
      bytes += generator.text('Data: $datatransacao $horaTransacao');
      bytes += generator.text('Descricao: $descricao',
          styles: const PosStyles(codeTable: 'CP1252'));
      bytes += generator.text('');
      bytes += generator.text('Valor CRE: $valorCre');
      bytes += generator.text('Valor DEB: $valorDeb');
      bytes += generator.text('Forma: $forma');
      bytes += generator.text('--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('ID Caixa: $idCaixa');
      bytes += generator.text('Usuario: $usuario',
          styles: const PosStyles(codeTable: 'CP1252'));
      bytes += generator.text('Abertura: $abertura');
      bytes += generator.text('-------------------------------------------- ',
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          '\n\n--------------------------------------------',
          styles: const PosStyles(bold: true));
      bytes += generator.text('CONFERIDO POR: ');
      bytes += generator.text('\n\n');

      /*print('A impressão da movimentação de caixa está comentada');
      String textToPrint = String.fromCharCodes(bytes);
      await bluetoothManager.writeText(textToPrint);*/
    } on BTException {
      return;
    }
  }

  //Faz a impressão do fechamento do caixa
  Future<void> printCloseCaixa(List<caixa_fechamento> fechamento) async {
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    InjectionDependencies.globalController();

    final profile = await CapabilityProfile.load();
    final generator = Generator(
      PaperSize.mm80,
      profile,
    );

    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String nomeEmpresa = '';
      String ruaEmpresa = '';
      String numeroEmpresa = '';
      String bairroEmpresa = '';

      const typeMovimentation = 'PRE-FECHAMENTO CAIXA';

      var name = 'LOTUS ERP PDV:';
      var data = sideBarController.dateNowFormated.value;
      var hour = sideBarController.hours.value;

      //variaveis referente a Caixa
      int? idCaixa = 0;
      var usuario = '';
      String? abertura = '';

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        nomeEmpresa = dataEmpresa.fantasia ?? '';
        ruaEmpresa = dataEmpresa.endereco ?? '';
        numeroEmpresa = dataEmpresa.numero ?? '';
        bairroEmpresa = dataEmpresa.bairro ?? '';
      }
      usuario_logado? us = await service.getUserLogged();

      idCaixa = await service.getCaixaIdWithIdUserAndStatus0();
      usuario = us?.login ?? '';
      var caixaObjeto = await service.getCaixaWithIdUserAndStatus0();
      abertura = DatetimeFormatterWidget.formatDate(caixaObjeto!.abertura_data);
      caixa? aberturaCaixaItemValue = await service.getCaixaItemValue();

      double totalInformado = 0.0;
      var descricao = 'Descricao';
      var informado = 'Informado';
      var totalGrupo = 'Total Grupo';

      int numeroCaracteres1 = 23 - descricao.length;
      int numeroCaracteres2 = 23 - informado.length;

      int numeroCaracteresTotGrupo = 23 - totalGrupo.length;

      var tipoPagto = [];
      for (int i = 0; i < fechamento.length; i++) {
        totalInformado += fechamento[i].valor_informado!;

        tipo_recebimento? tipos = await service
            .search_tipoRecebimento(fechamento[i].id_tipo_recebimento);
        tipoPagto.add(tipos!.descricao);
      }
      /*  String totalInformadoStr = totalInformado;*/

      //formatação da impressão
      bytes += generator.text(nomeEmpresa,
          styles: const PosStyles(align: PosAlign.left, bold: true));
      bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
      bytes += generator.text(bairroEmpresa);
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes += generator.text(typeMovimentation,
          styles: const PosStyles(
              align: PosAlign.left, bold: true, width: PosTextSize.size2));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes += generator.text('$name $data - $hour',
          styles: const PosStyles(align: PosAlign.left));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      //
      //
      bytes += generator.text('ABERTURA', styles: const PosStyles(bold: true));
      bytes += generator.text('ID Caixa: $idCaixa');
      bytes += generator.text('Usuario: $usuario',
          styles: const PosStyles(codeTable: 'CP1252'));
      bytes += generator.text('Abertura: $abertura');
      bytes += generator.text(
        'Valor:           ${formatoBrasileiro.format(aberturaCaixaItemValue?.abertura_valor)}',
      );
      //
      //
      bytes += generator.text('\nRESUMO MOVIMENTACAO',
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          'Descricao${''.padRight(numeroCaracteres1)}${''.padLeft(numeroCaracteres2)}Informado',
          styles: const PosStyles(bold: true));

      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      //
      //
      for (var i = 0; i < fechamento.length; i++) {
        var informado = formatoBrasileiro.format(fechamento[i].valor_informado);

        int numeroCaracteres1 = 23 - tipoPagto[i].toString().length;
        int numeroCaracteres2 = 23 - informado.length;

        bytes += generator.text(tipoPagto[i] +
            ''.padRight(numeroCaracteres1) +
            ''.padLeft(numeroCaracteres2) +
            formatoBrasileiro.format(fechamento[i].valor_informado));
      }

      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      int totInformado = 23 - formatoBrasileiro.format(totalInformado).length;
      bytes += generator.text(
          totalGrupo +
              ''.padRight(numeroCaracteresTotGrupo) +
              ''.padLeft(totInformado) +
              formatoBrasileiro.format(totalInformado),
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          '________________________________________________\n\n',
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes +=
          generator.text('FECHAMENTO', styles: const PosStyles(bold: true));
      bytes += generator.text('      Data:');
      bytes += generator.text('\n');
      bytes += generator.text('CONFERIDO EM: ___/___/_______');
      bytes +=
          generator.text('  CONFERENTE: _______________________________\n\n');

      /*print('A impressão da movimentação de caixa está comentada');
      String textToPrint = String.fromCharCodes(bytes);
      await bluetoothManager.writeText(textToPrint);*/
    } on BTException {
      return;
    }
  }

  //Faz a impressão (espelho) da venda
  Future<void> printVendas(venda venda, List<venda_item> vendaItens) async {
    SideBarController sideBarController =
        InjectionDependencies.sidebarController();
    InjectionDependencies.globalController();

    final profile = await CapabilityProfile.load();
    final generator = Generator(
      PaperSize.mm80,
      profile,
    );

    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String idEmpresa = '';
      String nomeEmpresa = '';

      const typeMovimentation = 'ESPELHO DE CONFERENCIA';

      var name = 'LOTUS ERP PDV:';
      var data = sideBarController.dateNowFormated.value;
      var hour = sideBarController.hours.value;

      //variaveis referente a Caixa
      int? idCaixa = 0;
      var usuario = '';
      String? abertura = '';

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        idEmpresa = dataEmpresa.id.toString().padLeft(6, '0').substring(0, 6);
        nomeEmpresa = dataEmpresa.fantasia ?? '';
      }
      usuario_logado? us = await service.getUserLogged();
      usuario = us?.login ?? '';

      var descricao = 'Descricao';
      var informado = 'Informado';
      var totalGrupo = 'Total Grupo';

      int numeroCaracteres1 = 23 - descricao.length;
      int numeroCaracteres2 = 23 - informado.length;

      int numeroCaracteresTotGrupo = 23 - totalGrupo.length;

      //formatação da impressão
      bytes += generator.text('$name $data - $hour',
          styles: const PosStyles(align: PosAlign.left));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      //
      //
      //
      bytes += generator.text(typeMovimentation,
          styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text('DOCUMENTO SEM VALOR FISCAL',
          styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      //
      //

      bytes += generator.text(nomeEmpresa,
          styles: const PosStyles(align: PosAlign.left, bold: true));
      bytes += generator.text(idEmpresa);
      bytes += generator
          .text(venda.id_venda.toString().padLeft(6, '0').substring(0, 6));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      //
      //
      bytes += generator.text('ITEM  Descricao');
      bytes += generator.text('ID Caixa: $idCaixa');
      bytes += generator.text(
          '${''.padRight(10)}Qtde${''.padRight(10)}Unitario${''.padRight(10)}Total');
      print(
          '${''.padRight(10)}Qtde${''.padRight(10)}Unitario${''.padRight(10)}Total');

      for (var i = 0; i < vendaItens.length; i++) {
        
        produto? produtos =
            await service.searchProdutoById(vendaItens[i].id_produto);

        bytes += generator.text(
            '${i.toString().padLeft(3, '0').substring(0, 3)} ${vendaItens[i].id} ${produtos!.descricao}',
            maxCharsPerLine: 58);
        bytes += generator.text(
            '${''.padRight(10)}${vendaItens[i].qtde}${''.padRight(10)}${formatoBrasileiro.format(produtos.pvenda)}${''.padRight(10)}${venda.tot_bruto}');
        print(
            '${''.padRight(10)}${vendaItens[i].qtde}${''.padRight(10)}${formatoBrasileiro.format(produtos.pvenda)}${''.padRight(10)}${venda.tot_bruto}');
      }

      int lengthTotBruto = 'Total Bruto(=):'.length;
      int lenghtDescontos = 'Descontos(-):'.length;
      int lenghtTotalLiquido = 'Total Liquido(=):'.length;
      int lenghtInformado = 'Informado(=):'.length;
      int lenghtTroco = 'Troco(=):'.length;

      int lenghtTotBruto = venda.tot_bruto.toString().length;
      int lenghtDescontosPercent = venda.tot_desc_prc.toStringAsFixed(2).length;
      int lenghtDescontosReais =
          formatoBrasileiro.format(venda.tot_desc_vlr).length;
      int lenghtTotLiquido = formatoBrasileiro.format(venda.tot_liquido).length;
      int lenghtValorInformado = 0;

      String valueInformado =
          formatoBrasileiro.format(venda.tot_liquido + venda.valor_troco);

      lenghtValorInformado += formatoBrasileiro
          .format(venda.tot_liquido + venda.valor_troco)
          .length;

      bytes += generator.text('Total Bruto(=):',
          styles: const PosStyles(bold: true));

      //
      //
      /*
      
*/

      /*print('A impressão da movimentação de caixa está comentada');
      String textToPrint = String.fromCharCodes(bytes);
      await bluetoothManager.writeText(textToPrint);*/
    } on BTException {
      return;
    }
  }
}
