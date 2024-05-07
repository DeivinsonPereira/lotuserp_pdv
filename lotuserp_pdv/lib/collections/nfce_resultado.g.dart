// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfce_resultado.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getnfce_resultadoCollection on Isar {
  IsarCollection<nfce_resultado> get nfce_resultados => this.collection();
}

const Nfce_resultadoSchema = CollectionSchema(
  name: r'nfce_resultado',
  id: -3757020370277554225,
  properties: {
    r'id_caixa': PropertySchema(
      id: 0,
      name: r'id_caixa',
      type: IsarType.long,
    ),
    r'id_venda_local': PropertySchema(
      id: 1,
      name: r'id_venda_local',
      type: IsarType.long,
    ),
    r'id_venda_servidor': PropertySchema(
      id: 2,
      name: r'id_venda_servidor',
      type: IsarType.long,
    ),
    r'isContingencia': PropertySchema(
      id: 3,
      name: r'isContingencia',
      type: IsarType.bool,
    ),
    r'qr_code': PropertySchema(
      id: 4,
      name: r'qr_code',
      type: IsarType.string,
    ),
    r'xml': PropertySchema(
      id: 5,
      name: r'xml',
      type: IsarType.string,
    )
  },
  estimateSize: _nfce_resultadoEstimateSize,
  serialize: _nfce_resultadoSerialize,
  deserialize: _nfce_resultadoDeserialize,
  deserializeProp: _nfce_resultadoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _nfce_resultadoGetId,
  getLinks: _nfce_resultadoGetLinks,
  attach: _nfce_resultadoAttach,
  version: '3.1.0+1',
);

int _nfce_resultadoEstimateSize(
  nfce_resultado object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.qr_code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.xml;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nfce_resultadoSerialize(
  nfce_resultado object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_caixa);
  writer.writeLong(offsets[1], object.id_venda_local);
  writer.writeLong(offsets[2], object.id_venda_servidor);
  writer.writeBool(offsets[3], object.isContingencia);
  writer.writeString(offsets[4], object.qr_code);
  writer.writeString(offsets[5], object.xml);
}

nfce_resultado _nfce_resultadoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = nfce_resultado(
    id_caixa: reader.readLongOrNull(offsets[0]),
    id_venda_local: reader.readLongOrNull(offsets[1]),
    id_venda_servidor: reader.readLongOrNull(offsets[2]),
    isContingencia: reader.readBoolOrNull(offsets[3]),
    qr_code: reader.readStringOrNull(offsets[4]),
    xml: reader.readStringOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _nfce_resultadoDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nfce_resultadoGetId(nfce_resultado object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nfce_resultadoGetLinks(nfce_resultado object) {
  return [];
}

void _nfce_resultadoAttach(
    IsarCollection<dynamic> col, Id id, nfce_resultado object) {
  object.id = id;
}

extension nfce_resultadoQueryWhereSort
    on QueryBuilder<nfce_resultado, nfce_resultado, QWhere> {
  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension nfce_resultadoQueryWhere
    on QueryBuilder<nfce_resultado, nfce_resultado, QWhereClause> {
  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterWhereClause> idBetween(
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

extension nfce_resultadoQueryFilter
    on QueryBuilder<nfce_resultado, nfce_resultado, QFilterCondition> {
  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition> idBetween(
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_caixa',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_caixa',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaGreaterThan(
    int? value, {
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaLessThan(
    int? value, {
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_caixaBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_venda_local',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_venda_local',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda_local',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_venda_local',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_venda_local',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_localBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_venda_local',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_venda_servidor',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_venda_servidor',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_venda_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_venda_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      id_venda_servidorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_venda_servidor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      isContingenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isContingencia',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      isContingenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isContingencia',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      isContingenciaEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isContingencia',
        value: value,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qr_code',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qr_code',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qr_code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qr_code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qr_code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qr_code',
        value: '',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      qr_codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qr_code',
        value: '',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xml',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xml',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xml',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'xml',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'xml',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xml',
        value: '',
      ));
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterFilterCondition>
      xmlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'xml',
        value: '',
      ));
    });
  }
}

extension nfce_resultadoQueryObject
    on QueryBuilder<nfce_resultado, nfce_resultado, QFilterCondition> {}

extension nfce_resultadoQueryLinks
    on QueryBuilder<nfce_resultado, nfce_resultado, QFilterCondition> {}

extension nfce_resultadoQuerySortBy
    on QueryBuilder<nfce_resultado, nfce_resultado, QSortBy> {
  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> sortById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortById_venda_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_local', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortById_venda_localDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_local', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortById_venda_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortByIsContingencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isContingencia', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortByIsContingenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isContingencia', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> sortByQr_code() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qr_code', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      sortByQr_codeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qr_code', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> sortByXml() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xml', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> sortByXmlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xml', Sort.desc);
    });
  }
}

extension nfce_resultadoQuerySortThenBy
    on QueryBuilder<nfce_resultado, nfce_resultado, QSortThenBy> {
  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenById_venda_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_local', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenById_venda_localDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_local', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenById_venda_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenByIsContingencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isContingencia', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenByIsContingenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isContingencia', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenByQr_code() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qr_code', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy>
      thenByQr_codeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qr_code', Sort.desc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenByXml() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xml', Sort.asc);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QAfterSortBy> thenByXmlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xml', Sort.desc);
    });
  }
}

extension nfce_resultadoQueryWhereDistinct
    on QueryBuilder<nfce_resultado, nfce_resultado, QDistinct> {
  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct> distinctById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa');
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct>
      distinctById_venda_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda_local');
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct>
      distinctById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda_servidor');
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct>
      distinctByIsContingencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isContingencia');
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct> distinctByQr_code(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qr_code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<nfce_resultado, nfce_resultado, QDistinct> distinctByXml(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xml', caseSensitive: caseSensitive);
    });
  }
}

extension nfce_resultadoQueryProperty
    on QueryBuilder<nfce_resultado, nfce_resultado, QQueryProperty> {
  QueryBuilder<nfce_resultado, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<nfce_resultado, int?, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<nfce_resultado, int?, QQueryOperations>
      id_venda_localProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda_local');
    });
  }

  QueryBuilder<nfce_resultado, int?, QQueryOperations>
      id_venda_servidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda_servidor');
    });
  }

  QueryBuilder<nfce_resultado, bool?, QQueryOperations>
      isContingenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isContingencia');
    });
  }

  QueryBuilder<nfce_resultado, String?, QQueryOperations> qr_codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qr_code');
    });
  }

  QueryBuilder<nfce_resultado, String?, QQueryOperations> xmlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xml');
    });
  }
}
