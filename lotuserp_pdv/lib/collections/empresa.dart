// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'empresa.g.dart';

@Collection()
class Empresa {
  late Id idAutoincrement = Isar.autoIncrement;
  late int id;
  late String? razao;
  late String? fantasia;
  late String? cnpj;
  late String? inscEstadual;
  late String? inscMunicipal;
  late String? fone1;
  late String? fone2;
  late String? fone3;
  late String? endereco;
  late String? bairro;
  late String? numero;
  late String? municipio;
  late String? municipioUf;
  late String? cep;
  late String? site;
  late String? email;
  late String? complemento;
  late int? estoqueGrade;
  late int? usarPagNfce;
  late int? paramNfCrt;
  late int? pdvUsarPvistaPprazo;
  late int? paramVendasTpcomissao;
  late int? paramVendasPortador;
  late double? paramVendasDescmaximo;
  late int? paramPdvCodigopesagem;
  late int? paramPdvFormapagto;
  late int? paramPdvCliente;
  late int? paramPdvBloqEstNeg;
  late int? paramPdvValidarCxFechado;
  late int? paramPdvSenhaCancelar;
  late int? paramPdvImpCpNfVenda;
  late int? paramPdvProdcomposto;
  late int? paramPdvInformaCliente;
  late int? paramPdvVendedorVenda;
  late int? paramPdvCartaoGerarparc;
  late int? paramPdvImpComprovante;
  late int? paramPdvPermitirDesconto;
  late int? paramPdvTipoDesconto;
  late int? paramPdvGerarSenha;
  late int? paramPdvComandaProducao;

  Empresa(
    this.id,
    this.razao,
    this.fantasia,
    this.cnpj,
    this.inscEstadual,
    this.inscMunicipal,
    this.fone1,
    this.fone2,
    this.fone3,
    this.endereco,
    this.bairro,
    this.numero,
    this.municipio,
    this.municipioUf,
    this.cep,
    this.site,
    this.email,
    this.complemento,
    this.estoqueGrade,
    this.usarPagNfce,
    this.paramNfCrt,
    this.pdvUsarPvistaPprazo,
    this.paramVendasTpcomissao,
    this.paramVendasPortador,
    this.paramVendasDescmaximo,
    this.paramPdvCodigopesagem,
    this.paramPdvFormapagto,
    this.paramPdvCliente,
    this.paramPdvBloqEstNeg,
    this.paramPdvValidarCxFechado,
    this.paramPdvSenhaCancelar,
    this.paramPdvImpCpNfVenda,
    this.paramPdvProdcomposto,
    this.paramPdvInformaCliente,
    this.paramPdvVendedorVenda,
    this.paramPdvCartaoGerarparc,
    this.paramPdvImpComprovante,
    this.paramPdvPermitirDesconto,
    this.paramPdvTipoDesconto,
    this.paramPdvGerarSenha,
    this.paramPdvComandaProducao,
  );
}
