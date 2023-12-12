// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'package:isar/isar.dart';

part 'produto.g.dart';

@Collection()
class produto {
  late int id_empresa;
  late Id id_produto;
  late String grade;
  late int? id_grupo;
  late String? descricao;
  late String? unidade;
  late String? gtin;
  late int? composto;
  late int? venda_kg;
  late int? nao_rec_desconto;
  late int? status;
  late double saldo_produto;
  late double pvenda;
  late int? alt_preco_venda;
  late int? alt_preco_venda_tipo;
  late int? balanca_tipo_pesagem;
  late int? balanca_idproduto;
  late String? gtin_grade;
  late int? promocao_ativar;
  late double? promocao_preco;
  late DateTime? promocao_data_inicio;
  late DateTime? promocao_data_limite;
  late String? promocao_hora_inicial;
  late String? promocao_hora_final;
  late int? promocao_tipo_desc;
  late int? promocao_compre;
  late int? promocao_leve;
  late int? promocao_apartir;
  late double? promocao_apartir_perc;
  late String? file_imagem;
  
  produto(
    this.id_empresa,
    this.id_produto,
    this.grade,
    this.id_grupo,
    this.descricao,
    this.unidade,
    this.gtin,
    this.composto,
    this.venda_kg,
    this.nao_rec_desconto,
    this.status,
    this.saldo_produto,
    this.pvenda,
    this.alt_preco_venda,
    this.alt_preco_venda_tipo,
    this.balanca_tipo_pesagem,
    this.balanca_idproduto,
    this.gtin_grade,
    this.promocao_ativar,
    this.promocao_preco,
    this.promocao_data_inicio,
    this.promocao_data_limite,
    this.promocao_hora_inicial,
    this.promocao_hora_final,
    this.promocao_tipo_desc,
    this.promocao_compre,
    this.promocao_leve,
    this.promocao_apartir,
    this.promocao_apartir_perc,
    this.file_imagem,
  );
  
 

  
}
