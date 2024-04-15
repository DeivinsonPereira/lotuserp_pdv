import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../collections/admin_config.dart';

class GetAdminConfig {
  final IsarService _isarService = IsarService();

  Future<admin_config?> getAdmin() async {
    final isar = await _isarService.db;

    try {
      return await isar.admin_configs.where().findFirst();
    } catch (e) {
      return null;
    }
  }
}
