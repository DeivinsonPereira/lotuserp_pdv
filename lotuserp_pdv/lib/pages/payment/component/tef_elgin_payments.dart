import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../core/custom_colors.dart';
import '../../../services/format_numbers.dart';
import '../../../services/tef_elgin/tef_elgin_customization_service.dart';
import '../../../services/tef_elgin/tef_elgin_service.dart';
import '../../common/custom_snack_bar.dart';

class TefElginPayments {
  var paymentController = Dependencies.paymentController();
  Logger logger = Logger();

  // processamento do pagamento TEF
  Future<void> processTefPayment(Map<String, dynamic> payment) async {
    String paymentType = payment['nome'];
    String valorTransacao = payment['valor'];
    String paymentId = payment['id'];

    try {
      // Formata o valor para centavos
      String valorFormatado = valorTransacao.replaceAll(RegExp(r'[.,]'), '');

      // Prepara os parâmetros para a chamada TEF
      Map<String, String> tefParams = {
        'funcao': paymentType == 'TEF DEBITO'
            ? 'debito'
            : paymentType == 'TEF CREDITO'
                ? 'credito'
                : 'pix',
        'valor': valorFormatado,
        // Adicione outros parâmetros necessários
      };

      if (paymentType == 'TEF CREDITO') {
        tefParams['parcelas'] = paymentController.installments.value.toString();
        tefParams['financiamento'] = '1';
      }

      var valueDouble = FormatNumbers.formatStringToDouble(valorTransacao);

      // Chama o serviço TEF
      await TefElginCustomizationService.customizarAplicacao();

      String? tefResponseJson = await TefElginService.startTef(
          tefParams, valueDouble, paymentController.installments.toString());
      if (tefResponseJson == null) throw 'Resposta do TEF nula';
      Map<String, dynamic> tefResponse = jsonDecode(tefResponseJson);
      if (tefResponse['COMP_DADOS_CONF'] != null) {
        Map<String, dynamic> compDadosConf =
            jsonDecode(tefResponse['COMP_DADOS_CONF']);
        if (compDadosConf['mensagem'] == 'Transacao aprovada') {
          paymentController.updatePaymentStatus(paymentId, true);
        } else {
          throw 'Erro na transação TEF: ${compDadosConf['mensagem']}';
        }
        if (tefParams['funcao'] == 'credito') {
          Get.back();
        }
      } else {
        throw 'Resposta do TEF inválida';
      }
    } catch (e) {
      const CustomSnackBar(
        message: 'Erro na transação TEF: Operação cancelada',
      ).show();
      // Trata o erro
      logger.e('Erro durante a transação TEF: $e');
    }
  }

  // Dialog para escolher numero de parcelas
  Widget choiceNumbersOfInstallments(Map<String, dynamic> payment) {
    return Dialog(
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: 300,
        width: 400,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: CustomColors.customSwatchColor,
              child: const Center(
                child: Text(
                  'Parcelas',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26),
                ),
              ),
            ),

            //Conteúdo
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Informativo
                  const Text(
                    'DIGITE O NÚMERO DE PARCELAS',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 250,

                    //Caixa de texto
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return paymentController.installments.value = '';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: paymentController.paymentControllerText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.bookmarks_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        paymentController.paymentControllerText.clear();
                        paymentController.clearInstallments();
                        Get.back();
                      },
                      child: const Text(
                        'VOLTAR',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: CustomColors.confirmButtonColor,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        String text =
                            paymentController.paymentControllerText.text.trim();

                        if (text.isEmpty || int.tryParse(text) == null) {
                          Get.snackbar('Erro',
                              'O campo não pode ser vazio, por favor preencha com um número de parcelas válidas.',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        } else if (int.parse(text) <= 0) {
                          Get.snackbar('Erro', 'Parcelas inválidas',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          paymentController.updateInstallments();
                          processTefPayment(payment);
                        }
                      },
                      child: const Text(
                        'CONTINUAR',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // botão para iniciar a transação TEF
  Widget buildPaymentButton(Map<String, dynamic> payment) {
    IconData icon =
        payment['transacaoBemSucedida'] ? Icons.check : Icons.credit_card;
    Color iconColor =
        payment['transacaoBemSucedida'] ? Colors.white : Colors.black;

    return Container(
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
        color: payment['transacaoBemSucedida']
            ? CustomColors.confirmButtonColor
            : CustomColors.customContrastColor,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: iconColor,
        onPressed: () {
          paymentController.paymentControllerText.text = '1';
          // procurar os ID do TEF DEBITO, do TEF CREDITO, do PIX INTEGRADO
          !payment['transacaoBemSucedida']
              ? payment['nome'] == 'TEF DEBITO' ||
                      payment['nome'] == 'PIX INTEGRADO'
                  ? processTefPayment(payment)
                  : Get.dialog(choiceNumbersOfInstallments(payment))
              : Get.snackbar('Erro', 'Pagamento já processado',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  icon: const Icon(Icons.error),
                  snackPosition: SnackPosition.BOTTOM);
        },
      ),
    );
  }
}
