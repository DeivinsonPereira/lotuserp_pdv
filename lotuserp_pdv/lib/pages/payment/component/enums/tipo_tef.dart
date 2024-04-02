// ignore_for_file: constant_identifier_names

enum TipoTef {
  NENHUMA(0),
  TEF_ElGIN(1),
  TEF_SITEF(2),
  TEF_MERCADO_PAGO(3);

  const TipoTef(this.value);
  
  final int value;

}
