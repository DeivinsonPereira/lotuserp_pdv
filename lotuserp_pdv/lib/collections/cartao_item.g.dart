// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartao_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getcartao_itemCollection on Isar {
  IsarCollection<cartao_item> get cartao_items => this.collection();
}

const Cartao_itemSchema = CollectionSchema(
  name: r'cartao_item',
  id: -2206858244856811304,
  properties: {
    r'data_lanca': PropertySchema(
      id: 0,
      name: r'data_lanca',
      type: IsarType.dateTime,
    ),
    r'enviado': PropertySchema(
      id: 1,
      name: r'enviado',
      type: IsarType.long,
    ),
    r'id_autorizacao': PropertySchema(
      id: 2,
      name: r'id_autorizacao',
      type: IsarType.string,
    ),
    r'id_caixa': PropertySchema(
      id: 3,
      name: r'id_caixa',
      type: IsarType.long,
    ),
    r'id_empresa': PropertySchema(
      id: 4,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_usuario': PropertySchema(
      id: 5,
      name: r'id_usuario',
      type: IsarType.long,
    ),
    r'id_venda': PropertySchema(
      id: 6,
      name: r'id_venda',
      type: IsarType.long,
    ),
    r'imagem_comprovante': PropertySchema(
      id: 7,
      name: r'imagem_comprovante',
      type: IsarType.string,
    ),
    r'parc_qtde': PropertySchema(
      id: 8,
      name: r'parc_qtde',
      type: IsarType.long,
    ),
    r'valor_doc': PropertySchema(
      id: 9,
      name: r'valor_doc',
      type: IsarType.double,
    )
  },
  estimateSize: _cartao_itemEstimateSize,
  serialize: _cartao_itemSerialize,
  deserialize: _cartao_itemDeserialize,
  deserializeProp: _cartao_itemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cartao_itemGetId,
  getLinks: _cartao_itemGetLinks,
  attach: _cartao_itemAttach,
  version: '3.1.0+1',
);

int _cartao_itemEstimateSize(
  cartao_item object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id_autorizacao.length * 3;
  bytesCount += 3 + object.imagem_comprovante.length * 3;
  return bytesCount;
}

void _cartao_itemSerialize(
  cartao_item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.data_lanca);
  writer.writeLong(offsets[1], object.enviado);
  writer.writeString(offsets[2], object.id_autorizacao);
  writer.writeLong(offsets[3], object.id_caixa);
  writer.writeLong(offsets[4], object.id_empresa);
  writer.writeLong(offsets[5], object.id_usuario);
  writer.writeLong(offsets[6], object.id_venda);
  writer.writeString(offsets[7], object.imagem_comprovante);
  writer.writeLong(offsets[8], object.parc_qtde);
  writer.writeDouble(offsets[9], object.valor_doc);
}

cartao_item _cartao_itemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = cartao_item();
  object.data_lanca = reader.readDateTime(offsets[0]);
  object.enviado = reader.readLong(offsets[1]);
  object.id = id;
  object.id_autorizacao = reader.readString(offsets[2]);
  object.id_caixa = reader.readLong(offsets[3]);
  object.id_empresa = reader.readLong(offsets[4]);
  object.id_usuario = reader.readLong(offsets[5]);
  object.id_venda = reader.readLong(offsets[6]);
  object.imagem_comprovante = reader.readString(offsets[7]);
  object.parc_qtde = reader.readLong(offsets[8]);
  object.valor_doc = reader.readDouble(offsets[9]);
  return object;
}

P _cartao_itemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cartao_itemGetId(cartao_item object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartao_itemGetLinks(cartao_item object) {
  return [];
}

void _cartao_itemAttach(
    IsarCollection<dynamic> col, Id id, cartao_item object) {
  object.id = id;
}

extension cartao_itemQueryWhereSort
    on QueryBuilder<cartao_item, cartao_item, QWhere> {
  QueryBuilder<cartao_item, cartao_item, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension cartao_itemQueryWhere
    on QueryBuilder<cartao_item, cartao_item, QWhereClause> {
  QueryBuilder<cartao_item, cartao_item, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<cartao_item, cartao_item, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterWhereClause> idBetween(
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

extension cartao_itemQueryFilter
    on QueryBuilder<cartao_item, cartao_item, QFilterCondition> {
  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      data_lancaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_lanca',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      data_lancaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data_lanca',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      data_lancaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data_lanca',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      data_lancaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data_lanca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> enviadoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enviado',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> enviadoLessThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> enviadoBetween(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> idBetween(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_autorizacao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_autorizacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_autorizacao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_autorizacao',
        value: '',
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_autorizacaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_autorizacao',
        value: '',
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> id_caixaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> id_caixaBetween(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_empresaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_empresaGreaterThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_empresaLessThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_empresaBetween(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_usuarioEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_usuarioGreaterThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_usuarioLessThan(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_usuarioBetween(
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> id_vendaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_vendaGreaterThan(
    int value, {
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      id_vendaLessThan(
    int value, {
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition> id_vendaBetween(
    int lower,
    int upper, {
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

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagem_comprovante',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagem_comprovante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagem_comprovante',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagem_comprovante',
        value: '',
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      imagem_comprovanteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagem_comprovante',
        value: '',
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      parc_qtdeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parc_qtde',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      parc_qtdeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parc_qtde',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      parc_qtdeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parc_qtde',
        value: value,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      parc_qtdeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parc_qtde',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      valor_docEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor_doc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      valor_docGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor_doc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      valor_docLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor_doc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterFilterCondition>
      valor_docBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor_doc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension cartao_itemQueryObject
    on QueryBuilder<cartao_item, cartao_item, QFilterCondition> {}

extension cartao_itemQueryLinks
    on QueryBuilder<cartao_item, cartao_item, QFilterCondition> {}

extension cartao_itemQuerySortBy
    on QueryBuilder<cartao_item, cartao_item, QSortBy> {
  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByData_lanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_lanca', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByData_lancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_lanca', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_autorizacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_autorizacao', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      sortById_autorizacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_autorizacao', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      sortByImagem_comprovante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagem_comprovante', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      sortByImagem_comprovanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagem_comprovante', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByParc_qtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parc_qtde', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByParc_qtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parc_qtde', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByValor_doc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_doc', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> sortByValor_docDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_doc', Sort.desc);
    });
  }
}

extension cartao_itemQuerySortThenBy
    on QueryBuilder<cartao_item, cartao_item, QSortThenBy> {
  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByData_lanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_lanca', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByData_lancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_lanca', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByEnviadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enviado', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_autorizacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_autorizacao', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      thenById_autorizacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_autorizacao', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_caixa', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      thenByImagem_comprovante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagem_comprovante', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy>
      thenByImagem_comprovanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagem_comprovante', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByParc_qtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parc_qtde', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByParc_qtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parc_qtde', Sort.desc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByValor_doc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_doc', Sort.asc);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QAfterSortBy> thenByValor_docDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor_doc', Sort.desc);
    });
  }
}

extension cartao_itemQueryWhereDistinct
    on QueryBuilder<cartao_item, cartao_item, QDistinct> {
  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctByData_lanca() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data_lanca');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctByEnviado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enviado');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctById_autorizacao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_autorizacao',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctById_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_caixa');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_usuario');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct>
      distinctByImagem_comprovante({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagem_comprovante',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctByParc_qtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parc_qtde');
    });
  }

  QueryBuilder<cartao_item, cartao_item, QDistinct> distinctByValor_doc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor_doc');
    });
  }
}

extension cartao_itemQueryProperty
    on QueryBuilder<cartao_item, cartao_item, QQueryProperty> {
  QueryBuilder<cartao_item, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<cartao_item, DateTime, QQueryOperations> data_lancaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data_lanca');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> enviadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enviado');
    });
  }

  QueryBuilder<cartao_item, String, QQueryOperations> id_autorizacaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_autorizacao');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> id_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_caixa');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> id_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_usuario');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> id_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda');
    });
  }

  QueryBuilder<cartao_item, String, QQueryOperations>
      imagem_comprovanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagem_comprovante');
    });
  }

  QueryBuilder<cartao_item, int, QQueryOperations> parc_qtdeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parc_qtde');
    });
  }

  QueryBuilder<cartao_item, double, QQueryOperations> valor_docProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor_doc');
    });
  }
}
