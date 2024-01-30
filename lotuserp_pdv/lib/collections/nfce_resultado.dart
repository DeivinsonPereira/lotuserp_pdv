// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:isar/isar.dart';

part 'nfce_resultado.g.dart';

@Collection()
class nfce_resultado {
  Id id = Isar.autoIncrement;
  late int id_caixa;
  late int? id_venda;
  late String? qr_code;
  late String? xml;
}
