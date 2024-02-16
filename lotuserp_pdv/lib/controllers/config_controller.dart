// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry_error.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/dado_empresa.dart';
import '../pages/common/loading_screen.dart';
import '../repositories/download_persist_images_repository.dart';
import 'text_field_controller.dart';

class Configcontroller extends GetxController {
  IsarService service = IsarService();
  var logger = Logger();
  TextFieldController textFieldController = Dependencies.textFieldController();

  var balanca = 'NENHUMA'.obs;
  var velocidadeBalanca = ''.obs;
  var nomeBalanca = ''.obs;
  var tef = 'NENHUMA'.obs;
  var tamanhoImpressora = '80mm'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromDatabase('IP');
    fetchDataFromDatabase('ID da empresa');
    fetchDataFromDatabase('ID da serie NFCe');
    fetchDataFromDatabase('Número do caixa');
    fetchDataFromDatabase('Intervalo de envio');
    loadBalanca();
    loadSpeedBalance();
    loadTef();
    loadNameBalance();
    loadSizePrinter();
  }

  //UPDATE TAMANHO IMPRESSORA
  void updateTamanhoImpressora(String value) {
    tamanhoImpressora.value = value;
    update();
  }

  // BUSCAR OS DADOS DO BANCO E PREENCHER OS CAMPOS
  Future<void> fetchDataFromDatabase(String variableName) async {
    try {
      final dado_empresa? dadoEmpresa =
          await service.getIpEmpresaFromDatabase();
      if (dadoEmpresa == null || dadoEmpresa.ip_empresa == null) {
        service.deleteDadosEmpresariais();
        return;
      }

      final controllers = {
        'IP': textFieldController.numContratoEmpresaController,
        'ID da empresa': textFieldController.idEmpresaController,
        'ID da serie NFCe': textFieldController.idSerieNfceController,
        'Número do caixa': textFieldController.numCaixaController,
        'Intervalo de envio': textFieldController.intervaloEnvioController,
      };

      final values = {
        'IP': dadoEmpresa.ip_empresa,
        'ID da empresa': dadoEmpresa.id_empresa,
        'ID da serie NFCe': dadoEmpresa.id_nfce,
        'Número do caixa': dadoEmpresa.num_caixa,
        'Intervalo de envio': dadoEmpresa.intervalo_envio,
      };

      controllers[variableName]?.text = values[variableName]?.toString() ?? '';
    } catch (e) {
      logger.e('Erro ao buscar dados da empresa: $e');
    }
  }

  // BUSCAR DADOS DA EMPRESA
  Future<bool> buscarDadosEmpresa(
      String ipEmpresa, String idEmpresa, BuildContext context) async {
    bool campoVazio = false;
    if (textFieldController.velocidadeBalancaController.text.isBlank == false &&
        textFieldController.velocidadeBalancaController.text.isNotEmpty &&
        textFieldController.velocidadeBalancaController.text != '') {
      velocidadeBalanca.value =
          textFieldController.velocidadeBalancaController.text;
      campoVazio = true;
    }

    try {
      var empresaObtida =
          await service.getEmpresa(idEmpresa, ipEmpresa, context);
      if (empresaObtida != null) {
        dado_empresa dadosEmpresa = dado_empresa()
          ..id_empresa = int.parse(textFieldController.idEmpresaController.text)
          ..id_nfce = int.parse(textFieldController.idSerieNfceController.text)
          ..num_caixa = int.parse(textFieldController.numCaixaController.text)
          ..intervalo_envio =
              int.parse(textFieldController.intervaloEnvioController.text)
          ..ip_empresa = ipEmpresa
          ..balanca = balanca.value
          ..status_balanca = balanca.value != 'NENHUMA' ? 1 : 0
          ..tef = tef.value
          ..status_tef = tef.value != 'NENHUMA' ? 1 : 0
          ..velocidade_balanca = campoVazio == true
              ? int.parse(textFieldController.velocidadeBalancaController.text)
              : 0
          ..nome_balanca = textFieldController.nomeBalancaController.text != ''
              ? textFieldController.nomeBalancaController.text
              : ''
          ..tamanho_impressora = tamanhoImpressora.value;

        await service.insertDadosEmpresariais(context, dadosEmpresa);
        return true; // Retorna verdadeiro se a empresa for obtida e inserida com sucesso.
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
        return false;
      }
    } catch (e) {
      CustomCherryError(
              message: "Ocorreu um erro ao buscar os dados da empresa: $e")
          .show(context);
      return false;
    }
  }

  // BUSCAR OUTROS DADOS
  Future<void> buscarOutrosDados(BuildContext context) async {
    await service.getGrupo(context);
    await service.getProduto(context);
    await service.getUsuarios(context);
    await service.getTipo_recebimento(context);
    await downloadImageGroup();
    await downloadImageProduct();
    await persistImagesInformationGroup();
    await persistImagesInformationProduct();
    /*await checkFileExists();*/
    await listDirectiories();
  }

  // ESPERAR DADOS DA EMPRESA E CHAMAR OUTROS DADOS
  Future<void> esperarDadosEmpresaEChamarOutrosDados(
      int tentativas, BuildContext context) async {
    while (tentativas > 0) {
      await Future.delayed(const Duration(seconds: 1));
      var empresaCount = await service.empresaCount();
      if (empresaCount > 0) {
        await buscarOutrosDados(context);
        break;
      }
      tentativas--;
    }
    if (tentativas == 0) {
      const CustomCherryError(
              message: 'Erro ao esperar pelos dados da empresa.')
          .show(context);
    }
  }

  // CONFIRMAR DADOS
  Future<void> confirmarDados(BuildContext context) async {
    var ipEmpresa = textFieldController.numContratoEmpresaController.text;
    var idEmpresa = textFieldController.idEmpresaController.text;

    if (ipEmpresa.isNotEmpty && !ipEmpresa.isBlank!) {
      var sucesso = await buscarDadosEmpresa(ipEmpresa, idEmpresa, context);
      if (sucesso) {
        Get.dialog(const LoadingScreen(), barrierDismissible: false);
        await esperarDadosEmpresaEChamarOutrosDados(
            3, context); // Tentar 3 vezes
        Get.back(); // Fecha a tela de loading
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
      }
    } else {
      const CustomCherryError(
              message: "O IP da empresa é obrigatório e deve ser válido.")
          .show(context);
    }
  }

  // VERIFICAR SE OS CAMPOS FORAM PREENCHIDOS
  bool verificacoes(BuildContext context) {
    if (textFieldController.numContratoEmpresaController.text.isEmpty) {
      const CustomCherryError(
        message: 'IP obrigatório',
      ).show(context);
      return true;
    } else if (textFieldController.idEmpresaController.text.isEmpty) {
      const CustomCherryError(
        message: 'ID da empresa obrigatório',
      ).show(context);
      return true;
    } else if (textFieldController.idSerieNfceController.text.isEmpty) {
      const CustomCherryError(
        message: 'ID da serie NFCe obrigatório',
      ).show(context);
      return true;
    } else if (textFieldController.numCaixaController.text.isEmpty) {
      const CustomCherryError(
        message: 'Numero do caixa obrigatorio',
      ).show(context);
      return true;
    } else if (textFieldController.intervaloEnvioController.text.isEmpty) {
      const CustomCherryError(
        message: 'intervalo de envio obrigatorio',
      ).show(context);
      return true;
    } else {
      Get.back();
      return false;
    }
  }

  // VERIFICAR SE OS CAMPO DE NUMERO DO CONTRATO FOI PREENCHIDO
  Future<void> verificationEmpty(
      TextEditingController controller, BuildContext context) async {
    if (controller.text.isEmpty) {
      const CustomCherryError(
        message: 'O campo obrigatório',
      ).show(context);
    } else {
      textFieldController.salvarInformacoesContrato();
      String ip = await service.getIpEmpresa(context, isCorrectUrl: true);
      if (ip.isNotEmpty) {
        textFieldController.updateNumeroContratoToIp(ip);
        controller.text = textFieldController.numContratoEmpresa;
      }
    }
  }

  // ATUALIZAR VARIAVEL BALANCA
  void updateBalanca(String value) {
    balanca.value = value;
    update();
  }

  // ATUALIZA O NOME DA BALANCA CONECTADA NO USB
  void updateNomeBalanca(String value) {
    nomeBalanca.value = value;
    update();
  }

  // ATUALIZAR VARIAVEL TEF
  void updateTef(String value) {
    tef.value = value;
    update();
  }

  // CARREGA DADOS DA EMPRESA BUSCANDO NOME DA BALANÇA CADASTRADA
  Future<void> loadBalanca() async {
    dado_empresa? balancaFromDb = await service.getDataEmpresa();
    if (balancaFromDb != null &&
        balancaFromDb.balanca != null &&
        balancaFromDb.balanca!.isNotEmpty) {
      balanca.value = balancaFromDb.balanca!;
      update();
    } else {
      balanca.value = 'NENHUMA';
      update();
    }
  }

  // CARREGA DADOS DA EMPRESA BUSCANDO NOME DO TEF CADASTRADO
  Future<void> loadTef() async {
    dado_empresa? tefFromDb = await service.getDataEmpresa();
    if (tefFromDb != null &&
        tefFromDb.tef != null &&
        tefFromDb.tef!.isNotEmpty) {
      tef.value = tefFromDb.tef!;
      update();
    } else {
      tef.value = 'NENHUMA';
      update();
    }
  }

  // CARREGA DADOS DA EMPRESA BUSCANDO VELOCIDADE DA BALANÇA CADASTRADO
  Future<void> loadSpeedBalance() async {
    dado_empresa? speedBalanceDb = await service.getDataEmpresa();
    if (speedBalanceDb != null && speedBalanceDb.velocidade_balanca != null) {
      textFieldController.velocidadeBalancaController.text =
          speedBalanceDb.velocidade_balanca!.toString();
      update();
    } else {
      textFieldController.velocidadeBalancaController.text = '';
      update();
    }
  }

  // CARREGA O NOME DA BALANCA CADASTRADA
  Future<void> loadNameBalance() async {
    dado_empresa? nameBalanceDb = await service.getDataEmpresa();
    if (nameBalanceDb != null && nameBalanceDb.nome_balanca != null) {
      textFieldController.nomeBalancaController.text =
          nameBalanceDb.nome_balanca!;
      update();
    } else {
      textFieldController.nomeBalancaController.text = '';
      update();
    }
  }

  // CARREGA O TAMANHO DA IMPRESSORA CADASTRADA
  Future<void> loadSizePrinter() async {
    dado_empresa? tamanhoImpressoraDb = await service.getDataEmpresa();
    if (tamanhoImpressoraDb != null &&
        tamanhoImpressoraDb.tamanho_impressora != null) {
      tamanhoImpressora.value = tamanhoImpressoraDb.tamanho_impressora!;
      print(tamanhoImpressora.value);
      update();
    } else {
      tamanhoImpressora.value = '';
      update();
    }
  }
}
