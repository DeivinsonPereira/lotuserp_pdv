// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import "package:isar/isar.dart";

part 'tipo_recebimento.g.dart';

@Collection()
class tipo_recebimento {

  late Id id;
  late int? id_empresa;
  late String? descricao;
  late int? permite_troco;
  late int? tipo_forma;
  late int? status;
  late int? listar_pdv;
  late int? id_pcontas;
  late int? tef;
  late int? id_fpagto;
  late int? pix_integrado;
  late int? imp_comprovante;
  late int? cortesia;
  late int? obrigar_nfce;
  late int? solicitar_senha;

  tipo_recebimento(
    this.id,
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
  );
}
