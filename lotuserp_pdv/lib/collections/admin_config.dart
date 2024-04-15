// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'admin_config.g.dart';

@Collection()
class admin_config {
  Id id = Isar.autoIncrement;
  int senha;

  admin_config({
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senha': senha,
    };
  }

  factory admin_config.fromMap(Map<String, dynamic> map) {
    return admin_config(
      senha: map['senha'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory admin_config.fromJson(String source) =>
      admin_config.fromMap(json.decode(source) as Map<String, dynamic>);
}
