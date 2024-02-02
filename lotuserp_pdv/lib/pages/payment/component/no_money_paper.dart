import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../controllers/payment_controller.dart';

class NoMoneyPaper {
  PdvController pdvController = Dependencies.pdvController();
  PaymentController controller = Dependencies.paymentController();

  Future<void> processCommonOperations() async {
    double totalValue = pdvController.totalcheckBox1.value;
    String numbersDiscountcb2 =
        pdvController.numbersDiscountcb2.value.replaceAll(',', '.');
    double numbersDiscountcb2Formated = double.parse(numbersDiscountcb2);

    double totalValue2 =
        pdvController.totBruto.value - numbersDiscountcb2Formated;
    double totalPaid = controller.getTotalPaid();
    double remainingValue = totalValue - totalPaid;
    double totalValue2withPayment = totalValue2 - totalPaid;

    String remainingValueFormatted =
        remainingValue < 0 ? '0,00' : formatoBrasileiro.format(remainingValue);

    String valorAPagar = pdvController.checkbox1.value
        ? remainingValueFormatted
        : formatoBrasileiro.format(totalValue2withPayment);

    // Remover formatação antes de atribuir
    controller.totalPayment.value = valorAPagar;
  }
}
