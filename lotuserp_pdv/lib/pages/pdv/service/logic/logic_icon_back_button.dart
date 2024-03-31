import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../../core/app_routes.dart';
import '../../../common/custom_cherry.dart';

class LogicIconBackButton {
  var paymentController = Dependencies.paymentController();
  var pdvController = Dependencies.pdvController();

  void getLogic(BuildContext context) {
    bool tefPaymentOpen = paymentController.paymentsTotal
        .any((pagamento) => pagamento['transacaoBemSucedida'] == true);
    if (tefPaymentOpen == true) {
      const CustomCherryError(
        message:
            'Existem pagamentos em aberto, por favor finalize para voltar.',
      ).show(context);
    } else {
      pdvController.pedidos.clear();
      Get.offNamed(PagesRoutes.homePageRoute);
    }
  }
}
