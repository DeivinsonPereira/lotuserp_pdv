import 'package:lotuserp_pdv/pages/second_copy/services/enum/situacao_nfce.dart';

import '../../../collections/venda.dart';
import '../../../services/dependencies.dart';

class LogicSituationNfce {
  var informationController = Dependencies.informationController();

  String get(venda vendaSelected) {
    var nfce = informationController.nfce.firstWhere(
        (element) => element.id_venda_local == vendaSelected.id_venda,
        orElse: () => null);
    if (nfce != null) {
      if (nfce.xml != '') {
        return SituacaoNfce.EMITIDA;
      } else {
        return SituacaoNfce.NAO_EMITIDA;
      }
    } else {
      return SituacaoNfce.NAO_EMITIDA;
    }
  }
}
