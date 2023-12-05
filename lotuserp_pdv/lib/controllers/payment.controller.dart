import 'package:get/get.dart';

class PaymentController extends GetxController {
  var paymentsTotal = {}.obs;

  void addPaymentsTotal(String formPayment, double value) {
    paymentsTotal.value = {formPayment: value};
  }
}
