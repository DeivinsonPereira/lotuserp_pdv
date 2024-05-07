import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponseServidorController extends GetxController {
  TextEditingController cpfCnpjController = TextEditingController();

  var openRegisterId = 0.obs;
  var enviado = 0.obs;
  var idVendaServidor = 0.obs;
  var xmlNotaFiscal = true.obs;
  bool isContingencia = false;
  String cpfCnpj = '';

  //atualizar openRegisterId
  void updateOpenRegisterId(int value) {
    openRegisterId.value = value;
    update();
  }

  //atualizar enviado
  void updateEnviado(int value) {
    enviado.value = value;
    update();
  }

  //atualizar idVendaServidor
  void updateIdVendaServidor(int value) async {
    idVendaServidor.value = value;
    update();
  }

  //atualizar xmlNotaFiscal
  void updateXmlNotaFiscal(bool value) {
    xmlNotaFiscal.value = value;
    update();
  }

  Future<void> updateCpfCnpj() async {
    cpfCnpj = cpfCnpjController.text;
    update();
  }

  void limparCpfCnpj() {
    cpfCnpjController.text = '';
    cpfCnpj = '';
    update();
  }
}
