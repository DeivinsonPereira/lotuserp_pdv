// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";

part 'usuario_logado.g.dart';

@Collection()
class UsuarioLogado {
  late Id id = Isar.autoIncrement;
  late int? idUser;
  late String? login;
  late int? idColaborador;
}
