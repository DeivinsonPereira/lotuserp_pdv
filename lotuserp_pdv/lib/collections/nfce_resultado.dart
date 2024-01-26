import 'package:isar/isar.dart';

part 'nfce_resultado.g.dart';

@Collection()
class nfce_resultado {
  Id id = Isar.autoIncrement;
  late int? id_venda;
  late String? qr_code;
  late String? xml;
}
