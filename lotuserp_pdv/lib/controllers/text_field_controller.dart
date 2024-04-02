// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../services/dependencies.dart';
import 'empresa_valida_controller.dart';

class TextFieldController extends GetxController {
  IsarService service = IsarService();

  // controllers que serão usados para o cadastro de informações de configuração.
  TextEditingController ipController = TextEditingController();
  TextEditingController idEmpresaController = TextEditingController();
  TextEditingController idSerieNfceController = TextEditingController();
  TextEditingController numCaixaController = TextEditingController();
  TextEditingController intervaloEnvioController = TextEditingController();
  TextEditingController velocidadeBalancaController = TextEditingController();
  TextEditingController nomeBalancaController = TextEditingController();
  TextEditingController tamanhoImpressoraController = TextEditingController();

  TextEditingController numContratoEmpresaController = TextEditingController();

  Logger logger = Logger();

  // variáveis que serão usadas para o cadastro de informações de configuração.
  late String numContratoEmpresa = '';
  late String ip = '';
  late String idEmpresa = '';
  late String idSerieNfce = '';
  late String numCaixa = '';
  late String intervaloEnvio = '';

  // salvar informações nas variaveis.
  Future<void> salvarInformacoes(BuildContext context) async {
    try {
      ip = numContratoEmpresaController.text;
      final dado_empresa? dadoEmpresa =
          await service.getIpEmpresaFromDatabase();
      if (dadoEmpresa != null &&
          !numContratoEmpresaController.text.isNotEmpty) {
        ip = dadoEmpresa.ip_empresa!.toString();
      }
      idEmpresa = idEmpresaController.text;
      idSerieNfce = idSerieNfceController.text;
      numCaixa = numCaixaController.text;
      intervaloEnvio = intervaloEnvioController.text;
    } catch (e) {
      logger.e('Erro ao salvar as informações: $e');
    }
  }

  // salvar dados de contrato
  void salvarInformacoesContrato() {
    EmpresaValidaController empresaValidaController =
        Dependencies.empresaValidaController();
    numContratoEmpresa = empresaValidaController.empresaContratoController.text;
  }

  // atualizar dados de contrato
  void updateNumeroContratoToIp(String value) {
    numContratoEmpresa = value;
  }

  // limpar os campos de contrato.
  void limparCamposContrato() {
    numContratoEmpresaController.clear();
  }

  // limpar os campos.
  void limparCampos() {
    ipController.clear();
    idEmpresaController.clear();
    idSerieNfceController.clear();
    numCaixaController.clear();
    intervaloEnvioController.clear();
  }

  // atualizar Ip.
  void updateIp(String value) {
    ip = value;
  }

  // atualizar Id da empresa.
  void updateIdEmpresa(String value) {
    idEmpresa = value;
  }

  // atualizar Id Serie Nfce.
  void updateIdSerieNfce(String value) {
    idSerieNfce = value;
  }

  // atualizar Num Caixa.
  void updateNumCaixa(String value) {
    numCaixa = value;
  }

  // atualizar Intervalo Envio.
  void updateIntervaloEnvio(String value) {
    intervaloEnvio = value;
  }

  // atualizar todas as variaveis.
  void updateAll(String ip, String idEmpresa, String idSerieNfce,
      String numCaixa, String intervaloEnvio) {
    this.ip = ip;
    this.idEmpresa = idEmpresa;
    this.idSerieNfce = idSerieNfce;
    this.numCaixa = numCaixa;
    this.intervaloEnvio = intervaloEnvio;
  }
}
