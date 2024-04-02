// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'package:isar/isar.dart';

part 'dado_empresa.g.dart';

@Collection()
class dado_empresa {
  late Id id = Isar.autoIncrement;
  late String? ip_empresa;
  late int? id_empresa;
  late int? id_nfce;
  late int? num_caixa;
  late int? intervalo_envio;
  late String? tef;
  late int? status_tef;
  late String? balanca;
  late int? status_balanca;
  late int? velocidade_balanca;
  late String? nome_balanca;
  late String? tamanho_impressora;
  late String cor_fundo;
}
