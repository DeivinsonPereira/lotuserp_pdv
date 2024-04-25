import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/cartao_item.dart';
import 'package:lotuserp_pdv/collections/nfce_resultado.dart';

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
  var nfce = [];
  venda vendaSelecionada = venda();

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

  // adiciona a venda selecionada
  void setVendaSelecionada(venda vendaSelected) {
    vendaSelecionada = vendaSelected;
  }

  Future<void> searchVendas() async {
    List<venda?> vendasDb =
        await service.getVendaByIdCaixaLogged(caixaId.value);
    if (vendasDb.isNotEmpty) {
      vendasLista.assignAll(vendasDb);
      vendasLista.sort((a, b) => b!.id_venda!.compareTo(a!.id_venda!));
      update();
    } else {
      vendasLista.assignAll(vendasDb);
      vendasLista.sort((a, b) => b!.id_venda!.compareTo(a!.id_venda!));
      update();
    }
  }

  Future<void> addNfce() async {
    List<nfce_resultado?> nfceDb = await service.getNfceResultados();
    if (nfceDb.isNotEmpty) {
      nfce.assignAll(nfceDb);
      nfce.sort((a, b) => b!.id_venda_local!.compareTo(a!.id_venda_local!));
      update();
    } else {
      nfceDb = [];
      nfce.sort((a, b) => b!.id_venda_local!.compareTo(a!.id_venda_local!));
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

  // Busca o id do caixa
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
