// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/services/print_xml.dart/print_nfce_xml.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/dependencies.dart';
import '../common/header_popup.dart';
import 'component/legend_informations_nfce.dart';

class NfceSecondCopyPage extends StatelessWidget {
  const NfceSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    InformationController informationController =
        Dependencies.informationController();

    return Dialog(
      child: Container(
        height: 400,
        width: 400,
        color: Colors.white,
        child: Column(
          children: [
            //HEADER
            HeaderPopup(
              text: '2ª Via NFCe',
              icon: Icons.receipt,
            ),

            // Legenda
            const LegendInformationsNfce(),

            const Divider(
              color: Colors.black12,
            ),
            //corpo
            FutureBuilder(
                future: service.getVendas(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Text('');
                  }
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return SizedBox(
                      height: 290,
                      width: 400,
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            int idCaixaAberto =
                                informationController.caixaId.value;
                            bool caixaValido =
                                data[index]!.id_caixa == idCaixaAberto;

                            return caixaValido
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            InformationsWidget(
                                              data: data[index]!.hora,
                                              width: 100,
                                              padding: 0.0,
                                            ),
                                            InformationsWidget(
                                              data: formatoBrasileiro.format(
                                                  data[index]!.tot_liquido),
                                              width: 100,
                                              padding: 80.0,
                                              isValue: true,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: SizedBox(
                                                width: 50,
                                                child: StreamBuilder(
                                                    stream: service
                                                        .listenNfceResultados(),
                                                    builder:
                                                        (context, resultado) {
                                                      if (!resultado.hasData ||
                                                          resultado.hasError) {
                                                        return const Text('');
                                                      }
                                                      if (resultado.hasData) {
                                                        if (resultado.data!
                                                                .isNotEmpty &&
                                                            resultado
                                                                    .data![
                                                                        index]
                                                                    .xml !=
                                                                null) {
                                                          var nfceResultados =
                                                              resultado.data!;
                                                          return SizedBox(
                                                            width: 100,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                PrintNfceXml()
                                                                    .printNfceXml(
                                                                        xmlArgs:
                                                                            nfceResultados[index].xml);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.print),
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        return const Text('');
                                                      }
                                                      return const Text('');
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Divider(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text('');
                          }),
                    );
                  }
                  return const Text('');
                })
          ],
        ),
      ),
    );
  }
}

class InformationsWidget extends StatelessWidget {
  final dynamic data;
  final double width;
  final double padding;
  bool? isValue;
  InformationsWidget(
      {Key? key,
      required this.data,
      required this.width,
      required this.padding,
      this.isValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: isValue == true
                ? Text(data.toString())
                : Center(child: Text(data.toString())),
          )),
    );
  }
}
