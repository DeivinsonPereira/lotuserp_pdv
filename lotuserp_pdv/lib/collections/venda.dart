// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import "package:isar/isar.dart";

part 'venda.g.dart';

@Collection()
class venda {
  Id id_venda = Isar.autoIncrement;
  late DateTime data;
  late String hora;
  late int id_empresa;
  late int id_usuario;
  late int id_colaborador;
  late double tot_bruto;
  late double tot_desc_prc;
  late double tot_desc_vlr;
  late double tot_liquido;
  late double valor_troco;
  late int status;
  late int id_serie_nfce;
  late int enviado;
  late String cpf_cnpj;
  late int id_caixa;
  late int id_venda_servidor;
}
