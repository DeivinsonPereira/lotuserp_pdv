// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import "package:isar/isar.dart";

part 'caixa_item.g.dart';

@Collection()
class caixa_item {

  Id id = Isar.autoIncrement;
  late int id_caixa; //id do caixa que vem da tabela Caixa
  late String? descricao;
  late DateTime data;
  late String hora;
  late int id_tipo_recebimento;
  late double? valor_cre;
  late double? valor_deb;
  late int? id_venda;
  late int enviado;

}
