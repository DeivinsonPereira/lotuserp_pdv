// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_valida.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getempresa_validaCollection on Isar {
  IsarCollection<empresa_valida> get empresa_validas => this.collection();
}

const Empresa_validaSchema = CollectionSchema(
  name: r'empresa_valida',
  id: 3239250073434447488,
  properties: {
    r'data_limite': PropertySchema(
      id: 0,
      name: r'data_limite',
      type: IsarType.dateTime,
    ),
    r'nocontrato': PropertySchema(
      id: 1,
      name: r'nocontrato',
      type: IsarType.string,
    )
  },
  estimateSize: _empresa_validaEstimateSize,
  serialize: _empresa_validaSerialize,
  deserialize: _empresa_validaDeserialize,
  deserializeProp: _empresa_validaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _empresa_validaGetId,
  getLinks: _empresa_validaGetLinks,
  attach: _empresa_validaAttach,
  version: '3.1.0+1',
);

int _empresa_validaEstimateSize(
  empresa_valida object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nocontrato.length * 3;
  return bytesCount;
}

void _empresa_validaSerialize(
  empresa_valida object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.data_limite);
  writer.writeString(offsets[1], object.nocontrato);
}

empresa_valida _empresa_validaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = empresa_valida();
  object.data_limite = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.nocontrato = reader.readString(offsets[1]);
  return object;
}

P _empresa_validaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _empresa_validaGetId(empresa_valida object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _empresa_validaGetLinks(empresa_valida object) {
  return [];
}

void _empresa_validaAttach(
    IsarCollection<dynamic> col, Id id, empresa_valida object) {
  object.id = id;
}

extension empresa_validaQueryWhereSort
    on QueryBuilder<empresa_valida, empresa_valida, QWhere> {
  QueryBuilder<empresa_valida, empresa_valida, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension empresa_validaQueryWhere
    on QueryBuilder<empresa_valida, empresa_valida, QWhereClause> {
  QueryBuilder<empresa_valida, empresa_valida, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<empresa_valida, empresa_valida, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterWhereClause> idBetween(
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

extension empresa_validaQueryFilter
    on QueryBuilder<empresa_valida, empresa_valida, QFilterCondition> {
  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data_limite',
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data_limite',
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data_limite',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      data_limiteBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data_limite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
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

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
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

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition> idBetween(
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

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nocontrato',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nocontrato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nocontrato',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nocontrato',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterFilterCondition>
      nocontratoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nocontrato',
        value: '',
      ));
    });
  }
}

extension empresa_validaQueryObject
    on QueryBuilder<empresa_valida, empresa_valida, QFilterCondition> {}

extension empresa_validaQueryLinks
    on QueryBuilder<empresa_valida, empresa_valida, QFilterCondition> {}

extension empresa_validaQuerySortBy
    on QueryBuilder<empresa_valida, empresa_valida, QSortBy> {
  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      sortByData_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_limite', Sort.asc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      sortByData_limiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_limite', Sort.desc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      sortByNocontrato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nocontrato', Sort.asc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      sortByNocontratoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nocontrato', Sort.desc);
    });
  }
}

extension empresa_validaQuerySortThenBy
    on QueryBuilder<empresa_valida, empresa_valida, QSortThenBy> {
  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      thenByData_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_limite', Sort.asc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      thenByData_limiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_limite', Sort.desc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      thenByNocontrato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nocontrato', Sort.asc);
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QAfterSortBy>
      thenByNocontratoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nocontrato', Sort.desc);
    });
  }
}

extension empresa_validaQueryWhereDistinct
    on QueryBuilder<empresa_valida, empresa_valida, QDistinct> {
  QueryBuilder<empresa_valida, empresa_valida, QDistinct>
      distinctByData_limite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data_limite');
    });
  }

  QueryBuilder<empresa_valida, empresa_valida, QDistinct> distinctByNocontrato(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nocontrato', caseSensitive: caseSensitive);
    });
  }
}

extension empresa_validaQueryProperty
    on QueryBuilder<empresa_valida, empresa_valida, QQueryProperty> {
  QueryBuilder<empresa_valida, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<empresa_valida, DateTime?, QQueryOperations>
      data_limiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data_limite');
    });
  }

  QueryBuilder<empresa_valida, String, QQueryOperations> nocontratoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nocontrato');
    });
  }
}
