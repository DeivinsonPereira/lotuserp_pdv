import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/pagamento_venda.dart';

class PutPagamentoVenda {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<void> put(pagamento_venda pagamentoVenda) async {
    final isar = await _isarService.db;

    try {
      await isar.writeTxn(() async {
        await isar.pagamento_vendas.put(pagamentoVenda);
      });
    } catch (e) {
      _logger.e('Erro ao inserir forma de pagamento: $e');
    }
  }
}
