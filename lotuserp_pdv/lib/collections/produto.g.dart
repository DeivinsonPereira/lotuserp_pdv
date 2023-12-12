// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProdutoCollection on Isar {
  IsarCollection<Produto> get produtos => this.collection();
}

const ProdutoSchema = CollectionSchema(
  name: r'Produto',
  id: -1962595252623852481,
  properties: {
    r'altPrecoVenda': PropertySchema(
      id: 0,
      name: r'altPrecoVenda',
      type: IsarType.long,
    ),
    r'altPrecoVendaTipo': PropertySchema(
      id: 1,
      name: r'altPrecoVendaTipo',
      type: IsarType.long,
    ),
    r'balancaIdproduto': PropertySchema(
      id: 2,
      name: r'balancaIdproduto',
      type: IsarType.long,
    ),
    r'balancaTipoPesagem': PropertySchema(
      id: 3,
      name: r'balancaTipoPesagem',
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
    r'fileImagem': PropertySchema(
      id: 6,
      name: r'fileImagem',
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
    r'gtinGrade': PropertySchema(
      id: 9,
      name: r'gtinGrade',
      type: IsarType.string,
    ),
    r'idEmpresa': PropertySchema(
      id: 10,
      name: r'idEmpresa',
      type: IsarType.long,
    ),
    r'idGrupo': PropertySchema(
      id: 11,
      name: r'idGrupo',
      type: IsarType.long,
    ),
    r'idProduto': PropertySchema(
      id: 12,
      name: r'idProduto',
      type: IsarType.long,
    ),
    r'naoRecDesconto': PropertySchema(
      id: 13,
      name: r'naoRecDesconto',
      type: IsarType.long,
    ),
    r'promocaoApartir': PropertySchema(
      id: 14,
      name: r'promocaoApartir',
      type: IsarType.long,
    ),
    r'promocaoApartirPerc': PropertySchema(
      id: 15,
      name: r'promocaoApartirPerc',
      type: IsarType.double,
    ),
    r'promocaoAtivar': PropertySchema(
      id: 16,
      name: r'promocaoAtivar',
      type: IsarType.long,
    ),
    r'promocaoCompre': PropertySchema(
      id: 17,
      name: r'promocaoCompre',
      type: IsarType.long,
    ),
    r'promocaoDataInicio': PropertySchema(
      id: 18,
      name: r'promocaoDataInicio',
      type: IsarType.dateTime,
    ),
    r'promocaoDataLimite': PropertySchema(
      id: 19,
      name: r'promocaoDataLimite',
      type: IsarType.dateTime,
    ),
    r'promocaoHoraFinal': PropertySchema(
      id: 20,
      name: r'promocaoHoraFinal',
      type: IsarType.string,
    ),
    r'promocaoHoraInicial': PropertySchema(
      id: 21,
      name: r'promocaoHoraInicial',
      type: IsarType.string,
    ),
    r'promocaoLeve': PropertySchema(
      id: 22,
      name: r'promocaoLeve',
      type: IsarType.long,
    ),
    r'promocaoPreco': PropertySchema(
      id: 23,
      name: r'promocaoPreco',
      type: IsarType.double,
    ),
    r'promocaoTipoDesc': PropertySchema(
      id: 24,
      name: r'promocaoTipoDesc',
      type: IsarType.long,
    ),
    r'pvenda': PropertySchema(
      id: 25,
      name: r'pvenda',
      type: IsarType.double,
    ),
    r'saldoProduto': PropertySchema(
      id: 26,
      name: r'saldoProduto',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 27,
      name: r'status',
      type: IsarType.long,
    ),
    r'unidade': PropertySchema(
      id: 28,
      name: r'unidade',
      type: IsarType.string,
    ),
    r'vendaKg': PropertySchema(
      id: 29,
      name: r'vendaKg',
      type: IsarType.long,
    )
  },
  estimateSize: _produtoEstimateSize,
  serialize: _produtoSerialize,
  deserialize: _produtoDeserialize,
  deserializeProp: _produtoDeserializeProp,
  idName: r'idAUtoincrement',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _produtoGetId,
  getLinks: _produtoGetLinks,
  attach: _produtoAttach,
  version: '3.1.0+1',
);

int _produtoEstimateSize(
  Produto object,
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
    final value = object.fileImagem;
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
    final value = object.gtinGrade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promocaoHoraFinal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promocaoHoraInicial;
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
  Produto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.altPrecoVenda);
  writer.writeLong(offsets[1], object.altPrecoVendaTipo);
  writer.writeLong(offsets[2], object.balancaIdproduto);
  writer.writeLong(offsets[3], object.balancaTipoPesagem);
  writer.writeLong(offsets[4], object.composto);
  writer.writeString(offsets[5], object.descricao);
  writer.writeString(offsets[6], object.fileImagem);
  writer.writeString(offsets[7], object.grade);
  writer.writeString(offsets[8], object.gtin);
  writer.writeString(offsets[9], object.gtinGrade);
  writer.writeLong(offsets[10], object.idEmpresa);
  writer.writeLong(offsets[11], object.idGrupo);
  writer.writeLong(offsets[12], object.idProduto);
  writer.writeLong(offsets[13], object.naoRecDesconto);
  writer.writeLong(offsets[14], object.promocaoApartir);
  writer.writeDouble(offsets[15], object.promocaoApartirPerc);
  writer.writeLong(offsets[16], object.promocaoAtivar);
  writer.writeLong(offsets[17], object.promocaoCompre);
  writer.writeDateTime(offsets[18], object.promocaoDataInicio);
  writer.writeDateTime(offsets[19], object.promocaoDataLimite);
  writer.writeString(offsets[20], object.promocaoHoraFinal);
  writer.writeString(offsets[21], object.promocaoHoraInicial);
  writer.writeLong(offsets[22], object.promocaoLeve);
  writer.writeDouble(offsets[23], object.promocaoPreco);
  writer.writeLong(offsets[24], object.promocaoTipoDesc);
  writer.writeDouble(offsets[25], object.pvenda);
  writer.writeDouble(offsets[26], object.saldoProduto);
  writer.writeLong(offsets[27], object.status);
  writer.writeString(offsets[28], object.unidade);
  writer.writeLong(offsets[29], object.vendaKg);
}

Produto _produtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Produto(
    reader.readLong(offsets[10]),
    reader.readLong(offsets[12]),
    reader.readString(offsets[7]),
    reader.readLongOrNull(offsets[11]),
    reader.readStringOrNull(offsets[5]),
    reader.readStringOrNull(offsets[28]),
    reader.readStringOrNull(offsets[8]),
    reader.readLongOrNull(offsets[4]),
    reader.readLongOrNull(offsets[29]),
    reader.readLongOrNull(offsets[13]),
    reader.readLongOrNull(offsets[27]),
    reader.readDouble(offsets[26]),
    reader.readDouble(offsets[25]),
    reader.readLongOrNull(offsets[0]),
    reader.readLongOrNull(offsets[1]),
    reader.readLongOrNull(offsets[3]),
    reader.readLongOrNull(offsets[2]),
    reader.readStringOrNull(offsets[9]),
    reader.readLongOrNull(offsets[16]),
    reader.readDoubleOrNull(offsets[23]),
    reader.readDateTimeOrNull(offsets[18]),
    reader.readDateTimeOrNull(offsets[19]),
    reader.readStringOrNull(offsets[21]),
    reader.readStringOrNull(offsets[20]),
    reader.readLongOrNull(offsets[24]),
    reader.readLongOrNull(offsets[17]),
    reader.readLongOrNull(offsets[22]),
    reader.readLongOrNull(offsets[14]),
    reader.readDoubleOrNull(offsets[15]),
    reader.readStringOrNull(offsets[6]),
  );
  object.idAUtoincrement = id;
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
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _produtoGetId(Produto object) {
  return object.idAUtoincrement;
}

List<IsarLinkBase<dynamic>> _produtoGetLinks(Produto object) {
  return [];
}

void _produtoAttach(IsarCollection<dynamic> col, Id id, Produto object) {
  object.idAUtoincrement = id;
}

extension ProdutoQueryWhereSort on QueryBuilder<Produto, Produto, QWhere> {
  QueryBuilder<Produto, Produto, QAfterWhere> anyIdAUtoincrement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProdutoQueryWhere on QueryBuilder<Produto, Produto, QWhereClause> {
  QueryBuilder<Produto, Produto, QAfterWhereClause> idAUtoincrementEqualTo(
      Id idAUtoincrement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idAUtoincrement,
        upper: idAUtoincrement,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> idAUtoincrementNotEqualTo(
      Id idAUtoincrement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: idAUtoincrement, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: idAUtoincrement, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: idAUtoincrement, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: idAUtoincrement, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> idAUtoincrementGreaterThan(
      Id idAUtoincrement,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(
            lower: idAUtoincrement, includeLower: include),
      );
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> idAUtoincrementLessThan(
      Id idAUtoincrement,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idAUtoincrement, includeUpper: include),
      );
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> idAUtoincrementBetween(
    Id lowerIdAUtoincrement,
    Id upperIdAUtoincrement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdAUtoincrement,
        includeLower: includeLower,
        upper: upperIdAUtoincrement,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProdutoQueryFilter
    on QueryBuilder<Produto, Produto, QFilterCondition> {
  QueryBuilder<Produto, Produto, QAfterFilterCondition> altPrecoVendaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'altPrecoVenda',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'altPrecoVenda',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> altPrecoVendaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altPrecoVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'altPrecoVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> altPrecoVendaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'altPrecoVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> altPrecoVendaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'altPrecoVenda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'altPrecoVendaTipo',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'altPrecoVendaTipo',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altPrecoVendaTipo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'altPrecoVendaTipo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'altPrecoVendaTipo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      altPrecoVendaTipoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'altPrecoVendaTipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaIdprodutoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balancaIdproduto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaIdprodutoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balancaIdproduto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> balancaIdprodutoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balancaIdproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaIdprodutoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balancaIdproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaIdprodutoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balancaIdproduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> balancaIdprodutoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balancaIdproduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balancaTipoPesagem',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balancaTipoPesagem',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balancaTipoPesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balancaTipoPesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balancaTipoPesagem',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      balancaTipoPesagemBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balancaTipoPesagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'composto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'composto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'composto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> compostoBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoEqualTo(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoStartsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoEndsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoContains(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoMatches(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileImagem',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileImagem',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileImagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileImagem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileImagem',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> fileImagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileImagem',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeEqualTo(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeStartsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeEndsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeContains(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeMatches(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gtin',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gtin',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinEqualTo(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinStartsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinEndsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinContains(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinMatches(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gtinGrade',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gtinGrade',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gtinGrade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gtinGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gtinGrade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtinGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> gtinGradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gtinGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idAUtoincrementEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAUtoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      idAUtoincrementGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAUtoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idAUtoincrementLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAUtoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idAUtoincrementBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAUtoincrement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idEmpresaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idEmpresa',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idEmpresaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idEmpresa',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idEmpresaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idEmpresa',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idEmpresaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idEmpresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idGrupo',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idGrupo',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idGrupoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idGrupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idProdutoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idProdutoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idProdutoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> idProdutoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idProduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> naoRecDescontoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'naoRecDesconto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      naoRecDescontoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'naoRecDesconto',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> naoRecDescontoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'naoRecDesconto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      naoRecDescontoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'naoRecDesconto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> naoRecDescontoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'naoRecDesconto',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> naoRecDescontoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'naoRecDesconto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoApartir',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoApartir',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoApartirEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoApartir',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoApartir',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoApartirLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoApartir',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoApartirBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoApartir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoApartirPerc',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoApartirPerc',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoApartirPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoApartirPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoApartirPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoApartirPercBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoApartirPerc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoAtivarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoAtivar',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoAtivarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoAtivar',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoAtivarEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoAtivar',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoAtivarGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoAtivar',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoAtivarLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoAtivar',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoAtivarBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoAtivar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoCompreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoCompre',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoCompreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoCompre',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoCompreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoCompre',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoCompreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoCompre',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoCompreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoCompre',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoCompreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoCompre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoDataInicio',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoDataInicio',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoDataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoDataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoDataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataInicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoDataInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoDataLimite',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoDataLimite',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoDataLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoDataLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoDataLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoDataLimiteBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoDataLimite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoHoraFinal',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoHoraFinal',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoHoraFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promocaoHoraFinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promocaoHoraFinal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoHoraFinal',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraFinalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promocaoHoraFinal',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoHoraInicial',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoHoraInicial',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoHoraInicial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promocaoHoraInicial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promocaoHoraInicial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoHoraInicial',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoHoraInicialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promocaoHoraInicial',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoLeveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoLeve',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoLeveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoLeve',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoLeveEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoLeve',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoLeveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoLeve',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoLeveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoLeve',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoLeveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoLeve',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoPrecoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoPreco',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoPrecoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoPreco',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoPrecoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoPreco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoPrecoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoPreco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoPrecoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoPreco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoPrecoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoPreco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoTipoDescIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promocaoTipoDesc',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoTipoDescIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promocaoTipoDesc',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoTipoDescEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promocaoTipoDesc',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoTipoDescGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promocaoTipoDesc',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      promocaoTipoDescLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promocaoTipoDesc',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> promocaoTipoDescBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promocaoTipoDesc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> pvendaEqualTo(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> pvendaGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> pvendaLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> pvendaBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> saldoProdutoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoProduto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> saldoProdutoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoProduto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> saldoProdutoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoProduto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> saldoProdutoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoProduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unidade',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unidade',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeEqualTo(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeGreaterThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeLessThan(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeBetween(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeStartsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeEndsWith(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeContains(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeMatches(
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

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendaKg',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendaKg',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendaKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendaKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendaKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> vendaKgBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendaKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProdutoQueryObject
    on QueryBuilder<Produto, Produto, QFilterCondition> {}

extension ProdutoQueryLinks
    on QueryBuilder<Produto, Produto, QFilterCondition> {}

extension ProdutoQuerySortBy on QueryBuilder<Produto, Produto, QSortBy> {
  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAltPrecoVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVenda', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAltPrecoVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVenda', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAltPrecoVendaTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVendaTipo', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAltPrecoVendaTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVendaTipo', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByBalancaIdproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaIdproduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByBalancaIdprodutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaIdproduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByBalancaTipoPesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaTipoPesagem', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByBalancaTipoPesagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaTipoPesagem', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByCompostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByFileImagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByFileImagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGtinGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtinGrade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByGtinGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtinGrade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByNaoRecDesconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naoRecDesconto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByNaoRecDescontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naoRecDesconto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoApartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartir', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoApartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartir', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoApartirPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartirPerc', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoApartirPercDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartirPerc', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoAtivar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoAtivar', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoAtivarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoAtivar', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoCompre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoCompre', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoCompreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoCompre', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataInicio', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataInicio', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoDataLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataLimite', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoDataLimiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataLimite', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoHoraFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraFinal', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoHoraFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraFinal', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoHoraInicial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraInicial', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoHoraInicialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraInicial', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoLeve() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoLeve', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoLeveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoLeve', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoPreco', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoPrecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoPreco', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoTipoDesc', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPromocaoTipoDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoTipoDesc', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortBySaldoProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortBySaldoProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByVendaKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaKg', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByVendaKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaKg', Sort.desc);
    });
  }
}

extension ProdutoQuerySortThenBy
    on QueryBuilder<Produto, Produto, QSortThenBy> {
  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAltPrecoVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVenda', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAltPrecoVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVenda', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAltPrecoVendaTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVendaTipo', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAltPrecoVendaTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPrecoVendaTipo', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByBalancaIdproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaIdproduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByBalancaIdprodutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaIdproduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByBalancaTipoPesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaTipoPesagem', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByBalancaTipoPesagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancaTipoPesagem', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByCompostoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'composto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByFileImagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByFileImagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGtinGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtinGrade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByGtinGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtinGrade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdAUtoincrement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAUtoincrement', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdAUtoincrementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAUtoincrement', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByNaoRecDesconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naoRecDesconto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByNaoRecDescontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naoRecDesconto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoApartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartir', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoApartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartir', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoApartirPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartirPerc', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoApartirPercDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoApartirPerc', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoAtivar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoAtivar', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoAtivarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoAtivar', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoCompre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoCompre', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoCompreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoCompre', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataInicio', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataInicio', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoDataLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataLimite', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoDataLimiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoDataLimite', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoHoraFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraFinal', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoHoraFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraFinal', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoHoraInicial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraInicial', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoHoraInicialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoHoraInicial', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoLeve() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoLeve', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoLeveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoLeve', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoPreco', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoPrecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoPreco', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoTipoDesc', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPromocaoTipoDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promocaoTipoDesc', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenBySaldoProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenBySaldoProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByVendaKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaKg', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByVendaKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaKg', Sort.desc);
    });
  }
}

extension ProdutoQueryWhereDistinct
    on QueryBuilder<Produto, Produto, QDistinct> {
  QueryBuilder<Produto, Produto, QDistinct> distinctByAltPrecoVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altPrecoVenda');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByAltPrecoVendaTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altPrecoVendaTipo');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByBalancaIdproduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balancaIdproduto');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByBalancaTipoPesagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balancaTipoPesagem');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByComposto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'composto');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByFileImagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileImagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByGtin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gtin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByGtinGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gtinGrade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idEmpresa');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGrupo');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idProduto');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByNaoRecDesconto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'naoRecDesconto');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoApartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoApartir');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoApartirPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoApartirPerc');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoAtivar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoAtivar');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoCompre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoCompre');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoDataInicio');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoDataLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoDataLimite');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoHoraFinal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoHoraFinal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoHoraInicial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoHoraInicial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoLeve() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoLeve');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoPreco');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPromocaoTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promocaoTipoDesc');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pvenda');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctBySaldoProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoProduto');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByUnidade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unidade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByVendaKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendaKg');
    });
  }
}

extension ProdutoQueryProperty
    on QueryBuilder<Produto, Produto, QQueryProperty> {
  QueryBuilder<Produto, int, QQueryOperations> idAUtoincrementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAUtoincrement');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> altPrecoVendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altPrecoVenda');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> altPrecoVendaTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altPrecoVendaTipo');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> balancaIdprodutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balancaIdproduto');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> balancaTipoPesagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balancaTipoPesagem');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> compostoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'composto');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> fileImagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileImagem');
    });
  }

  QueryBuilder<Produto, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> gtinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gtin');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> gtinGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gtinGrade');
    });
  }

  QueryBuilder<Produto, int, QQueryOperations> idEmpresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idEmpresa');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> idGrupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGrupo');
    });
  }

  QueryBuilder<Produto, int, QQueryOperations> idProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idProduto');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> naoRecDescontoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naoRecDesconto');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> promocaoApartirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoApartir');
    });
  }

  QueryBuilder<Produto, double?, QQueryOperations>
      promocaoApartirPercProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoApartirPerc');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> promocaoAtivarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoAtivar');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> promocaoCompreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoCompre');
    });
  }

  QueryBuilder<Produto, DateTime?, QQueryOperations>
      promocaoDataInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoDataInicio');
    });
  }

  QueryBuilder<Produto, DateTime?, QQueryOperations>
      promocaoDataLimiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoDataLimite');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> promocaoHoraFinalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoHoraFinal');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations>
      promocaoHoraInicialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoHoraInicial');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> promocaoLeveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoLeve');
    });
  }

  QueryBuilder<Produto, double?, QQueryOperations> promocaoPrecoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoPreco');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> promocaoTipoDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promocaoTipoDesc');
    });
  }

  QueryBuilder<Produto, double, QQueryOperations> pvendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pvenda');
    });
  }

  QueryBuilder<Produto, double, QQueryOperations> saldoProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoProduto');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Produto, String?, QQueryOperations> unidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unidade');
    });
  }

  QueryBuilder<Produto, int?, QQueryOperations> vendaKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendaKg');
    });
  }
}
