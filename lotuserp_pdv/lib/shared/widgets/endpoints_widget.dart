import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class Endpoints {
  TextFieldController textFieldController = Dependencies.textFieldController();
  IsarService service = IsarService();

  String ipEmpresa() {
    textFieldController.salvarInformacoesContrato();
    var numContrato = textFieldController.numContratoEmpresaController.text;
    return 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=$numContrato&ptipo=0';
  }

  String prefixo() {
    return 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/';
  }

  Future<String> endpointSearchImageDIV(String file) async {
    dado_empresa? dados = await service.getDataEmpresa();
    if (dados == null) {
      return '';
    }

    return '${dados.ip_empresa}getimagem?categoria=DIV&file=$file&retorno=URL';
  }
}
