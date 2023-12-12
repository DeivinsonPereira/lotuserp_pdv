// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'produto.g.dart';

@Collection()
class Produto {
  late Id idAUtoincrement = Isar.autoIncrement;

  late int idEmpresa;
  late int idProduto;
  late String grade;
  late int? idGrupo;
  late String? descricao;
  late String? unidade;
  late String? gtin;
  late int? composto;
  late int? vendaKg;
  late int? naoRecDesconto;
  late int? status;
  late double saldoProduto;
  late double pvenda;
  late int? altPrecoVenda;
  late int? altPrecoVendaTipo;
  late int? balancaTipoPesagem;
  late int? balancaIdproduto;
  late String? gtinGrade;
  late int? promocaoAtivar;
  late double? promocaoPreco;
  late DateTime? promocaoDataInicio;
  late DateTime? promocaoDataLimite;
  late String? promocaoHoraInicial;
  late String? promocaoHoraFinal;
  late int? promocaoTipoDesc;
  late int? promocaoCompre;
  late int? promocaoLeve;
  late int? promocaoApartir;
  late double? promocaoApartirPerc;
  late String? fileImagem;

  Produto(
    
    this.idEmpresa,
    this.idProduto,
    this.grade,
    this.idGrupo,
    this.descricao,
    this.unidade,
    this.gtin,
    this.composto,
    this.vendaKg,
    this.naoRecDesconto,
    this.status,
    this.saldoProduto,
    this.pvenda,
    this.altPrecoVenda,
    this.altPrecoVendaTipo,
    this.balancaTipoPesagem,
    this.balancaIdproduto,
    this.gtinGrade,
    this.promocaoAtivar,
    this.promocaoPreco,
    this.promocaoDataInicio,
    this.promocaoDataLimite,
    this.promocaoHoraInicial,
    this.promocaoHoraFinal,
    this.promocaoTipoDesc,
    this.promocaoCompre,
    this.promocaoLeve,
    this.promocaoApartir,
    this.promocaoApartirPerc,
    this.fileImagem,
  );
}
