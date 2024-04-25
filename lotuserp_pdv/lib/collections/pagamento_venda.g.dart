// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_venda.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getpagamento_vendaCollection on Isar {
  IsarCollection<pagamento_venda> get pagamento_vendas => this.collection();
}

const Pagamento_vendaSchema = CollectionSchema(
  name: r'pagamento_venda',
  id: -908844742746015087,
  properties: {
    r'id_caixa_servidor': PropertySchema(
      id: 0,
      name: r'id_caixa_servidor',
      type: IsarType.long,
    ),
    r'id_forma_pagamento': PropertySchema(
      id: 1,
      name: r'id_forma_pagamento',
      type: IsarType.long,
    ),
    r'id_venda': PropertySchema(
      id: 2,
      name: r'id_venda',
      type: IsarType.long,
    ),
    r'valor_creditado': PropertySchema(
      id: 3,
      name: r'valor_creditado',
      type: IsarType.double,
    )
  },
  estimateSize: _pagamento_vendaEstimateSize,
  serialize: _pagamento_vendaSerialize,
  deserialize: _pagamento_vendaDeserialize,
  deserializeProp: _pagamento_vendaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pagamento_vendaGetId,
  getLinks: _pagamento_vendaGetLinks,
  attach: _pagamento_vendaAttach,
  version: '3.1.0+1',
);

int _pagamento_vendaEstimateSize(
  pagamento_venda object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pagamento_vendaSerialize(
  pagamento_venda object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_caixa_servidor);
  writer.writeLong(offsets[1], object.id_forma_pagamento);
  writer.writeLong(offsets[2], object.id_venda);
  writer.writeDouble(offsets[3], object.valor_creditado);
}

pagamento_venda _pagamento_vendaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = pagamento_venda(
    id_caixa_servidor: reader.readLongOrNull(offsets[0]),
    id_forma_pagamento: reader.readLongOrNull(offsets[1]),
    id_venda: reader.readLongOrNull(offsets[2]),
    valor_creditado: reader.readDoubleOrNull(offsets[3]),
  );
  object.id = id;
  return object;
}

P _pagamento_vendaDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pagamento_vendaGetId(pagamento_venda object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pagamento_vendaGetLinks(pagamento_venda object) {
  return [];
}

void _pagamento_vendaAttach(
    IsarCollection<dynamic> col, Id id, pagamento_venda object) {
  object.id = id;
}

extension pagamento_vendaQueryWhereSort
    on QueryBuilder<pagamento_venda, pagamento_venda, QWhere> {
  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension pagamento_vendaQueryWhere
    on QueryBuilder<pagamento_venda, pagamento_venda, QWhereClause> {
  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension pagamento_vendaQueryFilter
    on QueryBuilder<pagamento_venda, pagamento_venda, QFilterCondition> {
  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_caixa_servidor',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_caixa_servidor',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_caixa_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_caixa_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_caixa_servidorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_caixa_servidor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_forma_pagamento',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_forma_pagamento',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_forma_pagamento',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_forma_pagamento',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_forma_pagamento',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_forma_pagamentoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_forma_pagamento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_venda',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_venda',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      id_vendaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_venda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valor_creditado',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valor_creditado',
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_creditado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_creditado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_creditado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterFilterCondition>
      valor_creditadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_creditado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension pagamento_vendaQueryObject
    on QueryBuilder<pagamento_venda, pagamento_venda, QFilterCondition> {}

extension pagamento_vendaQueryLinks
    on QueryBuilder<pagamento_venda, pagamento_venda, QFilterCondition> {}

extension pagamento_vendaQuerySortBy
    on QueryBuilder<pagamento_venda, pagamento_venda, QSortBy> {
  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_caixa_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_forma_pagamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_forma_pagamento', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_forma_pagamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_forma_pagamento', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortByValor_creditado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_creditado', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      sortByValor_creditadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_creditado', Sort.desc);
    });
  }
}

extension pagamento_vendaQuerySortThenBy
    on QueryBuilder<pagamento_venda, pagamento_venda, QSortThenBy> {
  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_caixa_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_forma_pagamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_forma_pagamento', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_forma_pagamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_forma_pagamento', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenByValor_creditado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_creditado', Sort.asc);
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QAfterSortBy>
      thenByValor_creditadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_creditado', Sort.desc);
    });
  }
}

extension pagamento_vendaQueryWhereDistinct
    on QueryBuilder<pagamento_venda, pagamento_venda, QDistinct> {
  QueryBuilder<pagamento_venda, pagamento_venda, QDistinct>
      distinctById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa_servidor');
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QDistinct>
      distinctById_forma_pagamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_forma_pagamento');
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QDistinct>
      distinctById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda');
    });
  }

  QueryBuilder<pagamento_venda, pagamento_venda, QDistinct>
      distinctByValor_creditado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_creditado');
    });
  }
}

extension pagamento_vendaQueryProperty
    on QueryBuilder<pagamento_venda, pagamento_venda, QQueryProperty> {
  QueryBuilder<pagamento_venda, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<pagamento_venda, int?, QQueryOperations>
      id_caixa_servidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa_servidor');
    });
  }

  QueryBuilder<pagamento_venda, int?, QQueryOperations>
      id_forma_pagamentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_forma_pagamento');
    });
  }

  QueryBuilder<pagamento_venda, int?, QQueryOperations> id_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda');
    });
  }

  QueryBuilder<pagamento_venda, double?, QQueryOperations>
      valor_creditadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_creditado');
    });
  }
}
