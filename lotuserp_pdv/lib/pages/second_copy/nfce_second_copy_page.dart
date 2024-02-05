// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/pages/payment/component/row_widget.dart';
import 'package:lotuserp_pdv/pages/second_copy/component/checkbox_controller.dart';
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
    CheckboxController checkboxController = Dependencies.checkboxController();

    return Dialog(
      child: Container(
        height: 500,
        width: 500,
        color: Colors.white,
        child: Column(
          children: [
            //HEADER
            Obx(() => HeaderPopup(
                  text:
                      'Vendas do caixa: ${informationController.caixaId.value.toString().padLeft(5, '0')}',
                  icon: Icons.receipt,
                  nfce: true,
                )),

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
                      height: 350,
                      width: 500,
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
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: checkboxController
                                                    .selectedItems[index] ??
                                                false,
                                            onChanged: (value) {
                                              checkboxController
                                                  .toggleItem(index);
                                            },
                                          ),
                                          InformationsWidget(
                                            data:
                                                data[index]!.id_venda_servidor,
                                            width: Get.width * 0.075,
                                          ),
                                          InformationsWidget(
                                            data: data[index]!.hora,
                                            width: Get.width * 0.2,
                                          ),
                                          InformationsWidget(
                                            data: formatoBrasileiro.format(
                                                data[index]!.tot_liquido),
                                            width: Get.width * 0.03,
                                          ),
                                        ],
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
  const InformationsWidget({
    Key? key,
    required this.data,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          data.toString(),
        ),
      ),
    );
  }
}
