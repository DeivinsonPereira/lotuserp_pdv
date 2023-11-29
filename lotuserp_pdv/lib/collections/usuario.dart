// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class Usuario {
  late Id id = Isar.autoIncrement;
  late int idUsuario;
  late int? idUsuarioGrupo;
  late int? idColaborador;
  late String? login;
  late String? senha;
  late int? status;
  late double? vendDescPerc;
  late int? vendExcluirItem;
  late int? vendPdvOff;
  late int? retiradaCx;
  late int? preFechamentocx;
  late int? vendaCancelar;
  late int? pdvoffPessoas;
  late int? pdvoffEmpCad;
  late int? pdvoffEmpSer;
  late int? pdvoffCxAbrir;
  late int? pdvoffCxMov;
  late int? pdvoffCxListar;
  late int? pdvoffCxGerenciar;
  late int? pdvoffCxFechar;
  late int? pdvoffFisOpera;
  late int? pdvoffPdv;
  late int? pdvoffVendas;
  late int? pdvoffRelVendas;
  late int? pdvoffLogOpera;
  late int? pdvoffAuditoria;
  late int? pdvoffCargasAtua;
  late int? pdvoffCargasIntegra;
  late int? pdvoffCargasParametros;
  late int? pdvoffProduto;
  late int? mobDashboard;

  Usuario(
    this.idUsuario,
    this.idUsuarioGrupo,
    this.idColaborador,
    this.login,
    this.senha,
    this.status,
    this.vendDescPerc,
    this.vendExcluirItem,
    this.vendPdvOff,
    this.retiradaCx,
    this.preFechamentocx,
    this.vendaCancelar,
    this.pdvoffPessoas,
    this.pdvoffEmpCad,
    this.pdvoffEmpSer,
    this.pdvoffCxAbrir,
    this.pdvoffCxMov,
    this.pdvoffCxListar,
    this.pdvoffCxGerenciar,
    this.pdvoffCxFechar,
    this.pdvoffFisOpera,
    this.pdvoffPdv,
    this.pdvoffVendas,
    this.pdvoffRelVendas,
    this.pdvoffLogOpera,
    this.pdvoffAuditoria,
    this.pdvoffCargasAtua,
    this.pdvoffCargasIntegra,
    this.pdvoffCargasParametros,
    this.pdvoffProduto,
    this.mobDashboard,
  );

 
}
