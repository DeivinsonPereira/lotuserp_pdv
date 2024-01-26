// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetvendaCollection on Isar {
  IsarCollection<venda> get vendas => this.collection();
}

const VendaSchema = CollectionSchema(
  name: r'venda',
  id: -7199095368956515322,
  properties: {
    r'cpf_cnpj': PropertySchema(
      id: 0,
      name: r'cpf_cnpj',
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
    r'id_caixa': PropertySchema(
      id: 4,
      name: r'id_caixa',
      type: IsarType.long,
    ),
    r'id_colaborador': PropertySchema(
      id: 5,
      name: r'id_colaborador',
      type: IsarType.long,
    ),
    r'id_empresa': PropertySchema(
      id: 6,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_serie_nfce': PropertySchema(
      id: 7,
      name: r'id_serie_nfce',
      type: IsarType.long,
    ),
    r'id_usuario': PropertySchema(
      id: 8,
      name: r'id_usuario',
      type: IsarType.long,
    ),
    r'id_venda_servidor': PropertySchema(
      id: 9,
      name: r'id_venda_servidor',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.long,
    ),
    r'tot_bruto': PropertySchema(
      id: 11,
      name: r'tot_bruto',
      type: IsarType.double,
    ),
    r'tot_desc_prc': PropertySchema(
      id: 12,
      name: r'tot_desc_prc',
      type: IsarType.double,
    ),
    r'tot_desc_vlr': PropertySchema(
      id: 13,
      name: r'tot_desc_vlr',
      type: IsarType.double,
    ),
    r'tot_liquido': PropertySchema(
      id: 14,
      name: r'tot_liquido',
      type: IsarType.double,
    ),
    r'valor_troco': PropertySchema(
      id: 15,
      name: r'valor_troco',
      type: IsarType.double,
    )
  },
  estimateSize: _vendaEstimateSize,
  serialize: _vendaSerialize,
  deserialize: _vendaDeserialize,
  deserializeProp: _vendaDeserializeProp,
  idName: r'id_venda',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vendaGetId,
  getLinks: _vendaGetLinks,
  attach: _vendaAttach,
  version: '3.1.0+1',
);

int _vendaEstimateSize(
  venda object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cpf_cnpj.length * 3;
  bytesCount += 3 + object.hora.length * 3;
  return bytesCount;
}

void _vendaSerialize(
  venda object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cpf_cnpj);
  writer.writeDateTime(offsets[1], object.data);
  writer.writeLong(offsets[2], object.enviado);
  writer.writeString(offsets[3], object.hora);
  writer.writeLong(offsets[4], object.id_caixa);
  writer.writeLong(offsets[5], object.id_colaborador);
  writer.writeLong(offsets[6], object.id_empresa);
  writer.writeLong(offsets[7], object.id_serie_nfce);
  writer.writeLong(offsets[8], object.id_usuario);
  writer.writeLong(offsets[9], object.id_venda_servidor);
  writer.writeLong(offsets[10], object.status);
  writer.writeDouble(offsets[11], object.tot_bruto);
  writer.writeDouble(offsets[12], object.tot_desc_prc);
  writer.writeDouble(offsets[13], object.tot_desc_vlr);
  writer.writeDouble(offsets[14], object.tot_liquido);
  writer.writeDouble(offsets[15], object.valor_troco);
}

venda _vendaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = venda();
  object.cpf_cnpj = reader.readString(offsets[0]);
  object.data = reader.readDateTime(offsets[1]);
  object.enviado = reader.readLong(offsets[2]);
  object.hora = reader.readString(offsets[3]);
  object.id_caixa = reader.readLong(offsets[4]);
  object.id_colaborador = reader.readLong(offsets[5]);
  object.id_empresa = reader.readLong(offsets[6]);
  object.id_serie_nfce = reader.readLong(offsets[7]);
  object.id_usuario = reader.readLong(offsets[8]);
  object.id_venda = id;
  object.id_venda_servidor = reader.readLong(offsets[9]);
  object.status = reader.readLong(offsets[10]);
  object.tot_bruto = reader.readDouble(offsets[11]);
  object.tot_desc_prc = reader.readDouble(offsets[12]);
  object.tot_desc_vlr = reader.readDouble(offsets[13]);
  object.tot_liquido = reader.readDouble(offsets[14]);
  object.valor_troco = reader.readDouble(offsets[15]);
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
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vendaGetId(venda object) {
  return object.id_venda;
}

List<IsarLinkBase<dynamic>> _vendaGetLinks(venda object) {
  return [];
}

void _vendaAttach(IsarCollection<dynamic> col, Id id, venda object) {
  object.id_venda = id;
}

extension vendaQueryWhereSort on QueryBuilder<venda, venda, QWhere> {
  QueryBuilder<venda, venda, QAfterWhere> anyId_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension vendaQueryWhere on QueryBuilder<venda, venda, QWhereClause> {
  QueryBuilder<venda, venda, QAfterWhereClause> id_vendaEqualTo(Id id_venda) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_venda,
        upper: id_venda,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterWhereClause> id_vendaNotEqualTo(
      Id id_venda) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_venda, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_venda, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_venda, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_venda, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<venda, venda, QAfterWhereClause> id_vendaGreaterThan(Id id_venda,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_venda, includeLower: include),
      );
    });
  }

  QueryBuilder<venda, venda, QAfterWhereClause> id_vendaLessThan(Id id_venda,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_venda, includeUpper: include),
      );
    });
  }

  QueryBuilder<venda, venda, QAfterWhereClause> id_vendaBetween(
    Id lowerId_venda,
    Id upperId_venda, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_venda,
        includeLower: includeLower,
        upper: upperId_venda,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension vendaQueryFilter on QueryBuilder<venda, venda, QFilterCondition> {
  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cpf_cnpj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cpf_cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cpf_cnpj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf_cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> cpf_cnpjIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cpf_cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> dataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> dataGreaterThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> dataLessThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> dataBetween(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> enviadoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> enviadoGreaterThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> enviadoLessThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> enviadoBetween(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaEqualTo(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaGreaterThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaLessThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaBetween(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaStartsWith(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaEndsWith(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> horaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> horaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> horaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> horaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hora',
        value: '',
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_caixaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_caixaGreaterThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_caixaLessThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_caixaBetween(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_colaboradorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_colaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_colaboradorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_colaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_colaboradorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_colaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_colaboradorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_colaborador',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_empresaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_empresaGreaterThan(
    int value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_empresaLessThan(
    int value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_empresaBetween(
    int lower,
    int upper, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_serie_nfceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_serie_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_serie_nfceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_serie_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_serie_nfceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_serie_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_serie_nfceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_serie_nfce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_usuarioEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_usuarioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_usuarioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_usuarioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_vendaEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> id_vendaGreaterThan(
    Id value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_vendaLessThan(
    Id value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_vendaBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_venda_servidorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda_servidor',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition>
      id_venda_servidorGreaterThan(
    int value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_venda_servidorLessThan(
    int value, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> id_venda_servidorBetween(
    int lower,
    int upper, {
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

  QueryBuilder<venda, venda, QAfterFilterCondition> statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_brutoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tot_bruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_brutoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tot_bruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_brutoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tot_bruto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_brutoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tot_bruto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_prcEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tot_desc_prc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_prcGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tot_desc_prc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_prcLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tot_desc_prc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_prcBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tot_desc_prc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_vlrEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tot_desc_vlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_vlrGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tot_desc_vlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_vlrLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tot_desc_vlr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_desc_vlrBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tot_desc_vlr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_liquidoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tot_liquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_liquidoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tot_liquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_liquidoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tot_liquido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> tot_liquidoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tot_liquido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> valor_trocoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_troco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> valor_trocoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_troco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> valor_trocoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_troco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda, venda, QAfterFilterCondition> valor_trocoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_troco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension vendaQueryObject on QueryBuilder<venda, venda, QFilterCondition> {}

extension vendaQueryLinks on QueryBuilder<venda, venda, QFilterCondition> {}

extension vendaQuerySortBy on QueryBuilder<venda, venda, QSortBy> {
  QueryBuilder<venda, venda, QAfterSortBy> sortByCpf_cnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf_cnpj', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByCpf_cnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf_cnpj', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_serie_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_serie_nfce', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_serie_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_serie_nfce', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortById_venda_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_brutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_desc_prc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_prc', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_desc_prcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_prc', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_desc_vlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_vlr', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_desc_vlrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_vlr', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_liquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_liquido', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByTot_liquidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_liquido', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByValor_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_troco', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> sortByValor_trocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_troco', Sort.desc);
    });
  }
}

extension vendaQuerySortThenBy on QueryBuilder<venda, venda, QSortThenBy> {
  QueryBuilder<venda, venda, QAfterSortBy> thenByCpf_cnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf_cnpj', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByCpf_cnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf_cnpj', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hora', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_serie_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_serie_nfce', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_serie_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_serie_nfce', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenById_venda_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda_servidor', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_brutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_desc_prc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_prc', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_desc_prcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_prc', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_desc_vlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_vlr', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_desc_vlrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_desc_vlr', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_liquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_liquido', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByTot_liquidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_liquido', Sort.desc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByValor_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_troco', Sort.asc);
    });
  }

  QueryBuilder<venda, venda, QAfterSortBy> thenByValor_trocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_troco', Sort.desc);
    });
  }
}

extension vendaQueryWhereDistinct on QueryBuilder<venda, venda, QDistinct> {
  QueryBuilder<venda, venda, QDistinct> distinctByCpf_cnpj(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cpf_cnpj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByHora(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hora', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_colaborador');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_serie_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_serie_nfce');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_usuario');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctById_venda_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda_servidor');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tot_bruto');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByTot_desc_prc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tot_desc_prc');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByTot_desc_vlr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tot_desc_vlr');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByTot_liquido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tot_liquido');
    });
  }

  QueryBuilder<venda, venda, QDistinct> distinctByValor_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_troco');
    });
  }
}

extension vendaQueryProperty on QueryBuilder<venda, venda, QQueryProperty> {
  QueryBuilder<venda, int, QQueryOperations> id_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda');
    });
  }

  QueryBuilder<venda, String, QQueryOperations> cpf_cnpjProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cpf_cnpj');
    });
  }

  QueryBuilder<venda, DateTime, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<venda, String, QQueryOperations> horaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hora');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_colaboradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_colaborador');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_serie_nfceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_serie_nfce');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_usuario');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> id_venda_servidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda_servidor');
    });
  }

  QueryBuilder<venda, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<venda, double, QQueryOperations> tot_brutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tot_bruto');
    });
  }

  QueryBuilder<venda, double, QQueryOperations> tot_desc_prcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tot_desc_prc');
    });
  }

  QueryBuilder<venda, double, QQueryOperations> tot_desc_vlrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tot_desc_vlr');
    });
  }

  QueryBuilder<venda, double, QQueryOperations> tot_liquidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tot_liquido');
    });
  }

  QueryBuilder<venda, double, QQueryOperations> valor_trocoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_troco');
    });
  }
}
