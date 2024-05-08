// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetcaixaCollection on Isar {
  IsarCollection<caixa> get caixas => this.collection();
}

const CaixaSchema = CollectionSchema(
  name: r'caixa',
  id: 2233208114782871795,
  properties: {
    r'abertura_data': PropertySchema(
      id: 0,
      name: r'abertura_data',
      type: IsarType.dateTime,
    ),
    r'abertura_hora': PropertySchema(
      id: 1,
      name: r'abertura_hora',
      type: IsarType.string,
    ),
    r'abertura_id_user': PropertySchema(
      id: 2,
      name: r'abertura_id_user',
      type: IsarType.long,
    ),
    r'abertura_valor': PropertySchema(
      id: 3,
      name: r'abertura_valor',
      type: IsarType.double,
    ),
    r'enviado': PropertySchema(
      id: 4,
      name: r'enviado',
      type: IsarType.long,
    ),
    r'fechou_data': PropertySchema(
      id: 5,
      name: r'fechou_data',
      type: IsarType.dateTime,
    ),
    r'fechou_hora': PropertySchema(
      id: 6,
      name: r'fechou_hora',
      type: IsarType.string,
    ),
    r'fechou_id_user': PropertySchema(
      id: 7,
      name: r'fechou_id_user',
      type: IsarType.long,
    ),
    r'id_caixa_servidor': PropertySchema(
      id: 8,
      name: r'id_caixa_servidor',
      type: IsarType.long,
    ),
    r'id_empresa': PropertySchema(
      id: 9,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _caixaEstimateSize,
  serialize: _caixaSerialize,
  deserialize: _caixaDeserialize,
  deserializeProp: _caixaDeserializeProp,
  idName: r'id_caixa',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _caixaGetId,
  getLinks: _caixaGetLinks,
  attach: _caixaAttach,
  version: '3.1.0+1',
);

int _caixaEstimateSize(
  caixa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.abertura_hora;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fechou_hora;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _caixaSerialize(
  caixa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.abertura_data);
  writer.writeString(offsets[1], object.abertura_hora);
  writer.writeLong(offsets[2], object.abertura_id_user);
  writer.writeDouble(offsets[3], object.abertura_valor);
  writer.writeLong(offsets[4], object.enviado);
  writer.writeDateTime(offsets[5], object.fechou_data);
  writer.writeString(offsets[6], object.fechou_hora);
  writer.writeLong(offsets[7], object.fechou_id_user);
  writer.writeLong(offsets[8], object.id_caixa_servidor);
  writer.writeLong(offsets[9], object.id_empresa);
  writer.writeLong(offsets[10], object.status);
}

caixa _caixaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = caixa(
    abertura_data: reader.readDateTimeOrNull(offsets[0]),
    abertura_hora: reader.readStringOrNull(offsets[1]),
    abertura_id_user: reader.readLongOrNull(offsets[2]),
    abertura_valor: reader.readDoubleOrNull(offsets[3]),
    enviado: reader.readLongOrNull(offsets[4]),
    fechou_data: reader.readDateTimeOrNull(offsets[5]),
    fechou_hora: reader.readStringOrNull(offsets[6]),
    fechou_id_user: reader.readLongOrNull(offsets[7]),
    id_caixa_servidor: reader.readLongOrNull(offsets[8]),
    id_empresa: reader.readLongOrNull(offsets[9]),
    status: reader.readLongOrNull(offsets[10]),
  );
  object.id_caixa = id;
  return object;
}

P _caixaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixaGetId(caixa object) {
  return object.id_caixa;
}

List<IsarLinkBase<dynamic>> _caixaGetLinks(caixa object) {
  return [];
}

void _caixaAttach(IsarCollection<dynamic> col, Id id, caixa object) {
  object.id_caixa = id;
}

extension caixaQueryWhereSort on QueryBuilder<caixa, caixa, QWhere> {
  QueryBuilder<caixa, caixa, QAfterWhere> anyId_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension caixaQueryWhere on QueryBuilder<caixa, caixa, QWhereClause> {
  QueryBuilder<caixa, caixa, QAfterWhereClause> id_caixaEqualTo(Id id_caixa) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_caixa,
        upper: id_caixa,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterWhereClause> id_caixaNotEqualTo(
      Id id_caixa) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_caixa, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_caixa, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_caixa, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_caixa, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<caixa, caixa, QAfterWhereClause> id_caixaGreaterThan(Id id_caixa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_caixa, includeLower: include),
      );
    });
  }

  QueryBuilder<caixa, caixa, QAfterWhereClause> id_caixaLessThan(Id id_caixa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_caixa, includeUpper: include),
      );
    });
  }

  QueryBuilder<caixa, caixa, QAfterWhereClause> id_caixaBetween(
    Id lowerId_caixa,
    Id upperId_caixa, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_caixa,
        includeLower: includeLower,
        upper: upperId_caixa,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension caixaQueryFilter on QueryBuilder<caixa, caixa, QFilterCondition> {
  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abertura_data',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abertura_data',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abertura_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abertura_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abertura_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_dataBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abertura_data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abertura_hora',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abertura_hora',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abertura_hora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abertura_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abertura_hora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abertura_hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abertura_hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_id_userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abertura_id_user',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition>
      abertura_id_userIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abertura_id_user',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_id_userEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abertura_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_id_userGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abertura_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_id_userLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abertura_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_id_userBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abertura_id_user',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abertura_valor',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abertura_valor',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abertura_valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abertura_valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abertura_valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> abertura_valorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abertura_valor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enviado',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enviado',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> enviadoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enviado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechou_data',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechou_data',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechou_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechou_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechou_data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_dataBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechou_data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechou_hora',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechou_hora',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechou_hora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechou_hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechou_hora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechou_hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechou_hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechou_id_user',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechou_id_user',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechou_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechou_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechou_id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> fechou_id_userBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechou_id_user',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixaEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixaGreaterThan(
    Id value, {
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixaLessThan(
    Id value, {
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixaBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixa_servidorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_caixa_servidor',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition>
      id_caixa_servidorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_caixa_servidor',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixa_servidorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition>
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixa_servidorLessThan(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_caixa_servidorBetween(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaGreaterThan(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaLessThan(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> id_empresaBetween(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<caixa, caixa, QAfterFilterCondition> statusBetween(
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
}

extension caixaQueryObject on QueryBuilder<caixa, caixa, QFilterCondition> {}

extension caixaQueryLinks on QueryBuilder<caixa, caixa, QFilterCondition> {}

extension caixaQuerySortBy on QueryBuilder<caixa, caixa, QSortBy> {
  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_data', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_dataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_data', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_hora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_hora', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_horaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_hora', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_id_user', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_id_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_id_user', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_valor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_valor', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByAbertura_valorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_valor', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_data', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_dataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_data', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_hora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_hora', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_horaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_hora', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_id_user', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByFechou_id_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_id_user', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortById_caixa_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension caixaQuerySortThenBy on QueryBuilder<caixa, caixa, QSortThenBy> {
  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_data', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_dataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_data', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_hora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_hora', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_horaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_hora', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_id_user', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_id_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_id_user', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_valor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_valor', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByAbertura_valorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abertura_valor', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_data', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_dataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_data', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_hora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_hora', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_horaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_hora', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_id_user', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByFechou_id_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechou_id_user', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_caixa_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa_servidor', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<caixa, caixa, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension caixaQueryWhereDistinct on QueryBuilder<caixa, caixa, QDistinct> {
  QueryBuilder<caixa, caixa, QDistinct> distinctByAbertura_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abertura_data');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByAbertura_hora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abertura_hora',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByAbertura_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abertura_id_user');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByAbertura_valor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abertura_valor');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByFechou_data() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechou_data');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByFechou_hora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechou_hora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByFechou_id_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechou_id_user');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctById_caixa_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa_servidor');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<caixa, caixa, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension caixaQueryProperty on QueryBuilder<caixa, caixa, QQueryProperty> {
  QueryBuilder<caixa, int, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<caixa, DateTime?, QQueryOperations> abertura_dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abertura_data');
    });
  }

  QueryBuilder<caixa, String?, QQueryOperations> abertura_horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abertura_hora');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> abertura_id_userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abertura_id_user');
    });
  }

  QueryBuilder<caixa, double?, QQueryOperations> abertura_valorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abertura_valor');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<caixa, DateTime?, QQueryOperations> fechou_dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechou_data');
    });
  }

  QueryBuilder<caixa, String?, QQueryOperations> fechou_horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechou_hora');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> fechou_id_userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechou_id_user');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> id_caixa_servidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa_servidor');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<caixa, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
