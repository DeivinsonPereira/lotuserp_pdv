// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:isar/isar.dart";

part 'caixa.g.dart';

@Collection()
class Caixa {

  Id idCaixa = Isar.autoIncrement;

  late int idEmpresa;
  late int aberturaIdUser;
  late DateTime aberturaData;
  late String aberturaHora;
  late double aberturaValor;
  late int status;
  late int fechouIdUser;
  late DateTime fechouData;
  late String fechouHora;
  late double fechouValor;
  late int enviado;
  late int idCaixaServidor;

}
