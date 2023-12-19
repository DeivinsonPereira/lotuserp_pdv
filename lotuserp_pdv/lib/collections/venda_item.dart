// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import "package:isar/isar.dart";

part 'venda_item.g.dart';

@Collection()
class venda_item{

  Id id_venda = Isar.autoIncrement;
  
  late int id_produto;
  late int item;
  late double? vlr_vendido;
  late double? qtde;
  late double? tot_bruto;
  late String? grade;

  
}
