// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/venda.dart';
import '../../../services/print_xml.dart/print_nfce_xml.dart';

class LogicSecondPrint {
  var checkboxController = Dependencies.checkboxController();
  var informationController = Dependencies.informationController();
  Logger logger = Logger();
  IsarService service = IsarService();

  // Faz a impressão de nfce
  Future<void> printNfce(venda vendaSelected, BuildContext context) async {
    if (checkboxController.selectedItem.value != -1) {
      var data = informationController
          .vendasLista[checkboxController.selectedItem.value];
      if (data != null) {
        var nfce = await service
            .getDadosNfceByIdVendaServidor(vendaSelected.id_venda_servidor);

        if (nfce != null) {
          var configController = Dependencies.configcontroller();
          var tamanhoImpressora = configController.tamanhoImpressora.value;
          if (tamanhoImpressora != 'SEM IMPRESSORA') {
            await PrintNfceXml().printNfceXml(
                xmlArgs: nfce.xml, isContingencia: nfce.isContingencia!);
          }
        } else {
          const CustomCherryError(
                  message: 'Falha ao imprimir nfce, tente novamente.')
              .show(context);
          logger.e('Nfce não encontrada');
        }
      } else {
        logger.e('Venda não encontrada');
      }
    } else {
      logger.e('Selecione uma venda');
    }
  }

  // Faz a impressão do TEF
  Future<void> printTef() async {
    if (checkboxController.selectedItem.value != -1) {
      var data = informationController
          .vendasTef[checkboxController.selectedItem.value];
      if (data != null) {
        var tef = await service.getDadosTefByIdVenda(data.id_venda);

        if (tef != null) {
          var configController = Dependencies.configcontroller();
          var tamanhoImpressora = configController.tamanhoImpressora.value;
          if (tamanhoImpressora != 'SEM IMPRESSORA') {
            PrintNfceXml().printNfceXml(
              xmlArgs: tef.imagem_comprovante,
            );
          }
        } else {
          logger.e('Comprovante TEF não encontrado');
        }
      } else {
        logger.e('Comprovante não encontrada');
      }
    } else {
      logger.e('Selecione uma venda');
    }
  }
}
