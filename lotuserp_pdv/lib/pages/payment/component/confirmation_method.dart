import 'package:get/get.dart';

import '../../../collections/venda.dart';
import '../../../controllers/global_controller.dart';
import '../../../controllers/payment_controller.dart';
import '../../../controllers/pdv.controller.dart';
import '../../../controllers/printer_controller.dart';
import '../../../controllers/side_bar_controller.dart';
import '../../../services/dependencies.dart';
import '../../../shared/isar_service.dart';
import '../../cpf_cnpj_page.dart/cpf_cnpj_page.dart';
import '../../qr_code/qr_code_page.dart';

class ConfirmationMethod {
  IsarService service = IsarService();
  GlobalController globalController = Dependencies.globalController();
  PdvController pdvController = Dependencies.pdvController();
  SideBarController sideBarController = Dependencies.sidebarController();
  PrinterController printerController = Dependencies.printerController();
  PaymentController paymentController = Dependencies.paymentController();

  Future<void> processCommonOperations(
    String name,
    int tipoPagamento,
    int idPagamento,
  ) async {
    //soma o valor bruto total dos itens que estão nos pedidos
    pdvController.totalSomaPedidos();
    //transforma discountPercentage em double
    String discountPercentagecb2 =
        pdvController.discountPercentagecb2.value.replaceAll(',', '.');

    double discountPercentagecb2Formated = double.parse(discountPercentagecb2);

    //transforma numbersDiscount em double
    String numbersDiscountcb2 =
        pdvController.numbersDiscountcb2.value.replaceAll(',', '.');
    double numbersDiscountcb2Formated = double.parse(numbersDiscountcb2);

    //transforma numbersDiscountcb2 em double
    String numbersDiscount =
        pdvController.numbersDiscount.value.replaceAll(',', '.');
    double numbersDiscountFormated = double.parse(numbersDiscount);

    if (tipoPagamento != 0) {
      paymentController.addPaymentsTotal(name,
          paymentController.totalPayment.value, idPagamento, tipoPagamento);
    }
    pdvController
        .totalLiquido(); //soma o valor bruto total dos itens que estão nos pedidos

    var vendaExecutada = venda()
      ..data = DateTime.now()
      ..hora = sideBarController.hours.value
      ..id_empresa = globalController.empresaId //id empresa
      ..id_usuario = globalController.userId //id usuario logado
      ..id_colaborador = globalController.colaboradorId //id colaborador
      ..tot_bruto = pdvController.totBruto.value //total bruto
      ..tot_desc_prc =
          pdvController.checkbox1.value //total desconto em porcentagem
              ? pdvController.discountPercentage.value
              : discountPercentagecb2Formated
      ..tot_desc_vlr = pdvController.checkbox1.value //total desconto em valor
          ? numbersDiscountFormated
          : numbersDiscountcb2Formated
      ..tot_liquido = pdvController.liquido.value
      ..valor_troco = pdvController.checkbox1.value //troco
          ? pdvController.trocoCb1.value
          : pdvController.trocoCb2.value
      ..status = 1 //status da venda
      ..id_serie_nfce = globalController.serieNfce //id serie nfce
      ..enviado = 0 //enviado (status de envio)
      ..cpf_cnpj = '000.000.000-00' //cpf cnpj do cliente
      ..id_caixa =
          pdvController.caixaId.value //id caixa aberto para o usuario logado
      ..id_venda_servidor =
          0; //id da venda no servidor (recebido após o envio Nfce)
    await service.insertVendaWithVendaItemAndCaixaItem(vendaExecutada);

    pdvController.updateIsSelectedList();
  }

  Future continueSell(
      {String name = '', int tipoPagamento = 0, int idPagamento = 0}) async {
    // faz requisição para gerar NFCe
    await processCommonOperations(name, tipoPagamento, idPagamento);

    // Chama o preenchimento do QrCode
    await Get.dialog(barrierDismissible: false, const QrCodePage());

    Get.back(); // Fecha o diálogo atual
  }
}
