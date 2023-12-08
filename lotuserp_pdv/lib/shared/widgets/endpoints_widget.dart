import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class Endpoints {
  TextFieldController textFieldController = Get.find();
  IsarService service = IsarService();
  late String _baseUrl;
  late String companyId;

  Future baseUrl() async {
    final DadoEmpresa? dadoEmpresa = await service.getIpEmpresaFromDatabase();

    if (dadoEmpresa == null) {
      return;
    }
    if (dadoEmpresa.ipEmpresa == null) {
      return;
    }
    _baseUrl = dadoEmpresa.ipEmpresa!;
    companyId = dadoEmpresa.idEmpresa!;

    print(_baseUrl);
    print(companyId);
  }

  Map<String, String> headerRequisition() {
    return {'ptoken': 'ed9a811327979c9382ffd6361cfc5013'};
  }

  String empresa() {
    baseUrl();
    return '$_baseUrl/pdvmobget01_empresa?pidEmpresa=$companyId';
  }

  String produto() {
    return '$_baseUrl/pdvmobget05_produtos?pidEmpresa=$companyId';
  }

  String grupo() {
    return '$_baseUrl/pdvmobget03_produtos_grupos?pidEmpresa=$companyId';
  }

  String usuario() {
    return '$_baseUrl/pdvmobget02_usuarios?pidEmpresa=$companyId';
  }

  String imagemGrupoUrl(String file) {
    return '$_baseUrl/getimagem?categoria=GRU&file=$file&result=URL';
  }

  String imagemProdutoUrl(String file) {
    return '$_baseUrl/getimagem?categoria=PRO&file=$file&result=URL';
  }

  String ipEmpresa() {
    var numContrato = textFieldController.numContratoEmpresa;
    print(numContrato);
    return 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=$numContrato&ptipo=0';
  }
}
