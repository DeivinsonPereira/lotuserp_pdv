// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../services/injection_dependencies.dart';

class CustomTextForma extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextForma({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();

    MovimentRegisterController movimentController =
        InjectionDependencies.movimentRegisterController();

    movimentController.formaDePagamentoController.text = 'DINHEIRO';

    return StreamBuilder(
        stream: service.listenTipo_recebimento(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          }
          if (snapshot.hasError) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                  controller: controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 15, top: 0, bottom: 0),
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    suffixIcon: PopupMenuButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        return snapshot.data!.map((item) {
                          return PopupMenuItem<String>(
                            value: item.descricao,
                            child: Text(
                              item.descricao!,
                              style: const TextStyle(fontSize: 22),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (value) {
                        //informar o formaPagamentoId qual id do item acima foi escolhido

                        movimentController.formaPagamentoId = int.parse(
                          snapshot.data!
                              .firstWhere(
                                (element) => element.descricao == value,
                                orElse: () => snapshot.data!.first,
                              )
                              .id
                              .toString(),
                        );

                        movimentController.formaDePagamentoController.text =
                            value.toString();
                      },
                    ),
                  ),
                ));
          }
          return const SizedBox();
        });
  }
}
