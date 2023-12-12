// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import "package:isar/isar.dart";

part 'usuario_logado.g.dart';

@Collection()
class usuario_logado {
  late Id id = Isar.autoIncrement;
  late int? id_user;
  late String? login;
  late int? id_colaborador;
}
