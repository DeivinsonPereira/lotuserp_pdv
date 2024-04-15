// ignore_for_file: use_build_context_synchronously

import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/admin_config.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/dependencies.dart';

class InsertAdminConfig {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  var adminConfigController = Dependencies.adminConfigController();

  Future<bool> insertPassword() async {
    final isar = await _isarService.db;

    var i = await isar.admin_configs.count();

    try {
      if (i >= 0) {
        isar.writeTxn(() async {
          await isar.admin_configs.clear();
        });
      }

      admin_config admin = admin_config(
          senha:
              int.parse(adminConfigController.passwordConfigController.text));

      await isar.writeTxn(() async {
        await isar.admin_configs.put(admin);
      });
      return true;
    } catch (e) {
      _logger.e('Erro ao salvar senha: $e');
      return false;
    }
  }
}
