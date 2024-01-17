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

  Future<int?> searchCaixaId() async {
    try {
      var caixa = await service.getCaixaIdWithIdUserAndStatus0();

      if (caixa != null) {
        caixaId.value = caixa;
        return caixa;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<int?> searchUserId() async {
    var user = await service.getUserLogged();

    if (user != null) {
      return user.id_user!;
    } else {
      return 0;
    }
  }

  Future<int?> searchEmpresaId() async {
    dado_empresa? dataEmpresa = await service.getIpEmpresaFromDatabase();
    if (dataEmpresa != null) {
      return dataEmpresa.id_empresa!;
    } else {
      return 0;
    }
  }
}
