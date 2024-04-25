// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'produto.g.dart';

@Collection()
class produto {
  Id id_produto;
  int? id_empresa;
  String? grade;
  int? id_grupo;
  String? descricao;
  String? unidade;
  String? gtin;
  int? composto;
  int? venda_kg;
  int? nao_rec_desconto;
  int? status;
  double? saldo_produto;
  double? pvenda;
  int? alt_preco_venda;
  int? alt_preco_venda_tipo;
  int? balanca_tipo_pesagem;
  int? balanca_idproduto;
  String? gtin_grade;
  int? promocao_ativar;
  double? promocao_preco;
  String? promocao_data_inicio;
  String? promocao_data_limite;
  String? promocao_hora_inicial;
  String? promocao_hora_final;
  int? promocao_tipo_desc;
  int? promocao_compre;
  int? promocao_leve;
  int? promocao_apartir;
  double? promocao_apartir_perc;
  int? id_gtrib_vendas_nfe;
  int? id_gtrib_vendas_nfce;
  String? file_imagem;
  int? favorito;
  int? imp_comanda;

  produto(
    this.id_produto,
    this.id_empresa,
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
    this.id_gtrib_vendas_nfe,
    this.id_gtrib_vendas_nfce,
    this.file_imagem,
    this.favorito,
    this.imp_comanda,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_produto': id_produto,
      'id_empresa': id_empresa,
      'grade': grade,
      'id_grupo': id_grupo,
      'descricao': descricao,
      'unidade': unidade,
      'gtin': gtin,
      'composto': composto,
      'venda_kg': venda_kg,
      'nao_rec_desconto': nao_rec_desconto,
      'status': status,
      'saldo_produto': saldo_produto,
      'pvenda': pvenda,
      'alt_preco_venda': alt_preco_venda,
      'alt_preco_venda_tipo': alt_preco_venda_tipo,
      'balanca_tipo_pesagem': balanca_tipo_pesagem,
      'balanca_idproduto': balanca_idproduto,
      'gtin_grade': gtin_grade,
      'promocao_ativar': promocao_ativar,
      'promocao_preco': promocao_preco,
      'promocao_data_inicio': promocao_data_inicio,
      'promocao_data_limite': promocao_data_limite,
      'promocao_hora_inicial': promocao_hora_inicial,
      'promocao_hora_final': promocao_hora_final,
      'promocao_tipo_desc': promocao_tipo_desc,
      'promocao_compre': promocao_compre,
      'promocao_leve': promocao_leve,
      'promocao_apartir': promocao_apartir,
      'promocao_apartir_perc': promocao_apartir_perc,
      'id_gtrib_vendas_nfe': id_gtrib_vendas_nfe,
      'id_gtrib_vendas_nfce': id_gtrib_vendas_nfce,
      'file_imagem': file_imagem,
      'favorito': favorito,
      'imp_comanda': imp_comanda,
    };
  }

  factory produto.fromMap(Map<String, dynamic> map) {
    return produto(
      map['id_produto'] as int,
      map['id_empresa'] != null ? map['id_empresa'] as int : null,
      map['grade'] != null ? map['grade'] as String : null,
      map['id_grupo'] != null ? map['id_grupo'] as int : null,
      map['descricao'] != null ? map['descricao'] as String : null,
      map['unidade'] != null ? map['unidade'] as String : null,
      map['gtin'] != null ? map['gtin'] as String : null,
      map['composto'] != null ? map['composto'] as int : null,
      map['venda_kg'] != null ? map['venda_kg'] as int : null,
      map['nao_rec_desconto'] != null ? map['nao_rec_desconto'] as int : null,
      map['status'] != null ? map['status'] as int : null,
      map['saldo_produto'] != null
          ? map['saldo_produto'] is int
              ? (map['saldo_produto'] as int).toDouble()
              : (map['saldo_produto'] as double)
          : null,
      map['pvenda'] != null
          ? map['pvenda'] is int
              ? (map['pvenda'] as int).toDouble()
              : (map['pvenda'] as double)
          : null,
      map['alt_preco_venda'] != null ? map['alt_preco_venda'] as int : null,
      map['alt_preco_venda_tipo'] != null
          ? map['alt_preco_venda_tipo'] as int
          : null,
      map['balanca_tipo_pesagem'] != null
          ? map['balanca_tipo_pesagem'] as int
          : null,
      map['balanca_idproduto'] != null ? map['balanca_idproduto'] as int : null,
      map['gtin_grade'] != null ? map['gtin_grade'] as String : null,
      map['promocao_ativar'] != null ? map['promocao_ativar'] as int : null,
      map['promocao_preco'] != null
          ? map['promocao_preco'] is int
              ? (map['promocao_preco'] as int).toDouble()
              : (map['promocao_preco'] as double)
          : null,
      map['promocao_data_inicio'] != null
          ? map['promocao_data_inicio'] as String
          : null,
      map['promocao_data_limite'] != null
          ? map['promocao_data_limite'] as String
          : null,
      map['promocao_hora_inicial'] != null
          ? map['promocao_hora_inicial'] as String
          : null,
      map['promocao_hora_final'] != null
          ? map['promocao_hora_final'] as String
          : null,
      map['promocao_tipo_desc'] != null
          ? map['promocao_tipo_desc'] as int
          : null,
      map['promocao_compre'] != null ? map['promocao_compre'] as int : null,
      map['promocao_leve'] != null ? map['promocao_leve'] as int : null,
      map['promocao_apartir'] != null ? map['promocao_apartir'] as int : null,
      map['promocao_apartir_perc'] != null
          ? map['promocao_apartir_perc'] is int
              ? (map['promocao_apartir_perc'] as int).toDouble()
              : (map['promocao_apartir_perc'] as double)
          : null,
      map['id_gtrib_vendas_nfe'] != null
          ? map['id_gtrib_vendas_nfe'] as int
          : null,
      map['id_gtrib_vendas_nfce'] != null
          ? map['id_gtrib_vendas_nfce'] as int
          : null,
      map['file_imagem'] != null ? map['file_imagem'] as String : null,
      map['favorito'] != null ? map['favorito'] as int : null,
      map['imp_comanda'] != null ? map['imp_comanda'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory produto.fromJson(String source) =>
      produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
