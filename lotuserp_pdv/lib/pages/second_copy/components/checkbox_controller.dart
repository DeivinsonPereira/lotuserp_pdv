import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedItem = (-1).obs; 

  void toggleItem(int index) {
    if (selectedItem.value == index) {
      selectedItem.value = -1;
      
    } else {
      selectedItem.value = index;
    }
    update();
  }

  bool isItemSelected(int index) {
    return selectedItem.value == index;
  }
}
