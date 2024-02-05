import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedItem = (-1).obs; // Armazena o índice do item selecionado

  void toggleItem(int index) {
    if (selectedItem.value == index) {
      // Se o item já está selecionado, desselecione-o
      selectedItem.value = -1;
    } else {
      // Se o item não está selecionado, selecione-o
      selectedItem.value = index;
    }
    update();
  }

  bool isItemSelected(int index) {
    return selectedItem.value == index;
  }
}
