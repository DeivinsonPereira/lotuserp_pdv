// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  // controllers que serão usados para o cadastro de informações de configuração.
  TextEditingController ipController = TextEditingController();
  TextEditingController idEmpresaController = TextEditingController();
  TextEditingController idSerieNfceController = TextEditingController();
  TextEditingController numCaixaController = TextEditingController();
  TextEditingController intervaloEnvioController = TextEditingController();

  // variáveis que serão usadas para o cadastro de informações de configuração.
  late String ip = '';
  late String idEmpresa = '';
  late String idSerieNfce = '';
  late String numCaixa = '';
  late String intervaloEnvio = '';

  // salvar informações nas variaveis.
  void salvarInformacoes() {
    ip = ipController.text;
    idEmpresa = idEmpresaController.text;
    idSerieNfce = idSerieNfceController.text;
    numCaixa = numCaixaController.text;
    intervaloEnvio = intervaloEnvioController.text;
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
