import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/injection_dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/dado_empresa.dart';
import '../pages/common/custom_snack_bar.dart';
import '../pages/common/loading_screen.dart';
import 'text_field_controller.dart';

class Configcontroller extends GetxController {
  IsarService service = IsarService();
  var logger = Logger();
  TextFieldController textFieldController = Dependencies.textFieldController();

  @override
  void onInit() {
    super.onInit();
    fetchDataFromDatabase('IP');
    fetchDataFromDatabase('ID da empresa');
    fetchDataFromDatabase('ID da serie NFCe');
    fetchDataFromDatabase('Número do caixa');
    fetchDataFromDatabase('Intervalo de envio');
  }

  //Busca dados do banco para preencher os campos de texto
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

  Future<bool> buscarDadosEmpresa(String ipEmpresa, String idEmpresa) async {
    try {
      var empresaObtida = await service.getEmpresa(idEmpresa, ipEmpresa);
      if (empresaObtida != null) {
        dado_empresa dadosEmpresa = dado_empresa()
          ..id_empresa = int.parse(textFieldController.idEmpresaController.text)
          ..id_nfce = int.parse(textFieldController.idSerieNfceController.text)
          ..num_caixa = int.parse(textFieldController.numCaixaController.text)
          ..intervalo_envio =
              int.parse(textFieldController.intervaloEnvioController.text)
          ..ip_empresa = ipEmpresa;
        await service.insertDadosEmpresariais(dadosEmpresa);
        return true; // Retorna verdadeiro se a empresa for obtida e inserida com sucesso.
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
        return false;
      }
    } catch (e) {
      CustomSnackBar(
          message: "Ocorreu um erro ao buscar os dados da empresa: $e");
      return false;
    }
  }

  Future<void> buscarOutrosDados() async {
    await service.getGrupo();
    await service.getProduto();
    await service.getUsuarios();
    await service.getTipo_recebimento();
  }

  Future<void> esperarDadosEmpresaEChamarOutrosDados(int tentativas) async {
    while (tentativas > 0) {
      await Future.delayed(const Duration(seconds: 1));
      var empresaCount = await service.empresaCount();
      if (empresaCount > 0) {
        await buscarOutrosDados();
        break;
      }
      tentativas--;
    }
    if (tentativas == 0) {
      const CustomSnackBar(message: 'Erro ao esperar pelos dados da empresa.');
    }
  }

  Future<void> confirmarDados() async {
    var ipEmpresa = textFieldController.numContratoEmpresaController.text;
    var idEmpresa = textFieldController.idEmpresaController.text;

    if (ipEmpresa.isNotEmpty && !ipEmpresa.isBlank!) {
      var sucesso = await buscarDadosEmpresa(ipEmpresa, idEmpresa);
      if (sucesso) {
        Get.dialog(const LoadingScreen(), barrierDismissible: false);
        await esperarDadosEmpresaEChamarOutrosDados(3); // Tentar 3 vezes
        Get.back(); // Fecha a tela de loading
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
      }
    } else {
      const CustomSnackBar(
          message: "O IP da empresa é obrigatório e deve ser válido.");
    }
  }

  //verificações de campos obrigatórios
  bool verificacoes() {
    if (textFieldController.numContratoEmpresaController.text.isEmpty) {
      const CustomSnackBar(
        message: 'IP obrigatório',
      ).show();
      return true;
    } else if (textFieldController.idEmpresaController.text.isEmpty) {
      const CustomSnackBar(
        message: 'ID da empresa obrigatório',
      ).show();
      return true;
    } else if (textFieldController.idSerieNfceController.text.isEmpty) {
      const CustomSnackBar(
        message: 'ID da serie NFCe obrigatório',
      ).show();
      return true;
    } else if (textFieldController.numCaixaController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Numero do caixa obrigatorio',
      ).show();
      return true;
    } else if (textFieldController.intervaloEnvioController.text.isEmpty) {
      const CustomSnackBar(
        message: 'intervalo de envio obrigatorio',
      ).show();
      return true;
    } else {
      Get.back();
      return false;
    }
  }

  // faz a verificação se os campos estão vazios
  Future<void> verification(
    TextEditingController controller,
  ) async {
    if (controller.text.isEmpty) {
      const CustomSnackBar(
        message: 'O campo obrigatório',
      ).show();
    } else {
      textFieldController.salvarInformacoesContrato();
      String ip = await service.getIpEmpresa(isCorrectUrl: true);
      if (ip.isNotEmpty) {
        textFieldController.updateNumeroContratoToIp(ip);
        controller.text = textFieldController.numContratoEmpresa;
      }
    }
  }
}
