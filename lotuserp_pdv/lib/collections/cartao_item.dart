// ignore_for_file: camel_case_types, non_constant_identifier_names

import "package:isar/isar.dart";

part 'cartao_item.g.dart';

@Collection()
class cartao_item {
  Id id = Isar.autoIncrement;
  late int id_caixa;
  late int id_empresa;
  late int id_usuario;
  late int id_venda;
  late double valor_doc;
  late int parc_qtde;
  late String id_autorizacao;
  late DateTime data_lanca;
  late String imagem_comprovante;
  late int enviado;
}
