// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import "package:isar/isar.dart";

part 'caixa.g.dart';

@Collection()
class caixa {

  Id id_caixa = Isar.autoIncrement;

  int? id_empresa;
  int? abertura_id_user;
  DateTime? abertura_data;
  String? abertura_hora;
  double? abertura_valor;
  int? status;
  int? fechou_id_user;
  DateTime? fechou_data;
  String? fechou_hora;
  int? enviado;
  int? id_caixa_servidor;
  
  caixa({
    this.id_empresa,
    this.abertura_id_user,
    this.abertura_data,
    this.abertura_hora,
    this.abertura_valor,
    this.status,
    this.fechou_id_user,
    this.fechou_data,
    this.fechou_hora,
    this.enviado,
    this.id_caixa_servidor,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_empresa': id_empresa,
      'abertura_id_user': abertura_id_user,
      'abertura_data': abertura_data?.millisecondsSinceEpoch,
      'abertura_hora': abertura_hora,
      'abertura_valor': abertura_valor,
      'status': status,
      'fechou_id_user': fechou_id_user,
      'fechou_data': fechou_data?.millisecondsSinceEpoch,
      'fechou_hora': fechou_hora,
      'enviado': enviado,
      'id_caixa_servidor': id_caixa_servidor,
    };
  }

  factory caixa.fromMap(Map<String, dynamic> map) {
    return caixa(
      id_empresa: map['id_empresa'] != null ? map['id_empresa'] as int : null,
      abertura_id_user: map['abertura_id_user'] != null ? map['abertura_id_user'] as int : null,
      abertura_data: map['abertura_data'] != null ? DateTime.fromMillisecondsSinceEpoch(map['abertura_data'] as int) : null,
      abertura_hora: map['abertura_hora'] != null ? map['abertura_hora'] as String : null,
      abertura_valor: map['abertura_valor'] != null ? map['abertura_valor'] is int? (map['abertura_valor'] as int).toDouble() : map['abertura_valor'] as double : null,
      status: map['status'] != null ? map['status'] as int : null,
      fechou_id_user: map['fechou_id_user'] != null ? map['fechou_id_user'] as int : null,
      fechou_data: map['fechou_data'] != null ? DateTime.fromMillisecondsSinceEpoch(map['fechou_data'] as int) : null,
      fechou_hora: map['fechou_hora'] != null ? map['fechou_hora'] as String : null,
      enviado: map['enviado'] != null ? map['enviado'] as int : null,
      id_caixa_servidor: map['id_caixa_servidor'] != null ? map['id_caixa_servidor'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory caixa.fromJson(String source) => caixa.fromMap(json.decode(source) as Map<String, dynamic>);
}
