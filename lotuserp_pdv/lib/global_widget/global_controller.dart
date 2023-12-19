import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class GlobalController extends GetxController {
  int userId = 0;
  int colaboradorId = 0;
  int caixaAberta = 0;

  int serieNfce = 0;

  IsarService service = IsarService();

  @override
  onInit() {
    super.onInit();
    setIdUsuario();
    setCaixaAbertaId();
    updateSerieNfce();
  }

  void updateSerieNfce() async {
    await service.getDataEmpresa().then((value) => serieNfce = value!.id_nfce!);
  }

  //deve buscar o id do usuario logado
  //deve buscar o id do colaborador logado
  void setIdUsuario() async {
    usuario_logado? user = await service.getUserLogged();

    userId = user?.id_user ?? 0;
    colaboradorId = user?.id_colaborador ?? 0;
  }

  //deve buscar o id do caixa aberto
  void setCaixaAbertaId() async {
    int? caixaVar = await service.getIdCaixa(userId);

    caixaAberta = caixaVar ?? 0;
  }
}
