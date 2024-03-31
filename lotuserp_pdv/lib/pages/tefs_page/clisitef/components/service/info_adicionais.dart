/*import 'package:flutter/material.dart';
import 'package:lotus_food_totem/collections/pagamento_forma.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:lotus_food_totem/page/tefs/si_tef/components/common/tef_tls_tipo.dart';

class InfoAdicionais {
  String getInfoAdicionais(
    BuildContext context,
    pagamento_forma pagamentoForma,
  ) {
    if (pagamentoForma.tef_tls_tipo == TefTlsTipo.NENHUMA.value) {
      const CustomCherryError(message: 'Nenhuma forma de pagamento selecionada')
          .show(context);
      return '';
    } else if (pagamentoForma.tef_tls_tipo ==
        TefTlsTipo.SOFTWARE_EXPRESS.value) {
      return 'TipoComunicacaoExterna=SSL;CaminhoCertificado=ca_cert_prod_semEspacos.pem;';
    } else if (pagamentoForma.tef_tls_tipo == TefTlsTipo.WNB.value) {
      return 'TipoComunicacaoExterna=COMNECT;';
    } else if (pagamentoForma.tef_tls_tipo == TefTlsTipo.TEF_GSURF.value) {
      return 'TipoComunicacaoExterna=GSURF.SSL;GSurf.OTP=${pagamentoForma.tef_otp_gsurf};TerminalUUID=${pagamentoForma.tef_gsurf_uuid};';
    } else {
      return '';
    }
  }
}*/