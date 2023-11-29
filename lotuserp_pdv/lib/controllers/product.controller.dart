import 'package:get/get.dart';

class ProdutoController extends GetxController {
  int isSelectedList = -1.obs;
  
  void selectionedIndex(int index) {
    isSelectedList = index;

    update();
  }
}
