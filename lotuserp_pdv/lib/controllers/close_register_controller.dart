import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class CloseRegisterController extends GetxController {
  IsarService service = IsarService();

  List<TextEditingController> textControllers = [];

  List<Map<String, dynamic>> closeRegister = [];

  RxInt selectedTextFieldIndex = 0.obs;

  RxInt caixaId = 0.obs;

  List<int>? dataOfTipoPagamento = [];

  @override
  void onInit() {
    super.onInit();
    getidCaixa();
  }

  //atualiza o valor do selectedTextFieldIndex
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

    print(closeRegister);
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

  Future<void> getidCaixa() async {
    var caixa = await service.getCaixaIdWithIdUserAndStatus0();
    caixaId.value = caixa!;
  }
}
