// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import "package:isar/isar.dart";

part 'caixa.g.dart';

@Collection()
class caixa {

  Id id_caixa = Isar.autoIncrement;

  late int id_empresa;
  late int abertura_id_user;
  late DateTime abertura_data;
  late String abertura_hora;
  late double abertura_valor;
  late int status;
  late int? fechou_id_user;
  late DateTime? fechou_data;
  late String? fechou_hora;
  late int? enviado;
  late int? id_caixa_servidor;

}
