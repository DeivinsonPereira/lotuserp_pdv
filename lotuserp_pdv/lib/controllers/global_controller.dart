import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../collections/empresa.dart';

class GlobalController extends GetxController {
  int userId = 0;
  int colaboradorId = 0;
  int caixaAberta = 0;
  String cnpjEmpresa = '';
  int idCaixaServidor = 0;

  int empresaId = 0;
  int serieNfce = 0;

  IsarService service = IsarService();

  @override
  onInit() {
    super.onInit();
    updateSerieNfce();
    updateIdEmpresa();
    setIdUsuario();
    setCnpjEmpresa();
  }

  //busca o id da empresa de acordo com as configurações iniciais do sistema
  void updateIdEmpresa() async {
    dado_empresa? empresa = await service.getDataEmpresa();
    if (empresa != null) {
      empresaId = empresa.id;
    }
  }

  //busca a serie do nfce de acordo com as configurações iniciais do sistema
  void updateSerieNfce() async {
    await service.getDataEmpresa().then((value) => serieNfce = value!.id_nfce!);
  }

  //busca o id do usuario logado
  //busca o id do colaborador logado
  void setIdUsuario() async {
    usuario_logado? user = await service.getUserLogged();

    userId = user?.id_user ?? 0;
    colaboradorId = user?.id_colaborador ?? 0;
  }

  //busca o id do caixa aberto
  void setCaixaAbertaId(int userId) async {
    int? caixaVar = await service.getIdCaixa(userId);

    caixaAberta = caixaVar ?? 0;
  }

  //busca o cnpj da empresa
  void setCnpjEmpresa() async {
    empresa? cnpjVar = await service.getDadoTabelaEmpresa();
    cnpjEmpresa = cnpjVar!.cnpj ?? '';
  }

  //busca o id do caixa aberto no servidor
  Future<void> setIdCaixaServidor(int userId) async {
    int? idCaixa = await service.getIdCaixaServidor(userId);

    idCaixaServidor = idCaixa ?? 0;
  }
}
