// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/services/print_xml.dart/print_nfce_xml.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../common/header_popup.dart';
import 'component/legend_informations_nfce.dart';

class NfceSecondCopyPage extends StatelessWidget {
  const NfceSecondCopyPage({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();

    return Dialog(
      child: Container(
        height: 400,
        width: 600,
        color: Colors.white,
        child: Column(
          children: [
            //HEADER
            const HeaderPopup(
              text: '2ª Via NFCe',
              icon: Icons.receipt,
            ),

            // Legenda
            const LegendInformationsNfce(),
            //corpo
            StreamBuilder(
                stream: service.listenNfceResultados(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Text('');
                  }
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return SizedBox(
                      height: 300,
                      width: 600,
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(
                                    color: Colors.black45,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35.0),
                                          child: Text(
                                            data[index].id.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(data[index]
                                                .id_venda
                                                .toString()),
                                          )),
                                      SizedBox(
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 35.0),
                                          child: IconButton(
                                            onPressed: () {
                                              PrintNfceXml().printNfceXml(
                                                  xmlArgs: data[index].xml);
                                            },
                                            icon: const Icon(Icons.print),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
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
