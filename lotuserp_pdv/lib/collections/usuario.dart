// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class usuario {
  late Id id;
  late String? login;
  late int? id_colaborador;
  late String? senha;
  late int? status;
  late int? mob_dashboard;
  late int? trocar_senha;
  late int? administrador;
  late int? logar_empresas;
  late int? caixa_abrir;
  late int? caixa_movimentar;
  late int? caixa_gerenciar;
  late int? caixa_fechar;
  late int? caixa_pdv;
  late int? caixa_carga;
  late int? caixa_parametros;  

  usuario(
    this.id,
    this.login,
    this.id_colaborador,
    this.senha,
    this.status,
    this.mob_dashboard,
    this.trocar_senha,
    this.administrador,
    this.logar_empresas,
    this.caixa_abrir,
    this.caixa_movimentar,
    this.caixa_gerenciar,
    this.caixa_fechar,
    this.caixa_pdv,
    this.caixa_carga,
    this.caixa_parametros,
  );
 
}
