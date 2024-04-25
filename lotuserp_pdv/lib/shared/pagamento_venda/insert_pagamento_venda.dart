import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/pagamento_venda.dart';

class InsertPagamentoVenda {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  // Insere as formas de pagamento no banco de dados local
  Future<void> insert(List<pagamento_venda> pagamentos) async {
    final isar = await _isarService.db;

    try {
      await isar.writeTxn(() async {
        await isar.pagamento_vendas.putAll(pagamentos);
      });
    } catch (e) {
      _logger.e('Erro ao inserir forma de pagamento: $e');
      return;
    }
  }
}
