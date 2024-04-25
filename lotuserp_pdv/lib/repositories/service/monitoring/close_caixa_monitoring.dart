import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../../collections/caixa.dart';
import '../../../collections/caixa_fechamento.dart';
import '../../../core/header.dart';
import 'package:http/http.dart' as http;

class CloseCaixaMonitoring {
  final Isar isar;
  final IsarService _isarService;
  final Logger _logger = Logger();

  CloseCaixaMonitoring(this.isar, this._isarService);

  // Monitora o fechamento de caixa
  Future<void> monitorarFechamentoCaixa() async {
    try {
      // Verifica se existe algum caixa fechado no banco local, mas, pendente de envio
      List<caixa?> caixasNaoEnviadas = await isar.caixas
          .filter()
          .statusEqualTo(1)
          .enviadoEqualTo(0)
          .findAll();
      if (caixasNaoEnviadas.isEmpty) {
        _logger.d('Isolate monitoramento status: Todos os caixas enviados');
        return;
      }

      if (caixasNaoEnviadas.isNotEmpty) {
        for (var item in caixasNaoEnviadas) {
          if (item!.id_caixa_servidor != 0) {
            // busca os dados de fechamento
            List<caixa_fechamento> fechamentoCaixa = await isar
                .caixa_fechamentos
                .filter()
                .id_caixaEqualTo(item.id_caixa)
                .findAll();

            // faz o envio para o servidor
            await closeRegister(item, fechamentoCaixa);
          } else {
            _logger.d(
                'Isolate monitoramento status: Sem id caixa servidor. Pendente de envio');
            return;
          }
        }
      } else {
        _logger.d('Isolate monitoramento status: Todos os caixas enviados');
        return;
      }
    } catch (e) {
      _logger.e('Isolate monitoramento: Erro ao monitorar o caixa: $e');
      return;
    }
  }

  Future<void> closeRegister(
      caixa caixa, List<caixa_fechamento> fechamento) async {
    var prefix = await _isarService.getIpEmpresaFromDatabase();
    Uri uri = Uri.parse('${prefix!.ip_empresa}pdvmobpost11_caixa_fechar');

    List<Map<String, dynamic>> fechamentosCaixaMap = [];
    for (var item in fechamento) {
      fechamentosCaixaMap.add({
        "id_tipo_recebimento": item.id_tipo_recebimento,
        "valor_informado": item.valor_informado
      });
    }

    try {
      var requestBody = {
        "fechou_id_user": caixa.abertura_id_user,
        "fechou_data_hora": caixa.fechou_hora,
        "id_caixa_servidor": caixa.id_caixa_servidor,
        "informado": fechamentosCaixaMap
      };

      final response = await http.post(
        uri,
        headers: Header.header,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          caixa.enviado = 1;
          await isar.writeTxn(() async {
            await isar.caixas.put(caixa);
          });
        } else {
          _logger.e(response.body);
        }
      } else {
        _logger.e(response.body);
      }
    } catch (e) {
      _logger.e('Erro ao fechar o caixa: $e');
    }
  }
}
