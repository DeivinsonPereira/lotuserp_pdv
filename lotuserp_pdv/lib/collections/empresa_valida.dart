// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:isar/isar.dart';

part 'empresa_valida.g.dart';

@Collection()
class empresa_valida {
  Id id = Isar.autoIncrement;
  late String nocontrato;
  late DateTime? data_limite;
}
