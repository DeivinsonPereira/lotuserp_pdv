// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'produto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetprodutoCollection on Isar {
  IsarCollection<produto> get produtos => this.collection();
}

const ProdutoSchema = CollectionSchema(
  name: r'produto',
  id: -7709859153173029853,
  properties: {
    r'alt_preco_venda': PropertySchema(
      id: 0,
      name: r'alt_preco_venda',
      type: IsarType.long,
    ),
    r'alt_preco_venda_tipo': PropertySchema(
      id: 1,
      name: r'alt_preco_venda_tipo',
      type: IsarType.long,
    ),
    r'balanca_idproduto': PropertySchema(
      id: 2,
      name: r'balanca_idproduto',
      type: IsarType.long,
    ),
    r'balanca_tipo_pesagem': PropertySchema(
      id: 3,
      name: r'balanca_tipo_pesagem',
      type: IsarType.long,
    ),
    r'composto': PropertySchema(
      id: 4,
      name: r'composto',
      type: IsarType.long,
    ),
    r'descricao': PropertySchema(
      id: 5,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'file_imagem': PropertySchema(
      id: 6,
      name: r'file_imagem',
      type: IsarType.string,
    ),
    r'grade': PropertySchema(
      id: 7,
      name: r'grade',
      type: IsarType.string,
    ),
    r'gtin': PropertySchema(
      id: 8,
      name: r'gtin',
      type: IsarType.string,
    ),
    r'gtin_grade': PropertySchema(
      id: 9,
      name: r'gtin_grade',
      type: IsarType.string,
    ),
    r'id_empresa': PropertySchema(
      id: 10,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_grupo': PropertySchema(
      id: 11,
      name: r'id_grupo',
      type: IsarType.long,
    ),
    r'nao_rec_desconto': PropertySchema(
      id: 12,
      name: r'nao_rec_desconto',
      type: IsarType.long,
    ),
    r'promocao_apartir': PropertySchema(
      id: 13,
      name: r'promocao_apartir',
      type: IsarType.long,
    ),
    r'promocao_apartir_perc': PropertySchema(
      id: 14,
      name: r'promocao_apartir_perc',
      type: IsarType.double,
    ),
    r'promocao_ativar': PropertySchema(
      id: 15,
      name: r'promocao_ativar',
      type: IsarType.long,
    ),
    r'promocao_compre': PropertySchema(
      id: 16,
      name: r'promocao_compre',
      type: IsarType.long,
    ),
    r'promocao_data_inicio': PropertySchema(
      id: 17,
      name: r'promocao_data_inicio',
      type: IsarType.dateTime,
    ),
    r'promocao_data_limite': PropertySchema(
      id: 18,
      name: r'promocao_data_limite',
      type: IsarType.dateTime,
    ),
    r'promocao_hora_final': PropertySchema(
      id: 19,
      name: r'promocao_hora_final',
      type: IsarType.string,
    ),
    r'promocao_hora_inicial': PropertySchema(
      id: 20,
      name: r'promocao_hora_inicial',
      type: IsarType.string,
    ),
    r'promocao_leve': PropertySchema(
      id: 21,
      name: r'promocao_leve',
      type: IsarType.long,
    ),
    r'promocao_preco': PropertySchema(
      id: 22,
      name: r'promocao_preco',
      type: IsarType.double,
    ),
    r'promocao_tipo_desc': PropertySchema(
      id: 23,
      name: r'promocao_tipo_desc',
      type: IsarType.long,
    ),
    r'pvenda': PropertySchema(
      id: 24,
      name: r'pvenda',
      type: IsarType.double,
    ),
    r'saldo_produto': PropertySchema(
      id: 25,
      name: r'saldo_produto',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 26,
      name: r'status',
      type: IsarType.long,
    ),
    r'unidade': PropertySchema(
      id: 27,
      name: r'unidade',
      type: IsarType.string,
    ),
    r'venda_kg': PropertySchema(
      id: 28,
      name: r'venda_kg',
      type: IsarType.long,
    )
  },
  estimateSize: _produtoEstimateSize,
  serialize: _produtoSerialize,
  deserialize: _produtoDeserialize,
  deserializeProp: _produtoDeserializeProp,
  idName: r'id_produto',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _produtoGetId,
  getLinks: _produtoGetLinks,
  attach: _produtoAttach,
  version: '3.1.0+1',
);

int _produtoEstimateSize(
  produto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.descricao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.file_imagem;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.grade.length * 3;
  {
    final value = object.gtin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gtin_grade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promocao_hora_final;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promocao_hora_inicial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unidade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _produtoSerialize(
  produto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.alt_preco_venda);
  writer.writeLong(offsets[1], object.alt_preco_venda_tipo);
  writer.writeLong(offsets[2], object.balanca_idproduto);
  writer.writeLong(offsets[3], object.balanca_tipo_pesagem);
  writer.writeLong(offsets[4], object.composto);
  writer.writeString(offsets[5], object.descricao);
  writer.writeString(offsets[6], object.file_imagem);
  writer.writeString(offsets[7], object.grade);
  writer.writeString(offsets[8], object.gtin);
  writer.writeString(offsets[9], object.gtin_grade);
  writer.writeLong(offsets[10], object.id_empresa);
  writer.writeLong(offsets[11], object.id_grupo);
  writer.writeLong(offsets[12], object.nao_rec_desconto);
  writer.writeLong(offsets[13], object.promocao_apartir);
  writer.writeDouble(offsets[14], object.promocao_apartir_perc);
  writer.writeLong(offsets[15], object.promocao_ativar);
  writer.writeLong(offsets[16], object.promocao_compre);
  writer.writeDateTime(offsets[17], object.promocao_data_inicio);
  writer.writeDateTime(offsets[18], object.promocao_data_limite);
  writer.writeString(offsets[19], object.promocao_hora_final);
  writer.writeString(offsets[20], object.promocao_hora_inicial);
  writer.writeLong(offsets[21], object.promocao_leve);
  writer.writeDouble(offsets[22], object.promocao_preco);
  writer.writeLong(offsets[23], object.promocao_tipo_desc);
  writer.writeDouble(offsets[24], object.pvenda);
  writer.writeDouble(offsets[25], object.saldo_produto);
  writer.writeLong(offsets[26], object.status);
  writer.writeString(offsets[27], object.unidade);
  writer.writeLong(offsets[28], object.venda_kg);
}

produto _produtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = produto(
    reader.readLong(offsets[10]),
    id,
    reader.readString(offsets[7]),
    reader.readLongOrNull(offsets[11]),
    reader.readStringOrNull(offsets[5]),
    reader.readStringOrNull(offsets[27]),
    reader.readStringOrNull(offsets[8]),
    reader.readLongOrNull(offsets[4]),
    reader.readLongOrNull(offsets[28]),
    reader.readLongOrNull(offsets[12]),
    reader.readLongOrNull(offsets[26]),
    reader.readDouble(offsets[25]),
    reader.readDouble(offsets[24]),
    reader.readLongOrNull(offsets[0]),
    reader.readLongOrNull(offsets[1]),
    reader.readLongOrNull(offsets[3]),
    reader.readLongOrNull(offsets[2]),
    reader.readStringOrNull(offsets[9]),
    reader.readLongOrNull(offsets[15]),
    reader.readDoubleOrNull(offsets[22]),
    reader.readDateTimeOrNull(offsets[17]),
    reader.readDateTimeOrNull(offsets[18]),
    reader.readStringOrNull(offsets[20]),
    reader.readStringOrNull(offsets[19]),
    reader.readLongOrNull(offsets[23]),
    reader.readLongOrNull(offsets[16]),
    reader.readLongOrNull(offsets[21]),
    reader.readLongOrNull(offsets[13]),
    reader.readDoubleOrNull(offsets[14]),
    reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _produtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _produtoGetId(produto object) {
  return object.id_produto;
}

List<IsarLinkBase<dynamic>> _produtoGetLinks(produto object) {
  return [];
}

void _produtoAttach(IsarCollection<dynamic> col, Id id, produto object) {
  object.id_produto = id;
}

extension produtoQueryWhereSort on QueryBuilder<produto, produto, QWhere> {
  QueryBuilder<produto, produto, QAfterWhere> anyId_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension produtoQueryWhere on QueryBuilder<produto, produto, QWhereClause> {
  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoEqualTo(
      Id id_produto) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_produto,
        upper: id_produto,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoNotEqualTo(
      Id id_produto) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_produto, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_produto, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_produto, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_produto, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoGreaterThan(
      Id id_produto,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_produto, includeLower: include),
      );
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoLessThan(
      Id id_produto,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_produto, includeUpper: include),
      );
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoBetween(
    Id lowerId_produto,
    Id upperId_produto, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_produto,
        includeLower: includeLower,
        upper: upperId_produto,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension produtoQueryFilter
    on QueryBuilder<produto, produto, QFilterCondition> {
  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_vendaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alt_preco_venda',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_vendaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alt_preco_venda',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> alt_preco_vendaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alt_preco_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_vendaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alt_preco_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> alt_preco_vendaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alt_preco_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> alt_preco_vendaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alt_preco_venda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alt_preco_venda_tipo',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alt_preco_venda_tipo',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alt_preco_venda_tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alt_preco_venda_tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alt_preco_venda_tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      alt_preco_venda_tipoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alt_preco_venda_tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanca_idproduto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanca_idproduto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanca_idproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanca_idproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanca_idproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_idprodutoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanca_idproduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanca_tipo_pesagem',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanca_tipo_pesagem',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanca_tipo_pesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanca_tipo_pesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanca_tipo_pesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      balanca_tipo_pesagemBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanca_tipo_pesagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'composto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'composto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'composto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'composto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'composto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> compostoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'composto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'file_imagem',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'file_imagem',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'file_imagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file_imagem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      file_imagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gtin',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gtin',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gtin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gtin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gtin_grade',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gtin_grade',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gtin_grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gtin_grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gtin_grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin_grade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtin_gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gtin_grade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_empresaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_empresaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_empresaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_empresaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_grupo',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_grupo',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_produto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      nao_rec_descontoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nao_rec_desconto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      nao_rec_descontoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nao_rec_desconto',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> nao_rec_descontoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nao_rec_desconto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      nao_rec_descontoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nao_rec_desconto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      nao_rec_descontoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nao_rec_desconto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> nao_rec_descontoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nao_rec_desconto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_apartir',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_apartir',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_apartirEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_apartir',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartirGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_apartir',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartirLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_apartir',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_apartirBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_apartir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_apartir_perc',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_apartir_perc',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_apartir_perc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_apartir_perc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_apartir_perc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_apartir_percBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_apartir_perc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_ativarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_ativar',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_ativarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_ativar',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_ativarEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_ativar',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_ativarGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_ativar',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_ativarLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_ativar',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_ativarBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_ativar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_compreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_compre',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_compreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_compre',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_compreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_compre',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_compreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_compre',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_compreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_compre',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_compreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_compre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_data_inicio',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_data_inicio',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_data_inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_data_inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_data_inicio',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_inicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_data_inicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_data_limite',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_data_limite',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_data_limiteBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_data_limite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_hora_final',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_hora_final',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_hora_final',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promocao_hora_final',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promocao_hora_final',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_hora_final',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_finalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promocao_hora_final',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_hora_inicial',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_hora_inicial',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_hora_inicial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promocao_hora_inicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promocao_hora_inicial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_hora_inicial',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_hora_inicialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promocao_hora_inicial',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_leveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_leve',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_leveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_leve',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_leveEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_leve',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_leveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_leve',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_leveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_leve',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_leveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_leve',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_precoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_preco',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_precoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_preco',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_precoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_precoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_precoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> promocao_precoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_preco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocao_tipo_desc',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocao_tipo_desc',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocao_tipo_desc',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocao_tipo_desc',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocao_tipo_desc',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      promocao_tipo_descBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocao_tipo_desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pvenda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> saldo_produtoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldo_produto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      saldo_produtoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldo_produto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> saldo_produtoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldo_produto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> saldo_produtoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldo_produto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unidade',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unidade',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unidade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'venda_kg',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'venda_kg',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venda_kg',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'venda_kg',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'venda_kg',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> venda_kgBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'venda_kg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension produtoQueryObject
    on QueryBuilder<produto, produto, QFilterCondition> {}

extension produtoQueryLinks
    on QueryBuilder<produto, produto, QFilterCondition> {}

extension produtoQuerySortBy on QueryBuilder<produto, produto, QSortBy> {
  QueryBuilder<produto, produto, QAfterSortBy> sortByAlt_preco_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByAlt_preco_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByAlt_preco_venda_tipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda_tipo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByAlt_preco_venda_tipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda_tipo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByBalanca_idproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_idproduto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByBalanca_idprodutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_idproduto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByBalanca_tipo_pesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_tipo_pesagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByBalanca_tipo_pesagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_tipo_pesagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByCompostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtin_grade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin_grade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtin_gradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin_grade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByNao_rec_desconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nao_rec_desconto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByNao_rec_descontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nao_rec_desconto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_apartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_apartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_apartir_perc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir_perc', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByPromocao_apartir_percDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir_perc', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_ativar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_ativar', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_ativarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_ativar', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_compre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_compre', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_compreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_compre', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_data_inicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_inicio', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByPromocao_data_inicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_inicio', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_data_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_limite', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByPromocao_data_limiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_limite', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_hora_final() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_final', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_hora_finalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_final', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_hora_inicial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_inicial', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      sortByPromocao_hora_inicialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_inicial', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_leve() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_leve', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_leveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_leve', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_preco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_preco', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_precoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_preco', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_tipo_desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_tipo_desc', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPromocao_tipo_descDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_tipo_desc', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortBySaldo_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldo_produto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortBySaldo_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldo_produto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByVenda_kg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venda_kg', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByVenda_kgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venda_kg', Sort.desc);
    });
  }
}

extension produtoQuerySortThenBy
    on QueryBuilder<produto, produto, QSortThenBy> {
  QueryBuilder<produto, produto, QAfterSortBy> thenByAlt_preco_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByAlt_preco_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByAlt_preco_venda_tipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda_tipo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByAlt_preco_venda_tipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt_preco_venda_tipo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByBalanca_idproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_idproduto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByBalanca_idprodutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_idproduto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByBalanca_tipo_pesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_tipo_pesagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByBalanca_tipo_pesagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca_tipo_pesagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByCompostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtin_grade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin_grade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtin_gradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin_grade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByNao_rec_desconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nao_rec_desconto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByNao_rec_descontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nao_rec_desconto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_apartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_apartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_apartir_perc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir_perc', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByPromocao_apartir_percDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_apartir_perc', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_ativar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_ativar', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_ativarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_ativar', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_compre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_compre', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_compreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_compre', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_data_inicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_inicio', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByPromocao_data_inicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_inicio', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_data_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_limite', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByPromocao_data_limiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_data_limite', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_hora_final() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_final', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_hora_finalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_final', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_hora_inicial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_inicial', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy>
      thenByPromocao_hora_inicialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_hora_inicial', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_leve() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_leve', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_leveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_leve', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_preco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_preco', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_precoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_preco', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_tipo_desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_tipo_desc', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPromocao_tipo_descDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocao_tipo_desc', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenBySaldo_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldo_produto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenBySaldo_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldo_produto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByVenda_kg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venda_kg', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByVenda_kgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venda_kg', Sort.desc);
    });
  }
}

extension produtoQueryWhereDistinct
    on QueryBuilder<produto, produto, QDistinct> {
  QueryBuilder<produto, produto, QDistinct> distinctByAlt_preco_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alt_preco_venda');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByAlt_preco_venda_tipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alt_preco_venda_tipo');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByBalanca_idproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanca_idproduto');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByBalanca_tipo_pesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanca_tipo_pesagem');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'composto');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByFile_imagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file_imagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByGtin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gtin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByGtin_grade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gtin_grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_grupo');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByNao_rec_desconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nao_rec_desconto');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_apartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_apartir');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_apartir_perc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_apartir_perc');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_ativar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_ativar');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_compre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_compre');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_data_inicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_data_inicio');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_data_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_data_limite');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_hora_final(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_hora_final',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_hora_inicial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_hora_inicial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_leve() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_leve');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_preco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_preco');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPromocao_tipo_desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocao_tipo_desc');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pvenda');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctBySaldo_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldo_produto');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByUnidade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unidade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByVenda_kg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'venda_kg');
    });
  }
}

extension produtoQueryProperty
    on QueryBuilder<produto, produto, QQueryProperty> {
  QueryBuilder<produto, int, QQueryOperations> id_produtoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_produto');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> alt_preco_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alt_preco_venda');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> alt_preco_venda_tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alt_preco_venda_tipo');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> balanca_idprodutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanca_idproduto');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> balanca_tipo_pesagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanca_tipo_pesagem');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> compostoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'composto');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> file_imagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file_imagem');
    });
  }

  QueryBuilder<produto, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> gtinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gtin');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> gtin_gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gtin_grade');
    });
  }

  QueryBuilder<produto, int, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> id_grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_grupo');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> nao_rec_descontoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nao_rec_desconto');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> promocao_apartirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_apartir');
    });
  }

  QueryBuilder<produto, double?, QQueryOperations>
      promocao_apartir_percProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_apartir_perc');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> promocao_ativarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_ativar');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> promocao_compreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_compre');
    });
  }

  QueryBuilder<produto, DateTime?, QQueryOperations>
      promocao_data_inicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_data_inicio');
    });
  }

  QueryBuilder<produto, DateTime?, QQueryOperations>
      promocao_data_limiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_data_limite');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations>
      promocao_hora_finalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_hora_final');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations>
      promocao_hora_inicialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_hora_inicial');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> promocao_leveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_leve');
    });
  }

  QueryBuilder<produto, double?, QQueryOperations> promocao_precoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_preco');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> promocao_tipo_descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocao_tipo_desc');
    });
  }

  QueryBuilder<produto, double, QQueryOperations> pvendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pvenda');
    });
  }

  QueryBuilder<produto, double, QQueryOperations> saldo_produtoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldo_produto');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> unidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unidade');
    });
  }

  QueryBuilder<produto, int?, QQueryOperations> venda_kgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'venda_kg');
    });
  }
}
