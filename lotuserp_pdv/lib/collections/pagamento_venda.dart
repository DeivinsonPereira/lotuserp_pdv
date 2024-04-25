// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'pagamento_venda.g.dart';

@Collection()
class pagamento_venda {
  Id id = Isar.autoIncrement;
  int? id_venda;
  int? id_caixa_servidor;
  int? id_forma_pagamento;
  double? valor_creditado;

  pagamento_venda({
    this.id_venda,
    this.id_caixa_servidor,
    this.id_forma_pagamento,
    this.valor_creditado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_venda': id_venda,
      'id_caixa_servidor': id_caixa_servidor,
      'id_forma_pagamento': id_forma_pagamento,
      'valor_creditado': valor_creditado,
    };
  }

  factory pagamento_venda.fromMap(Map<String, dynamic> map) {
    return pagamento_venda(
      id_venda: map['idVenda'] != null ? map['idVenda'] as int : null,
      id_caixa_servidor: map['idCaixaServidor'] != null ? map['idCaixaServidor'] as int : null,
      id_forma_pagamento:
          map['tipo_movimento'] != null ? map['tipo_movimento'] as int : null,
      valor_creditado: map['valor_cre'] != null
          ? map['valor_cre'] is int
              ? (map['valor_cre'] as int).toDouble()
              : map['valor_cre'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory pagamento_venda.fromJson(String source) =>
      pagamento_venda.fromMap(json.decode(source) as Map<String, dynamic>);
}
