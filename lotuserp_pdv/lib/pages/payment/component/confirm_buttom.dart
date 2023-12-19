// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/venda.dart';

class ConfirmButtom extends StatelessWidget {
  const ConfirmButtom({
    Key? key,
    this.isConfirmation = false,
    required this.text,
    this.onConfirm,
  }) : super(key: key);

  final bool isConfirmation;
  final String text;
  final Function(String value)? onConfirm;

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();

    return TextButton(
      onPressed: () {
       /* var vendaExecutada = venda()
        ..data = DateTime.now()
        ..hora = DateTime.now().hour.toString()
        ..id_empresa = //id empresa
        ..id_usuario = //id usuario logado
        ..tot_bruto = //tot_bruto
        ..tot_desc_prc =
        ..tot_desc_vlr =
        ..tot_liquido =
        ..valor_troco =
        ..status =
        ..id_serie_nfce =
        ..enviado =
        ..cpf_cnpj =

        !isConfirmation ? Get.back() : service.insertCaixaWithCaixaItem(vendaExecutada);
*/
        
      },
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isConfirmation ? Colors.black : Colors.white)),
    );
  }
}
