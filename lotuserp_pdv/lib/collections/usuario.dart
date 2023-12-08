// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class Usuario {
  late Id id = Isar.autoIncrement;
  late int idEmpresa;
  late String? login;
  late int? idColaborador;
  late String? senha;
  late int? status;
  late int? mobDashboard;
  late int? trocarSenha;
  late int? administrador;
  late int? logarEmpresas;
  late int? caixaAbrir;
  late int? caixaMovimentar;
  late int? caixaGerenciar;
  late int? caixaFechar;
  late int? caixaPdv;
  late int? caixaCarga;
  late int? caixaParametros;  

  Usuario(
    this.idEmpresa,
    this.login,
    this.idColaborador,
    this.senha,
    this.status,
    this.mobDashboard,
    this.trocarSenha,
    this.administrador,
    this.logarEmpresas,
    this.caixaAbrir,
    this.caixaMovimentar,
    this.caixaGerenciar,
    this.caixaFechar,
    this.caixaPdv,
    this.caixaCarga,
    this.caixaParametros,
  );
  
  

 
}
