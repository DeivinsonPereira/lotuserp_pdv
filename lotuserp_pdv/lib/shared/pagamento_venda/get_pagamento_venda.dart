import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/pagamento_venda.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class GetPagamentoVenda {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<List<pagamento_venda>> get() async {
    final isar = await _isarService.db;

    try {
      var pagamentos = await isar.pagamento_vendas.where().findAll();

      if (pagamentos.isNotEmpty) {
        return pagamentos;
      } else {
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar forma de pagamento: $e');
      return [];
    }
  }

  Future<List<pagamento_venda?>> getByIdVenda(int id) async {
    final isar = await _isarService.db;

    try {
      List<pagamento_venda?> pagamentos = await isar.pagamento_vendas.filter().id_vendaEqualTo(id).findAll();

      if (pagamentos.isNotEmpty) {
        return pagamentos;
      } else {
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar forma de pagamento: $e');
      return [];
    }
  }
}
