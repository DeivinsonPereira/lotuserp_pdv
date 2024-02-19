// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/pages/second_copy/component/legend_informations.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/dependencies.dart';
import '../common/custom_cherry.dart';
import '../common/header_popup.dart';

class SecondCopyPage extends StatelessWidget {

  const SecondCopyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    InformationController informationController =
        Dependencies.informationController();

    // CONTEÚDO - DADOS DO REGISTRO DO CARTÃO E IMPRIMIR
    Widget dataCardAndPrint(BoxConstraints constraints) {
      return Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  // LEGENDA
                  LegendInformation(
                    id: 'Id',
                    data: 'Data',
                    hora: 'Hora',
                    idVenda: 'Id Venda',
                    valor: 'Valor',
                    isPrint: false,
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),

            // CONTEÚDO - DADOS DO REGISTRO DO CARTÃO
            StreamBuilder(
              stream: service.listenCartaoItem(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('');
                }
                if (snapshot.hasError) {
                  const CustomCherryError(
                          message:
                              'Ocorreu um erro ao buscar os registros de transações efetuadas. Tente novamente mais tarde')
                      .show(context);
                }
                var data = snapshot.data!;
                return SizedBox(
                  height: constraints.maxHeight * 0.65,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var date = DatetimeFormatterWidget.formatDate(
                          data[index].data_lanca);
                      var hour = DatetimeFormatterWidget.formatHour(
                          data[index].data_lanca);
                      var valor =
                          formatoBrasileiro.format(data[index].valor_doc);

                      int idCaixaAberto = informationController.caixaId.value;
                      bool caixaValido = data[index].id_caixa == idCaixaAberto;

                      // TRAZ AS INFORMAÇÕES DAS TRANSAÇÕES EFETUADAS ATRAVÉS DO CARTÃO
                      return caixaValido
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: LegendInformation(
                                    id: data[index].id.toString(),
                                    data: date,
                                    hora: hour,
                                    idVenda: data[index].id_venda.toString(),
                                    valor: valor,
                                    isPrint: true,
                                    isCartao: true,
                                    index: index,
                                    imagemComprovante:
                                        data[index].imagem_comprovante,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : Container();
                    },
                  ),
                );
              },
            )
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: SizedBox(
              width: constraints.maxWidth * 0.5,
              height: constraints.maxHeight * 0.8,
              child: Column(
                children: [
                  // CABEÇALHO
                  HeaderPopup(
                    icon: Icons.print,
                    text: 'Impressão 2ª via',
                  ),

                  // CONTEÚDO - DADOS DO REGISTRO DO CARTÃO E IMPRIMIR
                  dataCardAndPrint(constraints),
                ],
              )),
        );
      },
    );
  }
}
