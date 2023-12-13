import 'package:get/get.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class CaixaController extends GetxController{
  IsarService service = IsarService();
  
  // deve buscar o id do caixa no banco de dados
  var idCaixa = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateIdCaixa();

  }
  //update idCaixa
  void updateIdCaixa() async {
    IsarService service = IsarService();
    var caixa = (await service.getCaixaFromDatabase())!;
    idCaixa.value = caixa.id_caixa.toString();
    
  }

  //delete idCaixa
  void clear() {
    idCaixa.value = '';
  }

}