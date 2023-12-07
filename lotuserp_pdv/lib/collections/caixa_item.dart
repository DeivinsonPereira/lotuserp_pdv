// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";

part 'caixa_item.g.dart';

@Collection()
class CaixaItem {

  Id id = Isar.autoIncrement;
  late int idCaixa;
  late String? descricao;
  late DateTime data;
  late String hora;
  late int idTipoRecebimento;
  late double valorCre;
  late double valorDeb;
  late int idVenda;
  late int enviado;

  //construtor
  CaixaItem(
    this.idCaixa,
    this.descricao,
    this.data,
    this.hora,
    this.idTipoRecebimento,
    this.valorCre,
    this.valorDeb,
    this.idVenda,
    this.enviado,
  );

}
