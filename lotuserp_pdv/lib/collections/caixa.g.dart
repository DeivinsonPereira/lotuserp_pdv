// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCaixaCollection on Isar {
  IsarCollection<Caixa> get caixas => this.collection();
}

const CaixaSchema = CollectionSchema(
  name: r'Caixa',
  id: -4806767503306867375,
  properties: {
    r'aberturaData': PropertySchema(
      id: 0,
      name: r'aberturaData',
      type: IsarType.dateTime,
    ),
    r'aberturaHora': PropertySchema(
      id: 1,
      name: r'aberturaHora',
      type: IsarType.string,
    ),
    r'aberturaIdUser': PropertySchema(
      id: 2,
      name: r'aberturaIdUser',
      type: IsarType.long,
    ),
    r'aberturaValor': PropertySchema(
      id: 3,
      name: r'aberturaValor',
      type: IsarType.double,
    ),
    r'enviado': PropertySchema(
      id: 4,
      name: r'enviado',
      type: IsarType.long,
    ),
    r'fechouData': PropertySchema(
      id: 5,
      name: r'fechouData',
      type: IsarType.dateTime,
    ),
    r'fechouHora': PropertySchema(
      id: 6,
      name: r'fechouHora',
      type: IsarType.string,
    ),
    r'fechouIdUser': PropertySchema(
      id: 7,
      name: r'fechouIdUser',
      type: IsarType.long,
    ),
    r'fechouValor': PropertySchema(
      id: 8,
      name: r'fechouValor',
      type: IsarType.double,
    ),
    r'idCaixaServidor': PropertySchema(
      id: 9,
      name: r'idCaixaServidor',
      type: IsarType.long,
    ),
    r'idEmpresa': PropertySchema(
      id: 10,
      name: r'idEmpresa',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _caixaEstimateSize,
  serialize: _caixaSerialize,
  deserialize: _caixaDeserialize,
  deserializeProp: _caixaDeserializeProp,
  idName: r'idCaixa',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _caixaGetId,
  getLinks: _caixaGetLinks,
  attach: _caixaAttach,
  version: '3.1.0+1',
);

int _caixaEstimateSize(
  Caixa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aberturaHora.length * 3;
  {
    final value = object.fechouHora;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _caixaSerialize(
  Caixa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.aberturaData);
  writer.writeString(offsets[1], object.aberturaHora);
  writer.writeLong(offsets[2], object.aberturaIdUser);
  writer.writeDouble(offsets[3], object.aberturaValor);
  writer.writeLong(offsets[4], object.enviado);
  writer.writeDateTime(offsets[5], object.fechouData);
  writer.writeString(offsets[6], object.fechouHora);
  writer.writeLong(offsets[7], object.fechouIdUser);
  writer.writeDouble(offsets[8], object.fechouValor);
  writer.writeLong(offsets[9], object.idCaixaServidor);
  writer.writeLong(offsets[10], object.idEmpresa);
  writer.writeLong(offsets[11], object.status);
}

Caixa _caixaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Caixa();
  object.aberturaData = reader.readDateTime(offsets[0]);
  object.aberturaHora = reader.readString(offsets[1]);
  object.aberturaIdUser = reader.readLong(offsets[2]);
  object.aberturaValor = reader.readDouble(offsets[3]);
  object.enviado = reader.readLongOrNull(offsets[4]);
  object.fechouData = reader.readDateTimeOrNull(offsets[5]);
  object.fechouHora = reader.readStringOrNull(offsets[6]);
  object.fechouIdUser = reader.readLongOrNull(offsets[7]);
  object.fechouValor = reader.readDoubleOrNull(offsets[8]);
  object.idCaixa = id;
  object.idCaixaServidor = reader.readLongOrNull(offsets[9]);
  object.idEmpresa = reader.readLong(offsets[10]);
  object.status = reader.readLong(offsets[11]);
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
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixaGetId(Caixa object) {
  return object.idCaixa;
}

List<IsarLinkBase<dynamic>> _caixaGetLinks(Caixa object) {
  return [];
}

void _caixaAttach(IsarCollection<dynamic> col, Id id, Caixa object) {
  object.idCaixa = id;
}

extension CaixaQueryWhereSort on QueryBuilder<Caixa, Caixa, QWhere> {
  QueryBuilder<Caixa, Caixa, QAfterWhere> anyIdCaixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CaixaQueryWhere on QueryBuilder<Caixa, Caixa, QWhereClause> {
  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idCaixaEqualTo(Id idCaixa) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idCaixa,
        upper: idCaixa,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idCaixaNotEqualTo(Id idCaixa) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: idCaixa, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idCaixa, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idCaixa, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: idCaixa, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idCaixaGreaterThan(Id idCaixa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: idCaixa, includeLower: include),
      );
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idCaixaLessThan(Id idCaixa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idCaixa, includeUpper: include),
      );
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idCaixaBetween(
    Id lowerIdCaixa,
    Id upperIdCaixa, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdCaixa,
        includeLower: includeLower,
        upper: upperIdCaixa,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CaixaQueryFilter on QueryBuilder<Caixa, Caixa, QFilterCondition> {
  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaDataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aberturaData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaDataGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aberturaData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaDataLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aberturaData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaDataBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aberturaData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aberturaHora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aberturaHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aberturaHora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aberturaHora',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaHoraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aberturaHora',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaIdUserEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aberturaIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaIdUserGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aberturaIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaIdUserLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aberturaIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaIdUserBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aberturaIdUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaValorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aberturaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaValorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aberturaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaValorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aberturaValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> aberturaValorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aberturaValor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enviado',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enviado',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoGreaterThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoLessThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> enviadoBetween(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechouData',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechouData',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechouData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechouData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechouData',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouDataBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechouData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechouHora',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechouHora',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechouHora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechouHora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechouHora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechouHora',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouHoraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechouHora',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechouIdUser',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechouIdUser',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechouIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechouIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechouIdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouIdUserBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechouIdUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechouValor',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechouValor',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechouValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechouValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechouValor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> fechouValorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechouValor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCaixa',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCaixa',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCaixa',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCaixa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idCaixaServidor',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idCaixaServidor',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCaixaServidor',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCaixaServidor',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCaixaServidor',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idCaixaServidorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCaixaServidor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idEmpresaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idEmpresa',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idEmpresaGreaterThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idEmpresaLessThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idEmpresaBetween(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> statusGreaterThan(
    int value, {
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> statusLessThan(
    int value, {
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
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

extension CaixaQueryObject on QueryBuilder<Caixa, Caixa, QFilterCondition> {}

extension CaixaQueryLinks on QueryBuilder<Caixa, Caixa, QFilterCondition> {}

extension CaixaQuerySortBy on QueryBuilder<Caixa, Caixa, QSortBy> {
  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaData', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaData', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaHora', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaHora', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaIdUser', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaIdUser', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaValor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByAberturaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaValor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouData', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouData', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouHora', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouHora', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouIdUser', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouIdUser', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouValor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByFechouValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouValor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdCaixaServidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixaServidor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdCaixaServidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixaServidor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CaixaQuerySortThenBy on QueryBuilder<Caixa, Caixa, QSortThenBy> {
  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaData', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaData', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaHora', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaHora', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaIdUser', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaIdUser', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaValor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByAberturaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aberturaValor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouData', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouData', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouHora', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouHora', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouIdUser', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouIdUser', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouValor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByFechouValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechouValor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdCaixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdCaixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdCaixaServidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixaServidor', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdCaixaServidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixaServidor', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CaixaQueryWhereDistinct on QueryBuilder<Caixa, Caixa, QDistinct> {
  QueryBuilder<Caixa, Caixa, QDistinct> distinctByAberturaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aberturaData');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByAberturaHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aberturaHora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByAberturaIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aberturaIdUser');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByAberturaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aberturaValor');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByFechouData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechouData');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByFechouHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechouHora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByFechouIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechouIdUser');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByFechouValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechouValor');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByIdCaixaServidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCaixaServidor');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idEmpresa');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension CaixaQueryProperty on QueryBuilder<Caixa, Caixa, QQueryProperty> {
  QueryBuilder<Caixa, int, QQueryOperations> idCaixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCaixa');
    });
  }

  QueryBuilder<Caixa, DateTime, QQueryOperations> aberturaDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aberturaData');
    });
  }

  QueryBuilder<Caixa, String, QQueryOperations> aberturaHoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aberturaHora');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> aberturaIdUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aberturaIdUser');
    });
  }

  QueryBuilder<Caixa, double, QQueryOperations> aberturaValorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aberturaValor');
    });
  }

  QueryBuilder<Caixa, int?, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<Caixa, DateTime?, QQueryOperations> fechouDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechouData');
    });
  }

  QueryBuilder<Caixa, String?, QQueryOperations> fechouHoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechouHora');
    });
  }

  QueryBuilder<Caixa, int?, QQueryOperations> fechouIdUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechouIdUser');
    });
  }

  QueryBuilder<Caixa, double?, QQueryOperations> fechouValorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechouValor');
    });
  }

  QueryBuilder<Caixa, int?, QQueryOperations> idCaixaServidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCaixaServidor');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> idEmpresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idEmpresa');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
