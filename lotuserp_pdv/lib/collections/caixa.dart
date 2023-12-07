// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";
import "package:lotuserp_pdv/collections/caixa_item.dart";

part 'caixa.g.dart';

@Collection()
class Caixa {

  Id id = Isar.autoIncrement;
  late int idVenda;
  late int idProduto;
  late int item;
  late double vlrVendido;
  late double qtde;
  late double totBruto;
  late String grade;

  final caixaItens = IsarLink<CaixaItem>();

  Caixa(
    this.idVenda,
    this.idProduto,
    this.item,
    this.vlrVendido,
    this.qtde,
    this.totBruto,
    this.grade,
  );

}
