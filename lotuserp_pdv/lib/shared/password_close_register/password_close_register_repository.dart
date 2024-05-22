import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/password_close_register.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class PasswordCloseRegisterRepository {
  final _passwordCloseRegisterController =
      Dependencies.passwordCloseRegisterController();
  final _isarService = IsarService();
  final _logger = Logger();

  PasswordCloseRegisterRepository._privateConstructor();

  static final PasswordCloseRegisterRepository _instance =
      PasswordCloseRegisterRepository._privateConstructor();

  factory PasswordCloseRegisterRepository() => _instance;

  Future<void> insert(String password) async {
    final isar = await _isarService.db;

    password_close_register passwordClose =
        password_close_register(password: password);

    try {
      var i = await isar.password_close_registers.where().count();

      if (i > 0) {
        isar.writeTxn(() async {
          await isar.password_close_registers.clear();
        });
      }

      await isar.writeTxn(() async {
        await isar.password_close_registers.put(passwordClose);
      });
    } catch (e) {
      _logger.e('Erro ao cadastrar senha: $e');
    }
  }

  Future<password_close_register?> getPassword() async {
    final isar = await _isarService.db;
    try {
      var result = await isar.password_close_registers.where().findFirst();
      if (result != null) {
        _passwordCloseRegisterController.password = result.password;
      }
      return result;
    } catch (e) {
      _logger.e('Erro ao buscar senha: $e');
      return null;
    }
  }
}
