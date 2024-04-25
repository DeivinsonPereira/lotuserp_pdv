// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'nfce_resultado.g.dart';

@Collection()
class nfce_resultado {
  Id id = Isar.autoIncrement;
  int? id_caixa;
  int? id_venda_local;
  int? id_venda_servidor;
  String? qr_code;
  String? xml;
  
  nfce_resultado({
    this.id_caixa,
    this.id_venda_local,
    this.id_venda_servidor,
    this.qr_code,
    this.xml,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_caixa': id_caixa,
      'id_venda_local': id_venda_local,
      'id_venda_servidor': id_venda_servidor,
      'qr_code': qr_code,
      'xml': xml,
    };
  }

  factory nfce_resultado.fromMap(Map<String, dynamic> map) {
    return nfce_resultado(
      id_caixa: map['id_caixa'] != null ? map['id_caixa'] as int : null,
      id_venda_local: map['id_venda_local'] != null ? map['id_venda_local'] as int : null,
      id_venda_servidor: map['id_venda_servidor'] != null ? map['id_venda_servidor'] as int : null,
      qr_code: map['qr_code'] != null ? map['qr_code'] as String : null,
      xml: map['xml'] != null ? map['xml'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory nfce_resultado.fromJson(String source) => nfce_resultado.fromMap(json.decode(source) as Map<String, dynamic>);
}
