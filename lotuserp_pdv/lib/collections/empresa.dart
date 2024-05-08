// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'empresa.g.dart';

@Collection()
class empresa {
  Id id;
  String? razao;
  String? fantasia;
  String? cnpj;
  String? insc_estadual;
  String? insc_municipal;
  String? fone1;
  String? fone2;
  String? fone3;
  String? endereco;
  String? bairro;
  String? numero;
  String? municipio;
  String? municipio_uf;
  String? cep;
  String? email;
  String? site;
  String? complemento;
  int? estoque_grade;
  int? usar_paf_nfce;
  int? param_nf_crt;
  int? param_pdv_usar_pvista_pprazo;
  int? param_vendas_tpcomissao;
  int? param_vendas_portador;
  double? param_vendas_descmaximo;
  int? param_pdv_codigopesagem;
  int? param_pdv_formapagto;
  int? param_pdv_cliente;
  int? param_pdv_bloq_est_neg;
  int? param_pdv_validar_cx_fechado;
  int? param_pdv_senha_cancelar;
  int? param_pdv_imp_cp_nf_venda;
  int? param_pdv_prodcomposto;
  int? param_pdv_informa_cliente;
  int? param_pdv_vendedor_venda;
  int? param_pdv_cartao_gerarparc;
  int? param_pdv_imp_comprovante;
  int? param_pdv_permitir_desconto;
  int? param_pdv_tipo_desconto;
  int? param_pdv_gerar_senha;
  int? param_pdv_comanda_producao;
  
  empresa({
    required this.id,
    this.razao,
    this.fantasia,
    this.cnpj,
    this.insc_estadual,
    this.insc_municipal,
    this.fone1,
    this.fone2,
    this.fone3,
    this.endereco,
    this.bairro,
    this.numero,
    this.municipio,
    this.municipio_uf,
    this.cep,
    this.email,
    this.site,
    this.complemento,
    this.estoque_grade,
    this.usar_paf_nfce,
    this.param_nf_crt,
    this.param_pdv_usar_pvista_pprazo,
    this.param_vendas_tpcomissao,
    this.param_vendas_portador,
    this.param_vendas_descmaximo,
    this.param_pdv_codigopesagem,
    this.param_pdv_formapagto,
    this.param_pdv_cliente,
    this.param_pdv_bloq_est_neg,
    this.param_pdv_validar_cx_fechado,
    this.param_pdv_senha_cancelar,
    this.param_pdv_imp_cp_nf_venda,
    this.param_pdv_prodcomposto,
    this.param_pdv_informa_cliente,
    this.param_pdv_vendedor_venda,
    this.param_pdv_cartao_gerarparc,
    this.param_pdv_imp_comprovante,
    this.param_pdv_permitir_desconto,
    this.param_pdv_tipo_desconto,
    this.param_pdv_gerar_senha,
    this.param_pdv_comanda_producao,
  });


  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'razao': razao,
      'fantasia': fantasia,
      'cnpj': cnpj,
      'insc_estadual': insc_estadual,
      'insc_municipal': insc_municipal,
      'fone1': fone1,
      'fone2': fone2,
      'fone3': fone3,
      'endereco': endereco,
      'bairro': bairro,
      'numero': numero,
      'municipio': municipio,
      'municipio_uf': municipio_uf,
      'cep': cep,
      'email': email,
      'site': site,
      'complemento': complemento,
      'estoque_grade': estoque_grade,
      'usar_paf_nfce': usar_paf_nfce,
      'param_nf_crt': param_nf_crt,
      'param_pdv_usar_pvista_pprazo': param_pdv_usar_pvista_pprazo,
      'param_vendas_tpcomissao': param_vendas_tpcomissao,
      'param_vendas_portador': param_vendas_portador,
      'param_vendas_descmaximo': param_vendas_descmaximo,
      'param_pdv_codigopesagem': param_pdv_codigopesagem,
      'param_pdv_formapagto': param_pdv_formapagto,
      'param_pdv_cliente': param_pdv_cliente,
      'param_pdv_bloq_est_neg': param_pdv_bloq_est_neg,
      'param_pdv_validar_cx_fechado': param_pdv_validar_cx_fechado,
      'param_pdv_senha_cancelar': param_pdv_senha_cancelar,
      'param_pdv_imp_cp_nf_venda': param_pdv_imp_cp_nf_venda,
      'param_pdv_prodcomposto': param_pdv_prodcomposto,
      'param_pdv_informa_cliente': param_pdv_informa_cliente,
      'param_pdv_vendedor_venda': param_pdv_vendedor_venda,
      'param_pdv_cartao_gerarparc': param_pdv_cartao_gerarparc,
      'param_pdv_imp_comprovante': param_pdv_imp_comprovante,
      'param_pdv_permitir_desconto': param_pdv_permitir_desconto,
      'param_pdv_tipo_desconto': param_pdv_tipo_desconto,
      'param_pdv_gerar_senha': param_pdv_gerar_senha,
      'param_pdv_comanda_producao': param_pdv_comanda_producao,
    };
  }

  factory empresa.fromMap(Map<String, dynamic> map) {
    return empresa(
      id: map['id'] as int,
      razao: map['razao'] != null ? map['razao'] as String : null,
      fantasia: map['fantasia'] != null ? map['fantasia'] as String : null,
      cnpj: map['cnpj'] != null ? map['cnpj'] as String : null,
      insc_estadual: map['insc_estadual'] != null ? map['insc_estadual'] as String : null,
      insc_municipal: map['insc_municipal'] != null ? map['insc_municipal'] as String : null,
      fone1: map['fone1'] != null ? map['fone1'] as String : null,
      fone2: map['fone2'] != null ? map['fone2'] as String : null,
      fone3: map['fone3'] != null ? map['fone3'] as String : null,
      endereco: map['endereco'] != null ? map['endereco'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      municipio: map['municipio'] != null ? map['municipio'] as String : null,
      municipio_uf: map['municipio_uf'] != null ? map['municipio_uf'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      site: map['site'] != null ? map['site'] as String : null,
      complemento: map['complemento'] != null ? map['complemento'] as String : null,
      estoque_grade: map['estoque_grade'] != null ? map['estoque_grade'] as int : null,
      usar_paf_nfce: map['usar_paf_nfce'] != null ? map['usar_paf_nfce'] as int : null,
      param_nf_crt: map['param_nf_crt'] != null ? map['param_nf_crt'] as int : null,
      param_pdv_usar_pvista_pprazo: map['param_pdv_usar_pvista_pprazo'] != null ? map['param_pdv_usar_pvista_pprazo'] as int : null,
      param_vendas_tpcomissao: map['param_vendas_tpcomissao'] != null ? map['param_vendas_tpcomissao'] as int : null,
      param_vendas_portador: map['param_vendas_portador'] != null ? map['param_vendas_portador'] as int : null,
      param_vendas_descmaximo: map['param_vendas_descmaximo'] != null ? map['param_vendas_descmaximo'] is int? (map['param_vendas_descmaximo'] as int).toDouble() : map['param_vendas_descmaximo']  as double : null,
      param_pdv_codigopesagem: map['param_pdv_codigopesagem'] != null ? map['param_pdv_codigopesagem'] as int : null,
      param_pdv_formapagto: map['param_pdv_formapagto'] != null ? map['param_pdv_formapagto'] as int : null,
      param_pdv_cliente: map['param_pdv_cliente'] != null ? map['param_pdv_cliente'] as int : null,
      param_pdv_bloq_est_neg: map['param_pdv_bloq_est_neg'] != null ? map['param_pdv_bloq_est_neg'] as int : null,
      param_pdv_validar_cx_fechado: map['param_pdv_validar_cx_fechado'] != null ? map['param_pdv_validar_cx_fechado'] as int : null,
      param_pdv_senha_cancelar: map['param_pdv_senha_cancelar'] != null ? map['param_pdv_senha_cancelar'] as int : null,
      param_pdv_imp_cp_nf_venda: map['param_pdv_imp_cp_nf_venda'] != null ? map['param_pdv_imp_cp_nf_venda'] as int : null,
      param_pdv_prodcomposto: map['param_pdv_prodcomposto'] != null ? map['param_pdv_prodcomposto'] as int : null,
      param_pdv_informa_cliente: map['param_pdv_informa_cliente'] != null ? map['param_pdv_informa_cliente'] as int : null,
      param_pdv_vendedor_venda: map['param_pdv_vendedor_venda'] != null ? map['param_pdv_vendedor_venda'] as int : null,
      param_pdv_cartao_gerarparc: map['param_pdv_cartao_gerarparc'] != null ? map['param_pdv_cartao_gerarparc'] as int : null,
      param_pdv_imp_comprovante: map['param_pdv_imp_comprovante'] != null ? map['param_pdv_imp_comprovante'] as int : null,
      param_pdv_permitir_desconto: map['param_pdv_permitir_desconto'] != null ? map['param_pdv_permitir_desconto'] as int : null,
      param_pdv_tipo_desconto: map['param_pdv_tipo_desconto'] != null ? map['param_pdv_tipo_desconto'] as int : null,
      param_pdv_gerar_senha: map['param_pdv_gerar_senha'] != null ? map['param_pdv_gerar_senha'] as int : null,
      param_pdv_comanda_producao: map['param_pdv_comanda_producao'] != null ? map['param_pdv_comanda_producao'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory empresa.fromJson(String source) => empresa.fromMap(json.decode(source) as Map<String, dynamic>);
}
