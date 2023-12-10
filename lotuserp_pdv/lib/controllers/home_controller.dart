import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';

const companyId = 1;

class HomeController extends GetxController {
  final IsarService service = IsarService();
  final Endpoints endpoints = Endpoints();

  @override
  Future<void> onInit() async {
    super.onInit();
    await service.getEmpresa(companyId);
    await service.getGrupo(companyId);
    await service.getProduto(companyId);
    await service.getUsuarios(companyId);
  }
}
