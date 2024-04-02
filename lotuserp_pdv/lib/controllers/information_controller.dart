import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/cartao_item.dart';

import '../collections/dado_empresa.dart';
import '../collections/venda.dart';
import '../shared/isar_service.dart';

class InformationController extends GetxController {
  IsarService service = IsarService();

  var usuarioId = 0.obs;
  var empresaId = 0.obs;
  var caixaId = 0.obs;
  var vendasLista = [].obs;
  var vendasTef = [].obs;

  @override
  void onInit() {
    super.onInit();
    getInformations();
  }

  Future<void> getInformations() async {
    await searchUserId();
    await searchCaixaId();
    await searchEmpresaId();
    await searchVendas();
    await searchProofTEF();
  }

  Future<void> searchVendas() async {
    List<venda?> vendasDb =
        await service.getVendaByIdCaixaLogged(caixaId.value);
    if (vendasDb.isNotEmpty) {
      vendasLista.assignAll(vendasDb);
      update();
    } else {
      vendasLista.assignAll(vendasDb);
      update();
    }
  }

  // Busca os dados do TEF do banmco de dados local
  Future<void> searchProofTEF() async {
    List<cartao_item?> vendasTEFDb =
        await service.getCartaoItemByIdCaixaLogged(caixaId.value);
    if (vendasTEFDb.isNotEmpty) {
      vendasTef.assignAll(vendasTEFDb);
      update();
    } else {
      update();
    }
  }

  Future<int?> searchCaixaId() async {
    try {
      var caixa = await service.getCaixaIdWithIdUserAndStatus0();

      if (caixa != null) {
        caixaId.value = caixa;
        update();
        return caixa;
      } else {
        update();
        return 0;
      }
    } catch (e) {
      update();
      return 0;
    }
  }

  Future<int?> searchUserId() async {
    var user = await service.getUserLogged();

    if (user != null) {
      update();
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
