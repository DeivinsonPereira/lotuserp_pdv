// ignore_for_file: public_member_api_docs, sort_constructors_first
class Payment {
  String id;
  String nome;
  String valor;
  String? parcelas;
  String? financiamento;
  bool transacaoBemSucedida; // Novo campo

  Payment({
    required this.id,
    required this.nome,
    required this.valor,
    this.parcelas,
    this.financiamento,
    this.transacaoBemSucedida = false,
  });
}
