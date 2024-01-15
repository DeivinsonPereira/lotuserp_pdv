import 'package:get/get.dart';

import '../collections/dado_empresa.dart';
import '../shared/isar_service.dart';

class InformationController extends GetxController {
  IsarService service = IsarService();

  var usuarioId = 0.obs;
  var empresaId = 0.obs;
  var caixaId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    searchUserId();
    searchEmpresaId();
    searchCaixaId();
  }

  Future<void> searchCaixaId() async {
    caixaId.value = (await service.getCaixaIdWithIdUserAndStatus0())!;
    update();
  }

  Future<void> searchUserId() async {
    var user = await service.getUserLogged();

    if (user != null) {
      usuarioId.value = user.id_user!;
      update();
    } else {
      usuarioId.value = 0;
      update();
    }
  }

  Future<void> searchEmpresaId() async {
    dado_empresa? dataEmpresa = await service.getIpEmpresaFromDatabase();
    if (dataEmpresa != null) {
      empresaId.value = dataEmpresa.id_empresa!;
      update();
    }
    update();
  }
}
