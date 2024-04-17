import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/common/loading_screen.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../../collections/caixa_fechamento.dart';
import '../../../../repositories/close_register_servidor_repository.dart';
import '../../../../services/datetime_formatter_widget.dart';
import '../../../../services/dependencies.dart';
import '../../../printer/printer_popup.dart';

class LogicCloseRegister {
  var closeRegisterController = Dependencies.closeRegisterController();
  var globalController = Dependencies.globalController();
  var pdvController = Dependencies.pdvController();
  var configController = Dependencies.configcontroller();
  var printerController = Dependencies.printerController();
  IsarService service = IsarService();

  Future<void> closeRegister() async {
    Get.dialog(const LoadingScreen());
    await pdvController.getidCaixa();
    if (closeRegisterController.isButtonEnabled.value == true) {
      closeRegisterController.toggleIsButtonEnabled();
      var atualDateFormatted =
          DatetimeFormatterWidget.formatDate(DateTime.now());

      await globalController.setIdCaixaServidor(globalController.userId);
      var idCaixaServidor = globalController.idCaixaServidor;
      List<caixa_fechamento> fechamentosCaixa = [];

      for (var i = 0; i < closeRegisterController.closeRegister.length; i++) {
        var values = closeRegisterController.closeRegister[i]['value'] =
            double.parse(closeRegisterController.textControllers[i].text
                .replaceAll('.', '')
                .replaceAll(',', '.'));

        caixa_fechamento caixaFechamento = caixa_fechamento()
          ..id_caixa = pdvController.caixaId.value
          ..id_tipo_recebimento =
              closeRegisterController.dataOfTipoPagamento![i]
          ..valor_informado = values;

        fechamentosCaixa.add(caixaFechamento);
      }
      await CloseRegisterServidorRepository().closeRegisterServidor(
          atualDateFormatted, idCaixaServidor, fechamentosCaixa);

      var tamanhoImpressora = configController.tamanhoImpressora.value;

      if (tamanhoImpressora != 'SEM IMPRESSORA') {
        var printerPopupController = Dependencies.printerPopupController();
        printerPopupController.isButtonEnabled.value = true;
        await Get.dialog(
          PrinterPopup(onPrint: () async {
            Get.dialog(const LoadingScreen());
            printerPopupController.toggleButton();
            await printerController.printCloseCaixa(fechamentosCaixa);
            Get.back();
            Get.back();
          }),
        );
      }
      await service.insertCaixaFechamento(fechamentosCaixa);
      await service.deleteCartaoItem();
      Get.back();
    }
    Get.back();
  }
}
