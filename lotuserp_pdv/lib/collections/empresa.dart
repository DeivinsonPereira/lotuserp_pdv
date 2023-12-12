// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'package:isar/isar.dart';

part 'empresa.g.dart';

@Collection()
class empresa {
  late Id id;
  late String? razao;
  late String? fantasia;
  late String? cnpj;
  late String? insc_estadual;
  late String? insc_municipal;
  late String? fone1;
  late String? fone2;
  late String? fone3;
  late String? endereco;
  late String? bairro;
  late String? numero;
  late String? municipio;
  late String? municipio_uf;
  late String? cep;
  late String? email;
  late String? site;
  late String? complemento;
  late int? estoque_grade;
  late int? usar_paf_nfce;
  late int? param_nf_crt;
  late int? param_pdv_usar_pvista_pprazo;
  late int? param_vendas_tpcomissao;
  late int? param_vendas_portador;
  late double? param_vendas_descmaximo;
  late int? param_pdv_codigopesagem;
  late int? param_pdv_formapagto;
  late int? param_pdv_cliente;
  late int? param_pdv_bloq_est_neg;
  late int? param_pdv_validar_cx_fechado;
  late int? param_pdv_senha_cancelar;
  late int? param_pdv_imp_cp_nf_venda;
  late int? param_pdv_prodcomposto;
  late int? param_pdv_informa_cliente;
  late int? param_pdv_vendedor_venda;
  late int? param_pdv_cartao_gerarparc;
  late int? param_pdv_imp_comprovante;
  late int? param_pdv_permitir_desconto;
  late int? param_pdv_tipo_desconto;
  late int? param_pdv_gerar_senha;
  late int? param_pdv_comanda_producao;

  empresa(
    this.id,
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
  );
}
