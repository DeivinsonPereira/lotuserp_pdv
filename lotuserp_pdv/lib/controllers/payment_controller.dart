import 'package:get/get.dart';

class PaymentController extends GetxController {
  //lista com forma de pagamentos e valores
  var paymentsTotal = <Map<String, dynamic>>[].obs;

  //valor da forma de pagamento
  var totalPayment = '0,00'.obs;

  @override
  void onInit() {
    super.onInit();
    totalPayment.value = '0,00';
    paymentsTotal.clear();
  }

  void zerarCampos() {
    paymentsTotal.clear();
    totalPayment.value = '0,00';
  }

  //adicionar forma de pagamento e valor no paymentsTotal
  void addPaymentsTotal(String formPayment, String value) {
    Map<String, dynamic> newPayment = {'nome': formPayment, 'valor': value};
    paymentsTotal.add(newPayment);
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
    if (totalPayment.value.length > 1) {
      String newPaymentValue = totalPayment.value
          .replaceAll(RegExp(r'[^\d]'), '')
          .substring(0, totalPayment.value.length - 2);
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
    }
  }

  //retorna o total pago
  double getTotalPaid() {
    double totalPaid = 0.0;
    for (var payment in paymentsTotal.toList()) {
      var paymentValue = payment['valor'];
      if (paymentValue != null && paymentValue.isNotEmpty) {
        var cleanedPaymentValue = paymentValue.replaceAll(',', '');
        totalPaid += double.tryParse(cleanedPaymentValue)! / 100;
      }
    }
    return totalPaid;
  }
}
