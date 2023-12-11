// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";

part 'venda_item.g.dart';

@Collection()
class VendaItem {

  Id id = Isar.autoIncrement;
  
  @Index()
  late int idVenda; //id da venda que vem da tabela Venda
  late int idProduto;
  late int item;
  late double? vlrVendido;
  late double? qtde;
  late double? totBruto;
  late String? grade;

  VendaItem(
    this.idVenda,
    this.idProduto,
    this.item,
    this.vlrVendido,
    this.qtde,
    this.totBruto,
    this.grade,
  );
}
