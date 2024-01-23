// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa_fechamento.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getcaixa_fechamentoCollection on Isar {
  IsarCollection<caixa_fechamento> get caixa_fechamentos => this.collection();
}

const Caixa_fechamentoSchema = CollectionSchema(
  name: r'caixa_fechamento',
  id: 5987581761351396478,
  properties: {
    r'id_caixa': PropertySchema(
      id: 0,
      name: r'id_caixa',
      type: IsarType.long,
    ),
    r'id_tipo_recebimento': PropertySchema(
      id: 1,
      name: r'id_tipo_recebimento',
      type: IsarType.long,
    ),
    r'valor_informado': PropertySchema(
      id: 2,
      name: r'valor_informado',
      type: IsarType.double,
    )
  },
  estimateSize: _caixa_fechamentoEstimateSize,
  serialize: _caixa_fechamentoSerialize,
  deserialize: _caixa_fechamentoDeserialize,
  deserializeProp: _caixa_fechamentoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _caixa_fechamentoGetId,
  getLinks: _caixa_fechamentoGetLinks,
  attach: _caixa_fechamentoAttach,
  version: '3.1.0+1',
);

int _caixa_fechamentoEstimateSize(
  caixa_fechamento object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _caixa_fechamentoSerialize(
  caixa_fechamento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_caixa);
  writer.writeLong(offsets[1], object.id_tipo_recebimento);
  writer.writeDouble(offsets[2], object.valor_informado);
}

caixa_fechamento _caixa_fechamentoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = caixa_fechamento();
  object.id = id;
  object.id_caixa = reader.readLong(offsets[0]);
  object.id_tipo_recebimento = reader.readLong(offsets[1]);
  object.valor_informado = reader.readDoubleOrNull(offsets[2]);
  return object;
}

P _caixa_fechamentoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixa_fechamentoGetId(caixa_fechamento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _caixa_fechamentoGetLinks(caixa_fechamento object) {
  return [];
}

void _caixa_fechamentoAttach(
    IsarCollection<dynamic> col, Id id, caixa_fechamento object) {
  object.id = id;
}

extension caixa_fechamentoQueryWhereSort
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QWhere> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension caixa_fechamentoQueryWhere
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QWhereClause> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhereClause>
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

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterWhereClause> idBetween(
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

extension caixa_fechamentoQueryFilter
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QFilterCondition> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
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

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
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

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
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

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_caixaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_caixaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_caixaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_caixaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_caixa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_tipo_recebimentoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_tipo_recebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_tipo_recebimentoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_tipo_recebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_tipo_recebimentoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_tipo_recebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      id_tipo_recebimentoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_tipo_recebimento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valor_informado',
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valor_informado',
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_informado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_informado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_informado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterFilterCondition>
      valor_informadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_informado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension caixa_fechamentoQueryObject
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QFilterCondition> {}

extension caixa_fechamentoQueryLinks
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QFilterCondition> {}

extension caixa_fechamentoQuerySortBy
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QSortBy> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortById_tipo_recebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.desc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortByValor_informado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_informado', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      sortByValor_informadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_informado', Sort.desc);
    });
  }
}

extension caixa_fechamentoQuerySortThenBy
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QSortThenBy> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenById_tipo_recebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.desc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenByValor_informado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_informado', Sort.asc);
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QAfterSortBy>
      thenByValor_informadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_informado', Sort.desc);
    });
  }
}

extension caixa_fechamentoQueryWhereDistinct
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QDistinct> {
  QueryBuilder<caixa_fechamento, caixa_fechamento, QDistinct>
      distinctById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa');
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QDistinct>
      distinctById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_tipo_recebimento');
    });
  }

  QueryBuilder<caixa_fechamento, caixa_fechamento, QDistinct>
      distinctByValor_informado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_informado');
    });
  }
}

extension caixa_fechamentoQueryProperty
    on QueryBuilder<caixa_fechamento, caixa_fechamento, QQueryProperty> {
  QueryBuilder<caixa_fechamento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<caixa_fechamento, int, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<caixa_fechamento, int, QQueryOperations>
      id_tipo_recebimentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_tipo_recebimento');
    });
  }

  QueryBuilder<caixa_fechamento, double?, QQueryOperations>
      valor_informadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_informado');
    });
  }
}
