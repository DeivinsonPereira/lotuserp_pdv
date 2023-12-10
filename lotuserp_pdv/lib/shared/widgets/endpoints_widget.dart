import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class Endpoints {
  TextFieldController textFieldController = Get.find();
  IsarService service = IsarService();
  

  String ipEmpresa() {
    var numContrato = textFieldController.numContratoEmpresa;
    return 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=$numContrato&ptipo=0';
  }
}
