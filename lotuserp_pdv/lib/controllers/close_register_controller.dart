import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/caixa_item.dart';
import '../collections/tipo_recebimento.dart';
import '../services/dependencies.dart';
import '../services/format_numbers.dart';

class CloseRegisterController extends GetxController {
  var configController = Dependencies.configcontroller();
  var paymentController = Dependencies.paymentController();
  IsarService service = IsarService();

  List<TextEditingController> textControllers = [];
  List<String> credits = [];
  List<String> debits = [];
  List<Map<String, dynamic>> closeRegister = [];
  var selectedTextFieldIndex = 0.obs;
  var caixaId = 0.obs;
  List<int> dataOfTipoPagamento = [];
  var isButtonEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    isButtonEnabled.value = true;
  }

  // Atualiza o valor do isButtonEnabled
  void toggleIsButtonEnabled() {
    isButtonEnabled.value = !isButtonEnabled.value;
    update();
  }

  // Atualiza o valor do selectedTextFieldIndex
  void setSelectedTextFieldIndex(int index) {
    selectedTextFieldIndex.value = index;
    update();
  }

  // atualiza o valor no closeRegister de acordo com seu respectivo tipo
  void updateCloseRegister(String value, String tipo) {
    bool found = false;

    for (int i = 0; i < closeRegister.length; i++) {
      if (closeRegister[i]['tipo'] == tipo) {
        if (value == '0' && textControllers[i].text == '0.00') {
          return;
        }
        var newValue = textControllers[i].text;
        var newFormatted = newValue.replaceAll(RegExp(r'[^\d]'), '');
        textControllers[i].text =
            formatoBrasileiro.format(double.parse(newFormatted) / 100);
        closeRegister[i]['value'] =
            formatoBrasileiro.format(double.parse(newFormatted) / 100);

        found = true;
        break;
      }
    }
    if (!found) {
      closeRegister.add({'tipo': tipo, 'value': value});
    }
  }

  // remove numero por numero que está armazenado no textController e no closeRegister
  void removeNumbers(int index) {
    if (textControllers[index].text == '0,00') {
      return;
    }
    textControllers[index].text = textControllers[index]
        .text
        .substring(0, textControllers[index].text.length - 1);
    updateCloseRegister(
        textControllers[index].text, closeRegister[index]['tipo']);
  }

  //cria os controllers de acordo com o tamanho da lista de pagamentos
  void createControllers(int index, String tipo) {
    textControllers.add(TextEditingController());
    textControllers[index].text = '0,00';
    updateCloseRegister(textControllers[index].text, tipo);
  }

  void updateTipoPagamento(int idPagamento) {
    dataOfTipoPagamento.add(idPagamento);
  }

  // Faz o auto preenchimento dos campos se caixa cego for == 1
  Future<void> autoFillControllers() async {
    Future.delayed(const Duration(microseconds: 100)).then((value) async {
      /*if (configController.empresaSelected!.caixa_cego == 1) {*/
      for (int i = 0; i < paymentController.tipo_recebimentos.length; i++) {
        if (textControllers.length < i + 1) {
            createControllers(
                i,
                paymentController.tipo_recebimentos[i]!.id
                    .toString());
          } else {
            textControllers.clear(); 
            credits.clear();
            debits.clear();
            i--;
          }
      }
      for (int i = 0; i < paymentController.tipo_recebimentos.length; i++) {
        tipo_recebimento payment = paymentController.tipo_recebimentos[i]!;

        List<caixa_item> caixaItems =
            await service.getAllByTypePayment(payment.id);
        double credit = 0.0;
        double debit = 0.0;
        if (caixaItems.isNotEmpty) {
          for (caixa_item caixaItem in caixaItems) {
            credit += caixaItem.valor_cre!;
            debit += caixaItem.valor_deb!;
          }
          credits.add(FormatNumbers.formatNumbertoString(credit));
          debits.add(FormatNumbers.formatNumbertoString(debit));
          textControllers[i].text =
              FormatNumbers.formatNumbertoString(credit - debit);
        } else {
          credits.add(FormatNumbers.formatNumbertoString(credit));
          debits.add(FormatNumbers.formatNumbertoString(debit));
          textControllers[i].text =
              FormatNumbers.formatNumbertoString(credit - debit);
        }
      }
      /*} else {
        textControllers.clear();
        credits.clear();
        debits.clear();
        for (int i = 0; i < paymentController.tipo_recebimentos.length; i++) {
          textControllers[i].text = '0,00';
        }
      }*/
    });
  }

  void cleardataOfTipoPagamento() {
    dataOfTipoPagamento.clear();
  }

  @override
  void dispose() {
    super.dispose();
    isButtonEnabled.value = true;
  }
}
