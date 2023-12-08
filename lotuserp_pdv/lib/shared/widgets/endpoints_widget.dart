import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';

const String _baseUrl = 'http://189.126.106.71/cgi-bin/lotuserp';
const int companyId = 1;

class Endpoints {
  TextFieldController textFieldController = Get.find();

  static Map<String, String> headerRequisition() {
    return {'ptoken': 'ed9a811327979c9382ffd6361cfc5013'};
  }

  static String empresa() {
    return '$_baseUrl/pdvmobget01_empresa?pidEmpresa=$companyId';
  }

  static String produto() {
    return '$_baseUrl/pdvmobget05_produtos?pidEmpresa=$companyId';
  }

  static String grupo() {
    return '$_baseUrl/pdvmobget03_produtos_grupos?pidEmpresa=$companyId';
  }

  static String usuario() {
    return '$_baseUrl/pdvmobget02_usuarios?pidEmpresa=$companyId';
  }

  static String imagemGrupoUrl(String file) {
    return '$_baseUrl/getimagem?categoria=GRU&file=$file&result=URL';
  }

  static String imagemProdutoUrl(String file) {
    return '$_baseUrl/getimagem?categoria=PRO&file=$file&result=URL';
  }

  String ipEmpresa() {
    var numContrato = textFieldController.numContratoEmpresa;
    print(numContrato);
    return 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=$numContrato&ptipo=0';
  }
}
