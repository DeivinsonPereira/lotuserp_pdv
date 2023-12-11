import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

const companyId = 1;

class HomeController extends GetxController {
  final IsarService service = IsarService();
  final TextFieldController textFieldController = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();

    //chamar o método service.listenDadosEmpresariais e pegar o id da empresa cadastrado nos dados empresariais
    var dadosEmpresariais = service.listenDadosEmpresariais();
    final dados = await dadosEmpresariais.first;

    var dadoEmpresaid = 0;

    if (dados.isNotEmpty) {
      dadoEmpresaid = dados[0].idEmpresa!;
    }

    DadoEmpresa? dadoEmpresa = await service.getIpEmpresaFromDatabase();
    bool tabelaDadosEmpresarias = false;

    if (dadoEmpresa != null) {
      tabelaDadosEmpresarias = true;

      if (tabelaDadosEmpresarias) {
        print(dadoEmpresaid);
        await service.getEmpresa(dadoEmpresaid);
        await service.getGrupo(dadoEmpresaid);
        await service.getProduto(dadoEmpresaid);
        await service.getUsuarios(dadoEmpresaid);
      }
    }
  }
}
