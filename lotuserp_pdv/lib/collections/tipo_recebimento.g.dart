// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_recebimento.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Gettipo_recebimentoCollection on Isar {
  IsarCollection<tipo_recebimento> get tipo_recebimentos => this.collection();
}

const Tipo_recebimentoSchema = CollectionSchema(
  name: r'tipo_recebimento',
  id: -2134685233180921383,
  properties: {
    r'cortesia': PropertySchema(
      id: 0,
      name: r'cortesia',
      type: IsarType.long,
    ),
    r'descricao': PropertySchema(
      id: 1,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'id_empresa': PropertySchema(
      id: 2,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_fpagto': PropertySchema(
      id: 3,
      name: r'id_fpagto',
      type: IsarType.long,
    ),
    r'id_pcontas': PropertySchema(
      id: 4,
      name: r'id_pcontas',
      type: IsarType.long,
    ),
    r'imp_comprovante': PropertySchema(
      id: 5,
      name: r'imp_comprovante',
      type: IsarType.long,
    ),
    r'listar_pdv': PropertySchema(
      id: 6,
      name: r'listar_pdv',
      type: IsarType.long,
    ),
    r'obrigar_nfce': PropertySchema(
      id: 7,
      name: r'obrigar_nfce',
      type: IsarType.long,
    ),
    r'permite_troco': PropertySchema(
      id: 8,
      name: r'permite_troco',
      type: IsarType.long,
    ),
    r'pix_integrado': PropertySchema(
      id: 9,
      name: r'pix_integrado',
      type: IsarType.long,
    ),
    r'solicitar_senha': PropertySchema(
      id: 10,
      name: r'solicitar_senha',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.long,
    ),
    r'tef': PropertySchema(
      id: 12,
      name: r'tef',
      type: IsarType.long,
    ),
    r'tipo_forma': PropertySchema(
      id: 13,
      name: r'tipo_forma',
      type: IsarType.long,
    )
  },
  estimateSize: _tipo_recebimentoEstimateSize,
  serialize: _tipo_recebimentoSerialize,
  deserialize: _tipo_recebimentoDeserialize,
  deserializeProp: _tipo_recebimentoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tipo_recebimentoGetId,
  getLinks: _tipo_recebimentoGetLinks,
  attach: _tipo_recebimentoAttach,
  version: '3.1.0+1',
);

int _tipo_recebimentoEstimateSize(
  tipo_recebimento object,
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
  return bytesCount;
}

void _tipo_recebimentoSerialize(
  tipo_recebimento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cortesia);
  writer.writeString(offsets[1], object.descricao);
  writer.writeLong(offsets[2], object.id_empresa);
  writer.writeLong(offsets[3], object.id_fpagto);
  writer.writeLong(offsets[4], object.id_pcontas);
  writer.writeLong(offsets[5], object.imp_comprovante);
  writer.writeLong(offsets[6], object.listar_pdv);
  writer.writeLong(offsets[7], object.obrigar_nfce);
  writer.writeLong(offsets[8], object.permite_troco);
  writer.writeLong(offsets[9], object.pix_integrado);
  writer.writeLong(offsets[10], object.solicitar_senha);
  writer.writeLong(offsets[11], object.status);
  writer.writeLong(offsets[12], object.tef);
  writer.writeLong(offsets[13], object.tipo_forma);
}

tipo_recebimento _tipo_recebimentoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = tipo_recebimento(
    id,
    reader.readLongOrNull(offsets[2]),
    reader.readStringOrNull(offsets[1]),
    reader.readLongOrNull(offsets[8]),
    reader.readLongOrNull(offsets[13]),
    reader.readLongOrNull(offsets[11]),
    reader.readLongOrNull(offsets[6]),
    reader.readLongOrNull(offsets[4]),
    reader.readLongOrNull(offsets[12]),
    reader.readLongOrNull(offsets[3]),
    reader.readLongOrNull(offsets[9]),
    reader.readLongOrNull(offsets[5]),
    reader.readLongOrNull(offsets[0]),
    reader.readLongOrNull(offsets[7]),
    reader.readLongOrNull(offsets[10]),
  );
  return object;
}

P _tipo_recebimentoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tipo_recebimentoGetId(tipo_recebimento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tipo_recebimentoGetLinks(tipo_recebimento object) {
  return [];
}

void _tipo_recebimentoAttach(
    IsarCollection<dynamic> col, Id id, tipo_recebimento object) {
  object.id = id;
}

extension tipo_recebimentoQueryWhereSort
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QWhere> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension tipo_recebimentoQueryWhere
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QWhereClause> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterWhereClause> idBetween(
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

extension tipo_recebimentoQueryFilter
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QFilterCondition> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cortesia',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cortesia',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cortesia',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cortesia',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cortesia',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      cortesiaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cortesia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoEqualTo(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoLessThan(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoBetween(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoEndsWith(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_empresaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_fpagto',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_fpagto',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_fpagto',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_fpagto',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_fpagto',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_fpagtoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_fpagto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_pcontas',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_pcontas',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_pcontas',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_pcontas',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_pcontas',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      id_pcontasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_pcontas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imp_comprovante',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imp_comprovante',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imp_comprovante',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imp_comprovante',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imp_comprovante',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      imp_comprovanteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imp_comprovante',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'listar_pdv',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'listar_pdv',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listar_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listar_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listar_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      listar_pdvBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listar_pdv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'obrigar_nfce',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'obrigar_nfce',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obrigar_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'obrigar_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'obrigar_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      obrigar_nfceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'obrigar_nfce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'permite_troco',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'permite_troco',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permite_troco',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permite_troco',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permite_troco',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      permite_trocoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permite_troco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pix_integrado',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pix_integrado',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pix_integrado',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pix_integrado',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pix_integrado',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      pix_integradoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pix_integrado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'solicitar_senha',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'solicitar_senha',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'solicitar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'solicitar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'solicitar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      solicitar_senhaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'solicitar_senha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      statusBetween(
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

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tef',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tef',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tef',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tef',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tef',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tefBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipo_forma',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipo_forma',
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo_forma',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo_forma',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo_forma',
        value: value,
      ));
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterFilterCondition>
      tipo_formaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo_forma',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension tipo_recebimentoQueryObject
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QFilterCondition> {}

extension tipo_recebimentoQueryLinks
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QFilterCondition> {}

extension tipo_recebimentoQuerySortBy
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QSortBy> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByCortesia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cortesia', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByCortesiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cortesia', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_fpagto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_fpagto', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_fpagtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_fpagto', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_pcontas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_pcontas', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortById_pcontasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_pcontas', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByImp_comprovante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imp_comprovante', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByImp_comprovanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imp_comprovante', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByListar_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listar_pdv', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByListar_pdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listar_pdv', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByObrigar_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obrigar_nfce', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByObrigar_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obrigar_nfce', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByPermite_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permite_troco', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByPermite_trocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permite_troco', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByPix_integrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pix_integrado', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByPix_integradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pix_integrado', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortBySolicitar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'solicitar_senha', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortBySolicitar_senhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'solicitar_senha', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy> sortByTef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByTefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByTipo_forma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo_forma', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      sortByTipo_formaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo_forma', Sort.desc);
    });
  }
}

extension tipo_recebimentoQuerySortThenBy
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QSortThenBy> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByCortesia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cortesia', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByCortesiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cortesia', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_fpagto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_fpagto', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_fpagtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_fpagto', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_pcontas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_pcontas', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenById_pcontasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_pcontas', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByImp_comprovante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imp_comprovante', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByImp_comprovanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imp_comprovante', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByListar_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listar_pdv', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByListar_pdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listar_pdv', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByObrigar_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obrigar_nfce', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByObrigar_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obrigar_nfce', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByPermite_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permite_troco', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByPermite_trocoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permite_troco', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByPix_integrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pix_integrado', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByPix_integradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pix_integrado', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenBySolicitar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'solicitar_senha', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenBySolicitar_senhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'solicitar_senha', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy> thenByTef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByTefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tef', Sort.desc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByTipo_forma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo_forma', Sort.asc);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QAfterSortBy>
      thenByTipo_formaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo_forma', Sort.desc);
    });
  }
}

extension tipo_recebimentoQueryWhereDistinct
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct> {
  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByCortesia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cortesia');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByDescricao({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctById_fpagto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_fpagto');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctById_pcontas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_pcontas');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByImp_comprovante() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imp_comprovante');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByListar_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listar_pdv');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByObrigar_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obrigar_nfce');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByPermite_troco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permite_troco');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByPix_integrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pix_integrado');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctBySolicitar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'solicitar_senha');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct> distinctByTef() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tef');
    });
  }

  QueryBuilder<tipo_recebimento, tipo_recebimento, QDistinct>
      distinctByTipo_forma() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo_forma');
    });
  }
}

extension tipo_recebimentoQueryProperty
    on QueryBuilder<tipo_recebimento, tipo_recebimento, QQueryProperty> {
  QueryBuilder<tipo_recebimento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> cortesiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cortesia');
    });
  }

  QueryBuilder<tipo_recebimento, String?, QQueryOperations>
      descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> id_fpagtoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_fpagto');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> id_pcontasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_pcontas');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations>
      imp_comprovanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imp_comprovante');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> listar_pdvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listar_pdv');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations>
      obrigar_nfceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obrigar_nfce');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations>
      permite_trocoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permite_troco');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations>
      pix_integradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pix_integrado');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations>
      solicitar_senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'solicitar_senha');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> tefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tef');
    });
  }

  QueryBuilder<tipo_recebimento, int?, QQueryOperations> tipo_formaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo_forma');
    });
  }
}
