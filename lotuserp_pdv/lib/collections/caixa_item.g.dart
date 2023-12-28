// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'caixa_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getcaixa_itemCollection on Isar {
  IsarCollection<caixa_item> get caixa_items => this.collection();
}

const Caixa_itemSchema = CollectionSchema(
  name: r'caixa_item',
  id: 8565565253506002852,
  properties: {
    r'data': PropertySchema(
      id: 0,
      name: r'data',
      type: IsarType.dateTime,
    ),
    r'descricao': PropertySchema(
      id: 1,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'enviado': PropertySchema(
      id: 2,
      name: r'enviado',
      type: IsarType.long,
    ),
    r'hora': PropertySchema(
      id: 3,
      name: r'hora',
      type: IsarType.string,
    ),
    r'id_caixa': PropertySchema(
      id: 4,
      name: r'id_caixa',
      type: IsarType.long,
    ),
    r'id_tipo_recebimento': PropertySchema(
      id: 5,
      name: r'id_tipo_recebimento',
      type: IsarType.long,
    ),
    r'id_venda': PropertySchema(
      id: 6,
      name: r'id_venda',
      type: IsarType.long,
    ),
    r'valor_cre': PropertySchema(
      id: 7,
      name: r'valor_cre',
      type: IsarType.double,
    ),
    r'valor_deb': PropertySchema(
      id: 8,
      name: r'valor_deb',
      type: IsarType.double,
    )
  },
  estimateSize: _caixa_itemEstimateSize,
  serialize: _caixa_itemSerialize,
  deserialize: _caixa_itemDeserialize,
  deserializeProp: _caixa_itemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _caixa_itemGetId,
  getLinks: _caixa_itemGetLinks,
  attach: _caixa_itemAttach,
  version: '3.1.0+1',
);

int _caixa_itemEstimateSize(
  caixa_item object,
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
  bytesCount += 3 + object.hora.length * 3;
  return bytesCount;
}

void _caixa_itemSerialize(
  caixa_item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.data);
  writer.writeString(offsets[1], object.descricao);
  writer.writeLong(offsets[2], object.enviado);
  writer.writeString(offsets[3], object.hora);
  writer.writeLong(offsets[4], object.id_caixa);
  writer.writeLong(offsets[5], object.id_tipo_recebimento);
  writer.writeLong(offsets[6], object.id_venda);
  writer.writeDouble(offsets[7], object.valor_cre);
  writer.writeDouble(offsets[8], object.valor_deb);
}

caixa_item _caixa_itemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = caixa_item();
  object.data = reader.readDateTime(offsets[0]);
  object.descricao = reader.readStringOrNull(offsets[1]);
  object.enviado = reader.readLong(offsets[2]);
  object.hora = reader.readString(offsets[3]);
  object.id = id;
  object.id_caixa = reader.readLong(offsets[4]);
  object.id_tipo_recebimento = reader.readLong(offsets[5]);
  object.id_venda = reader.readLongOrNull(offsets[6]);
  object.valor_cre = reader.readDoubleOrNull(offsets[7]);
  object.valor_deb = reader.readDoubleOrNull(offsets[8]);
  return object;
}

P _caixa_itemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixa_itemGetId(caixa_item object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _caixa_itemGetLinks(caixa_item object) {
  return [];
}

void _caixa_itemAttach(IsarCollection<dynamic> col, Id id, caixa_item object) {
  object.id = id;
}

extension caixa_itemQueryWhereSort
    on QueryBuilder<caixa_item, caixa_item, QWhere> {
  QueryBuilder<caixa_item, caixa_item, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension caixa_itemQueryWhere
    on QueryBuilder<caixa_item, caixa_item, QWhereClause> {
  QueryBuilder<caixa_item, caixa_item, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<caixa_item, caixa_item, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterWhereClause> idBetween(
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

extension caixa_itemQueryFilter
    on QueryBuilder<caixa_item, caixa_item, QFilterCondition> {
  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> dataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> dataGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> dataLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> dataBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoEqualTo(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoGreaterThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoLessThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoBetween(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoStartsWith(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoEndsWith(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoContains(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> descricaoMatches(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> enviadoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      enviadoGreaterThan(
    int value, {
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> enviadoLessThan(
    int value, {
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> enviadoBetween(
    int lower,
    int upper, {
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> idBetween(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_caixaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_caixaLessThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_caixaBetween(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      id_tipo_recebimentoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_tipo_recebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_vendaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_venda',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      id_vendaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_venda',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_vendaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_vendaLessThan(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> id_vendaBetween(
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

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_creIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valor_cre',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_creIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valor_cre',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_creEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_cre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_creGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_cre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_creLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_cre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_creBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_cre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_debIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valor_deb',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_debIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valor_deb',
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_debEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_deb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition>
      valor_debGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_deb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_debLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_deb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterFilterCondition> valor_debBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_deb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension caixa_itemQueryObject
    on QueryBuilder<caixa_item, caixa_item, QFilterCondition> {}

extension caixa_itemQueryLinks
    on QueryBuilder<caixa_item, caixa_item, QFilterCondition> {}

extension caixa_itemQuerySortBy
    on QueryBuilder<caixa_item, caixa_item, QSortBy> {
  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy>
      sortById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy>
      sortById_tipo_recebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByValor_cre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_cre', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByValor_creDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_cre', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByValor_deb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_deb', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> sortByValor_debDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_deb', Sort.desc);
    });
  }
}

extension caixa_itemQuerySortThenBy
    on QueryBuilder<caixa_item, caixa_item, QSortThenBy> {
  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy>
      thenById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy>
      thenById_tipo_recebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_tipo_recebimento', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByValor_cre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_cre', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByValor_creDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_cre', Sort.desc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByValor_deb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_deb', Sort.asc);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QAfterSortBy> thenByValor_debDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_deb', Sort.desc);
    });
  }
}

extension caixa_itemQueryWhereDistinct
    on QueryBuilder<caixa_item, caixa_item, QDistinct> {
  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct>
      distinctById_tipo_recebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_tipo_recebimento');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByValor_cre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_cre');
    });
  }

  QueryBuilder<caixa_item, caixa_item, QDistinct> distinctByValor_deb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_deb');
    });
  }
}

extension caixa_itemQueryProperty
    on QueryBuilder<caixa_item, caixa_item, QQueryProperty> {
  QueryBuilder<caixa_item, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<caixa_item, DateTime, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<caixa_item, String?, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<caixa_item, int, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<caixa_item, String, QQueryOperations> horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hora');
    });
  }

  QueryBuilder<caixa_item, int, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<caixa_item, int, QQueryOperations>
      id_tipo_recebimentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_tipo_recebimento');
    });
  }

  QueryBuilder<caixa_item, int?, QQueryOperations> id_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda');
    });
  }

  QueryBuilder<caixa_item, double?, QQueryOperations> valor_creProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_cre');
    });
  }

  QueryBuilder<caixa_item, double?, QQueryOperations> valor_debProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_deb');
    });
  }
}
