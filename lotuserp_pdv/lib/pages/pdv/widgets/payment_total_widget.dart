// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/pdv.controller.dart';

import '../../../core/app_routes.dart';
import '../../../core/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../../services/format_numbers.dart';
import '../../common/custom_cherry.dart';

class PaymentTotalWidget extends StatelessWidget {
  final PdvController controller;
  const PaymentTotalWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    // Constrói o container que mostra o valor total do pagamento
    Widget _buildContainerValue() {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.customSwatchColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              FormatNumbers.formatNumbertoString(
                  controller.totalcheckBox1.value),
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      );
    }

    // Constrói o container de pagamento
    Widget _buildPaymentContainer() {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        alignment: Alignment.centerRight,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pagamento',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    // Constrói o corpo do botão de pagamento
    Widget _buildBody() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: _buildPaymentContainer(),
          ),
          Expanded(
            flex: 1,
            child: _buildContainerValue(),
          ),
        ],
      );
    }

    // retorna o botão de pagamento
    return InkWell(
      onTap: () {
        if (controller.pedidos.isEmpty) {
          const CustomCherryError(message: 'Nenhum item adicionado')
              .show(context);
        } else {
          paymentController.clearComprovanteTef();
          Get.toNamed(PagesRoutes.paymentRoute);
          paymentController.totalPayment.value = '0,00';
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 5, bottom: 5),
        child: _buildBody(),
      ),
    );
  }
}
