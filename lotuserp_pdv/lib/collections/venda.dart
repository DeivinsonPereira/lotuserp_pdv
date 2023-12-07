// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";
import "package:lotuserp_pdv/collections/venda_item.dart";

part 'venda.g.dart';

@Collection()
class Venda {
  
  Id id = Isar.autoIncrement;
  late DateTime data;
  late String hora;
  late int idEmpresa;
  late int idUsuario;
  late double totBruto;
  late double totDescPrc;
  late double totDescVlr;
  late double totLiquido;
  late double valorTroco;
  late int status;
  late int idSerieNfce;
  late int enviado;

  final vendaProdutos = IsarLink<VendaItem>();

  Venda(
    this.data,
    this.hora,
    this.idEmpresa,
    this.idUsuario,
    this.totBruto,
    this.totDescPrc,
    this.totDescVlr,
    this.totLiquido,
    this.valorTroco,
    this.status,
    this.idSerieNfce,
    this.enviado,
  );
}


