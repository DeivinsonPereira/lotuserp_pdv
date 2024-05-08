// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import "package:isar/isar.dart";

part 'usuario_logado.g.dart';

@Collection()
class usuario_logado {
  Id id = Isar.autoIncrement;
  int? id_user;
  String? login;
  int? id_colaborador;
  
  usuario_logado({
    this.id_user,
    this.login,
    this.id_colaborador,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_user': id_user,
      'login': login,
      'id_colaborador': id_colaborador,
    };
  }

  factory usuario_logado.fromMap(Map<String, dynamic> map) {
    return usuario_logado(
      id_user: map['id_user'] != null ? map['id_user'] as int : null,
      login: map['login'] != null ? map['login'] as String : null,
      id_colaborador: map['id_colaborador'] != null ? map['id_colaborador'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory usuario_logado.fromJson(String source) => usuario_logado.fromMap(json.decode(source) as Map<String, dynamic>);
}
