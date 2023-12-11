// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixa_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCaixaItemCollection on Isar {
  IsarCollection<CaixaItem> get caixaItems => this.collection();
}

const CaixaItemSchema = CollectionSchema(
  name: r'CaixaItem',
  id: 9026364013510183888,
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
    r'idCaixa': PropertySchema(
      id: 4,
      name: r'idCaixa',
      type: IsarType.long,
    ),
    r'idTipoRecebimento': PropertySchema(
      id: 5,
      name: r'idTipoRecebimento',
      type: IsarType.long,
    ),
    r'idVenda': PropertySchema(
      id: 6,
      name: r'idVenda',
      type: IsarType.long,
    ),
    r'valorCre': PropertySchema(
      id: 7,
      name: r'valorCre',
      type: IsarType.double,
    ),
    r'valorDeb': PropertySchema(
      id: 8,
      name: r'valorDeb',
      type: IsarType.double,
    )
  },
  estimateSize: _caixaItemEstimateSize,
  serialize: _caixaItemSerialize,
  deserialize: _caixaItemDeserialize,
  deserializeProp: _caixaItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _caixaItemGetId,
  getLinks: _caixaItemGetLinks,
  attach: _caixaItemAttach,
  version: '3.1.0+1',
);

int _caixaItemEstimateSize(
  CaixaItem object,
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

void _caixaItemSerialize(
  CaixaItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.data);
  writer.writeString(offsets[1], object.descricao);
  writer.writeLong(offsets[2], object.enviado);
  writer.writeString(offsets[3], object.hora);
  writer.writeLong(offsets[4], object.idCaixa);
  writer.writeLong(offsets[5], object.idTipoRecebimento);
  writer.writeLong(offsets[6], object.idVenda);
  writer.writeDouble(offsets[7], object.valorCre);
  writer.writeDouble(offsets[8], object.valorDeb);
}

CaixaItem _caixaItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CaixaItem();
  object.data = reader.readDateTime(offsets[0]);
  object.descricao = reader.readStringOrNull(offsets[1]);
  object.enviado = reader.readLong(offsets[2]);
  object.hora = reader.readString(offsets[3]);
  object.id = id;
  object.idCaixa = reader.readLong(offsets[4]);
  object.idTipoRecebimento = reader.readLong(offsets[5]);
  object.idVenda = reader.readLong(offsets[6]);
  object.valorCre = reader.readDouble(offsets[7]);
  object.valorDeb = reader.readDouble(offsets[8]);
  return object;
}

P _caixaItemDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixaItemGetId(CaixaItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _caixaItemGetLinks(CaixaItem object) {
  return [];
}

void _caixaItemAttach(IsarCollection<dynamic> col, Id id, CaixaItem object) {
  object.id = id;
}

extension CaixaItemQueryWhereSort
    on QueryBuilder<CaixaItem, CaixaItem, QWhere> {
  QueryBuilder<CaixaItem, CaixaItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CaixaItemQueryWhere
    on QueryBuilder<CaixaItem, CaixaItem, QWhereClause> {
  QueryBuilder<CaixaItem, CaixaItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterWhereClause> idBetween(
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

extension CaixaItemQueryFilter
    on QueryBuilder<CaixaItem, CaixaItem, QFilterCondition> {
  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> dataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> dataGreaterThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> dataLessThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> dataBetween(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoEqualTo(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoLessThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoBetween(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoStartsWith(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoEndsWith(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoContains(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoMatches(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> enviadoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> enviadoGreaterThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> enviadoLessThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> enviadoBetween(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaEqualTo(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaGreaterThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaLessThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaBetween(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaStartsWith(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaEndsWith(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaContains(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaMatches(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idCaixaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCaixa',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idCaixaGreaterThan(
    int value, {
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idCaixaLessThan(
    int value, {
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idCaixaBetween(
    int lower,
    int upper, {
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

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      idTipoRecebimentoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTipoRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      idTipoRecebimentoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idTipoRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      idTipoRecebimentoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idTipoRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition>
      idTipoRecebimentoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idTipoRecebimento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idVendaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idVendaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idVendaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> idVendaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idVenda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorCreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorCre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorCreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorCre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorCreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorCre',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorCreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorCre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorDebEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorDeb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorDebGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorDeb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorDebLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorDeb',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterFilterCondition> valorDebBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorDeb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CaixaItemQueryObject
    on QueryBuilder<CaixaItem, CaixaItem, QFilterCondition> {}

extension CaixaItemQueryLinks
    on QueryBuilder<CaixaItem, CaixaItem, QFilterCondition> {}

extension CaixaItemQuerySortBy on QueryBuilder<CaixaItem, CaixaItem, QSortBy> {
  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByIdCaixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByIdCaixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByIdTipoRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTipoRecebimento', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy>
      sortByIdTipoRecebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTipoRecebimento', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByValorCre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCre', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByValorCreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCre', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByValorDeb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorDeb', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> sortByValorDebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorDeb', Sort.desc);
    });
  }
}

extension CaixaItemQuerySortThenBy
    on QueryBuilder<CaixaItem, CaixaItem, QSortThenBy> {
  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdCaixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdCaixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCaixa', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdTipoRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTipoRecebimento', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy>
      thenByIdTipoRecebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTipoRecebimento', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByValorCre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCre', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByValorCreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCre', Sort.desc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByValorDeb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorDeb', Sort.asc);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QAfterSortBy> thenByValorDebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorDeb', Sort.desc);
    });
  }
}

extension CaixaItemQueryWhereDistinct
    on QueryBuilder<CaixaItem, CaixaItem, QDistinct> {
  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByIdCaixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCaixa');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByIdTipoRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idTipoRecebimento');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idVenda');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByValorCre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorCre');
    });
  }

  QueryBuilder<CaixaItem, CaixaItem, QDistinct> distinctByValorDeb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorDeb');
    });
  }
}

extension CaixaItemQueryProperty
    on QueryBuilder<CaixaItem, CaixaItem, QQueryProperty> {
  QueryBuilder<CaixaItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CaixaItem, DateTime, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<CaixaItem, String?, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<CaixaItem, int, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<CaixaItem, String, QQueryOperations> horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hora');
    });
  }

  QueryBuilder<CaixaItem, int, QQueryOperations> idCaixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCaixa');
    });
  }

  QueryBuilder<CaixaItem, int, QQueryOperations> idTipoRecebimentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idTipoRecebimento');
    });
  }

  QueryBuilder<CaixaItem, int, QQueryOperations> idVendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idVenda');
    });
  }

  QueryBuilder<CaixaItem, double, QQueryOperations> valorCreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorCre');
    });
  }

  QueryBuilder<CaixaItem, double, QQueryOperations> valorDebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorDeb');
    });
  }
}
