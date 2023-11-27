import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

const companyId = 1;

class HomeController extends GetxController {
  final IsarService service = IsarService();

  @override
  Future<void> onInit() async {
    super.onInit();
  
    await service.getEmpresa(companyId);
  }
}