import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

import '../collections/caixa_item.dart';
import '../collections/tipo_recebimento.dart';
import '../services/dependencies.dart';

class PaymentController extends GetxController {
  TextEditingController paymentControllerText = TextEditingController();
  PdvController pdvController = Dependencies.pdvController();
  Logger logger = Logger();

  List<tipo_recebimento?> tipo_recebimentos = [];

  var paymentTefId = [].obs;

  var installments = '1'.obs;

  //lista com forma de pagamentos e valores
  var paymentsTotal = <Map<String, dynamic>>[].obs;

  //valor da forma de pagamento
  var totalPayment = '0,00'.obs;

  var isButtonPrintEnabled = false.obs;
  var isButtonEnabled = true.obs;
  var remaningValue1 = 0.0.obs;
  var remaningValue2 = 0.0.obs;

  // variaveis nfce

  var idVenda = 0;
  var qrCode = ''.obs;
  var xml = ''.obs;
  bool isContingencia = false;

  List<caixa_item> caixaItems = [];

  List<String> comprovanteTef = [];

  @override
  void onInit() {
    super.onInit();
    totalPayment.value = '0,00';
    pdvController.getidCaixa();
  }

  // adiciona as formas de pagamento à variável
  void addPaymentTypes(List<tipo_recebimento?> value) {
    var nonNullValues =
        value.where((item) => item != null).cast<tipo_recebimento>().toList();

    if (value.isNotEmpty) {
      tipo_recebimentos.assignAll(nonNullValues);
    }
  }

  tipo_recebimento? filterPaymentTypesById(int idPayment) {
    if (idPayment != 0) {
      if (tipo_recebimentos.isNotEmpty) {
        var payment = tipo_recebimentos
            .where((element) => element!.id == idPayment)
            .toList();
        if (payment.isEmpty) {
          return null;
        }
        return payment[0];
      } else {
        Get.back();
        return null;
      }
    } else {
      Get.back();
      return null;
    }
  }

  void updateComprovanteTef(String value) {
    comprovanteTef.add(value);
  }

  void clearComprovanteTef() {
    comprovanteTef.clear();
  }

  // Atualiza a variável isButtonPrintEnabled
  void toggleIsButtonPrintEnabled(bool value) {
    isButtonPrintEnabled.value = value;
  }

  //adiciona item na lista caixaItems
  void addListCaixaItems(caixa_item caixaItems) {
    this.caixaItems.add(caixaItems);
    update();
  }

  // limpa a lista caixaItems
  void clearListCaixaItems() {
    caixaItems.clear();
    update();
  }

  //update isButtonEnabled
  void updateIsButtonEnabled() {
    if (pdvController.checkbox1.value) {
      remaningValue1 <= 0
          ? isButtonEnabled.value = true
          : isButtonEnabled.value = false;
      Future.microtask(() => update());
    } else if (pdvController.checkbox2.value) {
      remaningValue2 <= 0
          ? isButtonEnabled.value = true
          : isButtonEnabled.value = false;
      Future.microtask(() => update());
    }
    Future.microtask(() => update());
  }

  //update Remaining1
  void updateRemaining1(double value) {
    remaningValue1.value = value;
    Future.microtask(() => update());
  }

  //update Remaining2
  void updateRemaining2(double value) {
    remaningValue2.value = value;
    Future.microtask(() => update());
  }

  //update variaveis
  Future<void> updateVariaveisNfce(
      int idVenda, String qrCode, String xml, bool isContingencia) async {
    this.idVenda = idVenda;
    this.qrCode.value = qrCode;
    this.xml.value = xml;
    this.isContingencia = isContingencia;

    update();
  }

  //limpar os campos
  void zerarCampos() {
    paymentsTotal.clear();
    totalPayment.value = '0,00';
  }

  //update paymentStatus
  void updatePaymentStatus(String paymentId, bool status) {
    var index = paymentsTotal.indexWhere((p) => p['id'] == paymentId);
    if (index != -1) {
      paymentsTotal[index]['transacaoBemSucedida'] = status;
      update(); // Atualiza a UI
    }
  }

  //update installments
  void updateInstallments() {
    installments.value = paymentControllerText.text;
    update();
  }

  //limpar o installments
  void clearInstallments() {
    installments.value = '1';
    update();
  }

  //update paymentTefId
  void updatePaymentTefId(int id) {
    paymentTefId.add(id);
  }

  //limpar o paymentTefId
  void clearPaymentTef() {
    paymentTefId.clear();
  }

  //adicionar forma de pagamento e valor no paymentsTotal
  void addPaymentsTotal(String formPayment, String value, int idPayment,
      int? tipoForma, int? tef) {
    Map<String, dynamic> newPayment = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(), // ID único
      'nome': formPayment,
      'valor': value,
      'idPagamento': idPayment,
      'tipoForma': tipoForma,
      'tef': tef,
      'transacaoBemSucedida': false
    };
    paymentsTotal.add(newPayment);
  }

  //se houver algum pagamento TEF DEBITO ou TEF CREDITO em aberto, retorna false
  bool verifyOpenTransactionTEF() {
    return paymentsTotal.any((p) =>
        p['nome'] == 'TEF DEBITO' && p['transacaoBemSucedida'] == false ||
        p['nome'] == 'TEF CREDITO' && p['transacaoBemSucedida'] == false);
  }

  //adiciona numero no totalPayments;
  void addNumberPayment(String number) {
    if (number == '0' && totalPayment.value == '0,00') {
      return;
    }

    //transforma o numero em string e divide por 100 para transformar em double com 2 casas decimais.
    String newPaymentValue =
        totalPayment.value.replaceAll(RegExp(r'[^\d]'), '') + number;
    totalPayment.value = formatAsCurrency(double.parse(newPaymentValue) / 100);
  }

  //transforma double em string transformando virgula em ponto;
  String formatAsCurrency(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  //remove numero por numero do valor inserido na forma de pagamento.
  void removeNumberDiscount() {
    String digitsOnly = totalPayment.value.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.length > 1) {
      String newPaymentValue = digitsOnly.substring(0, digitsOnly.length - 1);
      totalPayment.value =
          formatAsCurrency(double.parse(newPaymentValue) / 100);
    } else {
      totalPayment.value = '0,00';
    }
  }

  //remove forma de pagamento
  void deletePayment(int index) {
    if (index >= 0 && index < paymentsTotal.length) {
      paymentsTotal.removeAt(index);
      update();
    }
  }

  void clearXmlAndQrCodeAndIdVenda() {
    idVenda = 0;
    qrCode.value = '';
    xml.value = '';
  }

  //retorna o total pago
  double getTotalPaid() {
    double totalPaid = 0.0;
    for (var payment in paymentsTotal.toList()) {
      var paymentValue = payment['valor'];
      if (paymentValue != null && paymentValue.isNotEmpty) {
        // Primeiro, remove pontos (separadores de milhar) e substitui vírgulas por pontos
        var cleanedPaymentValue =
            paymentValue.replaceAll('.', '').replaceAll(',', '.');
        // Agora tenta converter para double
        double? parsedValue = double.tryParse(cleanedPaymentValue);
        if (parsedValue != null) {
          totalPaid += parsedValue;
        } else {
          logger.e('Erro ao converter o valor de pagamento: $paymentValue');
        }
      }
    }
    return totalPaid;
  }
}
