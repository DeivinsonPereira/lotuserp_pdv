import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedItem = (-1).obs; // CHECKBOX
  var selectedOption = (0).obs; // TEF OU NFCE

  // Função para selecionar uma opção
  void toggleItem(int index) {
    if (selectedItem.value == index) {
      selectedItem.value = -1;
      
    } else {
      selectedItem.value = index;
    }
    update();
  }

  // Função para verificar se uma opção esta selecionada
  bool isItemSelected(int index) {
    return selectedItem.value == index;
  }

  // seleciona uma opção de dados a serem imprimidos NFCE ou TEF
  void setSelectOption(int value) {
    selectedOption.value = value;
    update();
  }

}
