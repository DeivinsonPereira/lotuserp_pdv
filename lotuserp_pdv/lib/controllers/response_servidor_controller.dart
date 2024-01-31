import 'package:get/get.dart';

class ResponseServidorController extends GetxController {
  var openRegisterId = 0.obs;
  var enviado = 0.obs;
  var idVendaServidor = 0.obs;
  var xmlNotaFiscal = true.obs;

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
  Future<void> updateIdVendaServidor(int value) async {
    idVendaServidor.value = value;
    update();
  }

  //atualizar xmlNotaFiscal
  void updateXmlNotaFiscal(bool value) {
    xmlNotaFiscal.value = value;
    update();
  }
}
