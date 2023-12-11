// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVendaCollection on Isar {
  IsarCollection<Venda> get vendas => this.collection();
}

const VendaSchema = CollectionSchema(
  name: r'Venda',
  id: 5343115897127578360,
  properties: {
    r'cpfCnpj': PropertySchema(
      id: 0,
      name: r'cpfCnpj',
      type: IsarType.string,
    ),
    r'data': PropertySchema(
      id: 1,
      name: r'data',
      type: IsarType.dateTime,
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
    r'idEmpresa': PropertySchema(
      id: 4,
      name: r'idEmpresa',
      type: IsarType.long,
    ),
    r'idSerieNfce': PropertySchema(
      id: 5,
      name: r'idSerieNfce',
      type: IsarType.long,
    ),
    r'idUsuario': PropertySchema(
      id: 6,
      name: r'idUsuario',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.long,
    ),
    r'totBruto': PropertySchema(
      id: 8,
      name: r'totBruto',
      type: IsarType.double,
    ),
    r'totDescPrc': PropertySchema(
      id: 9,
      name: r'totDescPrc',
      type: IsarType.double,
    ),
    r'totDescVlr': PropertySchema(
      id: 10,
      name: r'totDescVlr',
      type: IsarType.double,
    ),
    r'totLiquido': PropertySchema(
      id: 11,
      name: r'totLiquido',
      type: IsarType.double,
    ),
    r'valorTroco': PropertySchema(
      id: 12,
      name: r'valorTroco',
      type: IsarType.double,
    )
  },
  estimateSize: _vendaEstimateSize,
  serialize: _vendaSerialize,
  deserialize: _vendaDeserialize,
  deserializeProp: _vendaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'vendaProdutos': LinkSchema(
      id: -3536786868747286074,
      name: r'vendaProdutos',
      target: r'VendaItem',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vendaGetId,
  getLinks: _vendaGetLinks,
  attach: _vendaAttach,
  version: '3.1.0+1',
);

int _vendaEstimateSize(
  Venda object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cpfCnpj.length * 3;
  bytesCount += 3 + object.hora.length * 3;
  return bytesCount;
}

void _vendaSerialize(
  Venda object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cpfCnpj);
  writer.writeDateTime(offsets[1], object.data);
  writer.writeLong(offsets[2], object.enviado);
  writer.writeString(offsets[3], object.hora);
  writer.writeLong(offsets[4], object.idEmpresa);
  writer.writeLong(offsets[5], object.idSerieNfce);
  writer.writeLong(offsets[6], object.idUsuario);
  writer.writeLong(offsets[7], object.status);
  writer.writeDouble(offsets[8], object.totBruto);
  writer.writeDouble(offsets[9], object.totDescPrc);
  writer.writeDouble(offsets[10], object.totDescVlr);
  writer.writeDouble(offsets[11], object.totLiquido);
  writer.writeDouble(offsets[12], object.valorTroco);
}

Venda _vendaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Venda(
    reader.readDateTime(offsets[1]),
    reader.readString(offsets[3]),
    reader.readLong(offsets[4]),
    reader.readLong(offsets[6]),
    reader.readDouble(offsets[8]),
    reader.readDouble(offsets[9]),
    reader.readDouble(offsets[10]),
    reader.readDouble(offsets[11]),
    reader.readDouble(offsets[12]),
    reader.readLong(offsets[7]),
    reader.readLong(offsets[5]),
    reader.readLong(offsets[2]),
    reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _vendaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
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
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vendaGetId(Venda object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vendaGetLinks(Venda object) {
  return [object.vendaProdutos];
}

void _vendaAttach(IsarCollection<dynamic> col, Id id, Venda object) {
  object.id = id;
  object.vendaProdutos
      .attach(col, col.isar.collection<VendaItem>(), r'vendaProdutos', id);
}

extension VendaQueryWhereSort on QueryBuilder<Venda, Venda, QWhere> {
  QueryBuilder<Venda, Venda, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VendaQueryWhere on QueryBuilder<Venda, Venda, QWhereClause> {
  QueryBuilder<Venda, Venda, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Venda, Venda, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Venda, Venda, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Venda, Venda, QAfterWhereClause> idBetween(
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

extension VendaQueryFilter on QueryBuilder<Venda, Venda, QFilterCondition> {
  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cpfCnpj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cpfCnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cpfCnpj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpfCnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> cpfCnpjIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cpfCnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> dataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> dataGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> dataLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> dataBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> enviadoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> enviadoGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> enviadoLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> enviadoBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaEqualTo(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaStartsWith(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaEndsWith(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idEmpresaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idEmpresa',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idEmpresaGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idEmpresaLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idEmpresaBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idSerieNfceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSerieNfce',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idSerieNfceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idSerieNfce',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idSerieNfceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idSerieNfce',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idSerieNfceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idSerieNfce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idUsuarioEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idUsuarioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idUsuarioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> idUsuarioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUsuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totBrutoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totBruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totBrutoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totBruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totBrutoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totBruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totBrutoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totBruto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescPrcEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totDescPrc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescPrcGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totDescPrc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescPrcLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totDescPrc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescPrcBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totDescPrc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescVlrEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totDescVlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescVlrGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totDescVlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescVlrLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totDescVlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totDescVlrBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totDescVlr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totLiquidoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totLiquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totLiquidoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totLiquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totLiquidoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totLiquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> totLiquidoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totLiquido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> valorTrocoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorTroco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> valorTrocoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorTroco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> valorTrocoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorTroco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> valorTrocoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorTroco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VendaQueryObject on QueryBuilder<Venda, Venda, QFilterCondition> {}

extension VendaQueryLinks on QueryBuilder<Venda, Venda, QFilterCondition> {
  QueryBuilder<Venda, Venda, QAfterFilterCondition> vendaProdutos(
      FilterQuery<VendaItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vendaProdutos');
    });
  }

  QueryBuilder<Venda, Venda, QAfterFilterCondition> vendaProdutosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vendaProdutos', 0, true, 0, true);
    });
  }
}

extension VendaQuerySortBy on QueryBuilder<Venda, Venda, QSortBy> {
  QueryBuilder<Venda, Venda, QAfterSortBy> sortByCpfCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpfCnpj', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByCpfCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpfCnpj', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdSerieNfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSerieNfce', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdSerieNfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSerieNfce', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotDescPrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescPrc', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotDescPrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescPrc', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotDescVlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescVlr', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotDescVlrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescVlr', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotLiquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totLiquido', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByTotLiquidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totLiquido', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByValorTroco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorTroco', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> sortByValorTrocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorTroco', Sort.desc);
    });
  }
}

extension VendaQuerySortThenBy on QueryBuilder<Venda, Venda, QSortThenBy> {
  QueryBuilder<Venda, Venda, QAfterSortBy> thenByCpfCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpfCnpj', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByCpfCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpfCnpj', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idEmpresa', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdSerieNfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSerieNfce', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdSerieNfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSerieNfce', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotDescPrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescPrc', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotDescPrcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescPrc', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotDescVlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescVlr', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotDescVlrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totDescVlr', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotLiquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totLiquido', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByTotLiquidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totLiquido', Sort.desc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByValorTroco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorTroco', Sort.asc);
    });
  }

  QueryBuilder<Venda, Venda, QAfterSortBy> thenByValorTrocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorTroco', Sort.desc);
    });
  }
}

extension VendaQueryWhereDistinct on QueryBuilder<Venda, Venda, QDistinct> {
  QueryBuilder<Venda, Venda, QDistinct> distinctByCpfCnpj(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cpfCnpj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByIdEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idEmpresa');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByIdSerieNfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idSerieNfce');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUsuario');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totBruto');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByTotDescPrc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totDescPrc');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByTotDescVlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totDescVlr');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByTotLiquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totLiquido');
    });
  }

  QueryBuilder<Venda, Venda, QDistinct> distinctByValorTroco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorTroco');
    });
  }
}

extension VendaQueryProperty on QueryBuilder<Venda, Venda, QQueryProperty> {
  QueryBuilder<Venda, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Venda, String, QQueryOperations> cpfCnpjProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cpfCnpj');
    });
  }

  QueryBuilder<Venda, DateTime, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<Venda, int, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<Venda, String, QQueryOperations> horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hora');
    });
  }

  QueryBuilder<Venda, int, QQueryOperations> idEmpresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idEmpresa');
    });
  }

  QueryBuilder<Venda, int, QQueryOperations> idSerieNfceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idSerieNfce');
    });
  }

  QueryBuilder<Venda, int, QQueryOperations> idUsuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUsuario');
    });
  }

  QueryBuilder<Venda, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Venda, double, QQueryOperations> totBrutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totBruto');
    });
  }

  QueryBuilder<Venda, double, QQueryOperations> totDescPrcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totDescPrc');
    });
  }

  QueryBuilder<Venda, double, QQueryOperations> totDescVlrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totDescVlr');
    });
  }

  QueryBuilder<Venda, double, QQueryOperations> totLiquidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totLiquido');
    });
  }

  QueryBuilder<Venda, double, QQueryOperations> valorTrocoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorTroco');
    });
  }
}
