import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../services/print_xml.dart/print_nfce_xml.dart';

class LogicSecondPrint {
  var checkboxController = Dependencies.checkboxController();
  var informationController = Dependencies.informationController();
  Logger logger = Logger();
  IsarService service = IsarService();

  Future<void> printNfce() async {
    if (checkboxController.selectedItem.value != -1) {
      var data = informationController
          .vendasLista[checkboxController.selectedItem.value];
      if (data != null) {
        var nfce =
            await service.getDadosNfceByIdVendaServidor(data.id_venda_servidor);

        if (nfce != null) {
          var configController = Dependencies.configcontroller();
          var tamanhoImpressora = configController.tamanhoImpressora.value;
          if (tamanhoImpressora != 'SEM IMPRESSORA') {
            PrintNfceXml().printNfceXml(xmlArgs: nfce.xml);
          }
        } else {
          logger.e('Nfce não encontrada');
        }
      } else {
        logger.e('Venda não encontrada');
      }
    } else {
      logger.e('Selecione uma venda');
    }
  }
}
