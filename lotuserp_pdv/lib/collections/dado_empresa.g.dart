// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'dado_empresa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getdado_empresaCollection on Isar {
  IsarCollection<dado_empresa> get dado_empresas => this.collection();
}

const Dado_empresaSchema = CollectionSchema(
  name: r'dado_empresa',
  id: 8509089205883310449,
  properties: {
    r'balanca': PropertySchema(
      id: 0,
      name: r'balanca',
      type: IsarType.string,
    ),
    r'id_empresa': PropertySchema(
      id: 1,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_nfce': PropertySchema(
      id: 2,
      name: r'id_nfce',
      type: IsarType.long,
    ),
    r'intervalo_envio': PropertySchema(
      id: 3,
      name: r'intervalo_envio',
      type: IsarType.long,
    ),
    r'ip_empresa': PropertySchema(
      id: 4,
      name: r'ip_empresa',
      type: IsarType.string,
    ),
    r'num_caixa': PropertySchema(
      id: 5,
      name: r'num_caixa',
      type: IsarType.long,
    ),
    r'status_balanca': PropertySchema(
      id: 6,
      name: r'status_balanca',
      type: IsarType.long,
    ),
    r'status_tef': PropertySchema(
      id: 7,
      name: r'status_tef',
      type: IsarType.long,
    ),
    r'tef': PropertySchema(
      id: 8,
      name: r'tef',
      type: IsarType.string,
    )
  },
  estimateSize: _dado_empresaEstimateSize,
  serialize: _dado_empresaSerialize,
  deserialize: _dado_empresaDeserialize,
  deserializeProp: _dado_empresaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dado_empresaGetId,
  getLinks: _dado_empresaGetLinks,
  attach: _dado_empresaAttach,
  version: '3.1.0+1',
);

int _dado_empresaEstimateSize(
  dado_empresa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.balanca;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ip_empresa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tef;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dado_empresaSerialize(
  dado_empresa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.balanca);
  writer.writeLong(offsets[1], object.id_empresa);
  writer.writeLong(offsets[2], object.id_nfce);
  writer.writeLong(offsets[3], object.intervalo_envio);
  writer.writeString(offsets[4], object.ip_empresa);
  writer.writeLong(offsets[5], object.num_caixa);
  writer.writeLong(offsets[6], object.status_balanca);
  writer.writeLong(offsets[7], object.status_tef);
  writer.writeString(offsets[8], object.tef);
}

dado_empresa _dado_empresaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = dado_empresa();
  object.balanca = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.id_empresa = reader.readLongOrNull(offsets[1]);
  object.id_nfce = reader.readLongOrNull(offsets[2]);
  object.intervalo_envio = reader.readLongOrNull(offsets[3]);
  object.ip_empresa = reader.readStringOrNull(offsets[4]);
  object.num_caixa = reader.readLongOrNull(offsets[5]);
  object.status_balanca = reader.readLongOrNull(offsets[6]);
  object.status_tef = reader.readLongOrNull(offsets[7]);
  object.tef = reader.readStringOrNull(offsets[8]);
  return object;
}

P _dado_empresaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dado_empresaGetId(dado_empresa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dado_empresaGetLinks(dado_empresa object) {
  return [];
}

void _dado_empresaAttach(
    IsarCollection<dynamic> col, Id id, dado_empresa object) {
  object.id = id;
}

extension dado_empresaQueryWhereSort
    on QueryBuilder<dado_empresa, dado_empresa, QWhere> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension dado_empresaQueryWhere
    on QueryBuilder<dado_empresa, dado_empresa, QWhereClause> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idBetween(
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

extension dado_empresaQueryFilter
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanca',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanca',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'balanca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'balanca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanca',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      balancaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'balanca',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaGreaterThan(
    int? value, {
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaLessThan(
    int? value, {
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_nfce',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_nfce',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_nfce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intervalo_envio',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intervalo_envio',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intervalo_envio',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intervalo_envio',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intervalo_envio',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      intervalo_envioBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intervalo_envio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ip_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ip_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ip_empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ip_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ip_empresa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      ip_empresaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ip_empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'num_caixa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'num_caixa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num_caixa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status_balanca',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status_balanca',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status_balanca',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status_balanca',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status_balanca',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_balancaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status_balanca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status_tef',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status_tef',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status_tef',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status_tef',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status_tef',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      status_tefBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status_tef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tef',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tef',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tefGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tef',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> tefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tef',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tef',
        value: '',
      ));
    });
  }
}

extension dado_empresaQueryObject
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {}

extension dado_empresaQueryLinks
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {}

extension dado_empresaQuerySortBy
    on QueryBuilder<dado_empresa, dado_empresa, QSortBy> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByBalanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByBalancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByIntervalo_envio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalo_envio', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByIntervalo_envioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalo_envio', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByIp_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByIp_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByNum_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByStatus_balanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_balanca', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByStatus_balancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_balanca', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByStatus_tef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_tef', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByStatus_tefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_tef', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByTef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByTefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.desc);
    });
  }
}

extension dado_empresaQuerySortThenBy
    on QueryBuilder<dado_empresa, dado_empresa, QSortThenBy> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByBalanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByBalancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanca', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByIntervalo_envio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalo_envio', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByIntervalo_envioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalo_envio', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByIp_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByIp_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByNum_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByStatus_balanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_balanca', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByStatus_balancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_balanca', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByStatus_tef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_tef', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByStatus_tefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status_tef', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByTef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByTefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.desc);
    });
  }
}

extension dado_empresaQueryWhereDistinct
    on QueryBuilder<dado_empresa, dado_empresa, QDistinct> {
  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByBalanca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_nfce');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct>
      distinctByIntervalo_envio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervalo_envio');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByIp_empresa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ip_empresa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num_caixa');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct>
      distinctByStatus_balanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status_balanca');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByStatus_tef() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status_tef');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByTef(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tef', caseSensitive: caseSensitive);
    });
  }
}

extension dado_empresaQueryProperty
    on QueryBuilder<dado_empresa, dado_empresa, QQueryProperty> {
  QueryBuilder<dado_empresa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<dado_empresa, String?, QQueryOperations> balancaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanca');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> id_nfceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_nfce');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> intervalo_envioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervalo_envio');
    });
  }

  QueryBuilder<dado_empresa, String?, QQueryOperations> ip_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ip_empresa');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> num_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num_caixa');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> status_balancaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status_balanca');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> status_tefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status_tef');
    });
  }

  QueryBuilder<dado_empresa, String?, QQueryOperations> tefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tef');
    });
  }
}
