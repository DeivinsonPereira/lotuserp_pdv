// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import "package:isar/isar.dart";

part 'tipo_recebimento.g.dart';

@Collection()
class tipo_recebimento {

  Id id;
  int? id_empresa;
  String? descricao;
  int? permite_troco;
  int? tipo_forma;
  int? status;
  int? listar_pdv;
  int? id_pcontas;
  int? tef;
  int? id_fpagto;
  int? pix_integrado;
  int? imp_comprovante;
  int? cortesia;
  int? obrigar_nfce;
  int? solicitar_senha;
  
  tipo_recebimento({
    required this.id,
    this.id_empresa,
    this.descricao,
    this.permite_troco,
    this.tipo_forma,
    this.status,
    this.listar_pdv,
    this.id_pcontas,
    this.tef,
    this.id_fpagto,
    this.pix_integrado,
    this.imp_comprovante,
    this.cortesia,
    this.obrigar_nfce,
    this.solicitar_senha,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_empresa': id_empresa,
      'descricao': descricao,
      'permite_troco': permite_troco,
      'tipo_forma': tipo_forma,
      'status': status,
      'listar_pdv': listar_pdv,
      'id_pcontas': id_pcontas,
      'tef': tef,
      'id_fpagto': id_fpagto,
      'pix_integrado': pix_integrado,
      'imp_comprovante': imp_comprovante,
      'cortesia': cortesia,
      'obrigar_nfce': obrigar_nfce,
      'solicitar_senha': solicitar_senha,
    };
  }

  factory tipo_recebimento.fromMap(Map<String, dynamic> map) {
    return tipo_recebimento(
      id: map['id'] as int,
      id_empresa: map['id_empresa'] != null ? map['id_empresa'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      permite_troco: map['permite_troco'] != null ? map['permite_troco'] as int : null,
      tipo_forma: map['tipo_forma'] != null ? map['tipo_forma'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      listar_pdv: map['listar_pdv'] != null ? map['listar_pdv'] as int : null,
      id_pcontas: map['id_pcontas'] != null ? map['id_pcontas'] as int : null,
      tef: map['tef'] != null ? map['tef'] as int : null,
      id_fpagto: map['id_fpagto'] != null ? map['id_fpagto'] as int : null,
      pix_integrado: map['pix_integrado'] != null ? map['pix_integrado'] as int : null,
      imp_comprovante: map['imp_comprovante'] != null ? map['imp_comprovante'] as int : null,
      cortesia: map['cortesia'] != null ? map['cortesia'] as int : null,
      obrigar_nfce: map['obrigar_nfce'] != null ? map['obrigar_nfce'] as int : null,
      solicitar_senha: map['solicitar_senha'] != null ? map['solicitar_senha'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory tipo_recebimento.fromJson(String source) => tipo_recebimento.fromMap(json.decode(source) as Map<String, dynamic>);
}
