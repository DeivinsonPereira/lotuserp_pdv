import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedItems = <int, bool>{}.obs;

  void toggleItem(int index) {
    if (selectedItems[index] != null) {
      selectedItems[index] = !selectedItems[index]!;
      update();
    }
  }

  List<int> getSelectedItems() {
    return selectedItems.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
}
