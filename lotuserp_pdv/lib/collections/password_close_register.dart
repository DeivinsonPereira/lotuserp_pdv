// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'password_close_register.g.dart';

@Collection()
class password_close_register {
  Id id = Isar.autoIncrement;
  String password;
  
  password_close_register({
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }

  factory password_close_register.fromMap(Map<String, dynamic> map) {
    return password_close_register(
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory password_close_register.fromJson(String source) => password_close_register.fromMap(json.decode(source) as Map<String, dynamic>);
}
