/*// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTefIp {
  String getTefIp(BuildContext context, pagamento_forma pagamentoForma) {
    if (pagamentoForma.tef_ip != null && pagamentoForma.tef_ip.isBlank == false) {
      if (pagamentoForma.tef_tls_tipo == TefTlsTipo.NENHUMA.value) {
        const CustomCherryError(
                message: 'Nenhuma forma de pagamento selecionada')
            .show(context);
        return '';
      } else if (pagamentoForma.tef_tls_tipo ==
          TefTlsTipo.SOFTWARE_EXPRESS.value) {
        return '${pagamentoForma.tef_ip}:443';
      } else if (pagamentoForma.tef_tls_tipo == TefTlsTipo.WNB.value) {
        return '${pagamentoForma.tef_ip}';
      } else if (pagamentoForma.tef_tls_tipo == TefTlsTipo.TEF_GSURF.value) {
        return '${pagamentoForma.tef_ip}';
      } else {
        return '';
      }
    } else {
      const CustomCherryError(
                message: 'Tef ip não informado')
            .show(context);
      return '';
    }
  }
}*/