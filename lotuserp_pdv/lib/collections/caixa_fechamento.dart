// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:isar/isar.dart';

part 'caixa_fechamento.g.dart';

@Collection()
class caixa_fechamento {
  Id id = Isar.autoIncrement;
  late int id_caixa;
  late int id_tipo_recebimento;
  late double? valor_informado;
}
