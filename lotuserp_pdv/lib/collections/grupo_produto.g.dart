// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_produto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGrupoProdutoCollection on Isar {
  IsarCollection<GrupoProduto> get grupoProdutos => this.collection();
}

const GrupoProdutoSchema = CollectionSchema(
  name: r'GrupoProduto',
  id: 7714444735369486504,
  properties: {
    r'fileImagem': PropertySchema(
      id: 0,
      name: r'fileImagem',
      type: IsarType.string,
    ),
    r'grupoDescricao': PropertySchema(
      id: 1,
      name: r'grupoDescricao',
      type: IsarType.string,
    ),
    r'idGrupo': PropertySchema(
      id: 2,
      name: r'idGrupo',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _grupoProdutoEstimateSize,
  serialize: _grupoProdutoSerialize,
  deserialize: _grupoProdutoDeserialize,
  deserializeProp: _grupoProdutoDeserializeProp,
  idName: r'idAutoincrement',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _grupoProdutoGetId,
  getLinks: _grupoProdutoGetLinks,
  attach: _grupoProdutoAttach,
  version: '3.1.0+1',
);

int _grupoProdutoEstimateSize(
  GrupoProduto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fileImagem;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grupoDescricao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _grupoProdutoSerialize(
  GrupoProduto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fileImagem);
  writer.writeString(offsets[1], object.grupoDescricao);
  writer.writeLong(offsets[2], object.idGrupo);
  writer.writeLong(offsets[3], object.status);
}

GrupoProduto _grupoProdutoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GrupoProduto(
    reader.readLong(offsets[2]),
    reader.readStringOrNull(offsets[1]),
    reader.readLongOrNull(offsets[3]),
    reader.readStringOrNull(offsets[0]),
  );
  object.idAutoincrement = id;
  return object;
}

P _grupoProdutoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _grupoProdutoGetId(GrupoProduto object) {
  return object.idAutoincrement;
}

List<IsarLinkBase<dynamic>> _grupoProdutoGetLinks(GrupoProduto object) {
  return [];
}

void _grupoProdutoAttach(
    IsarCollection<dynamic> col, Id id, GrupoProduto object) {
  object.idAutoincrement = id;
}

extension GrupoProdutoQueryWhereSort
    on QueryBuilder<GrupoProduto, GrupoProduto, QWhere> {
  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhere> anyIdAutoincrement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GrupoProdutoQueryWhere
    on QueryBuilder<GrupoProduto, GrupoProduto, QWhereClause> {
  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhereClause>
      idAutoincrementEqualTo(Id idAutoincrement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idAutoincrement,
        upper: idAutoincrement,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhereClause>
      idAutoincrementNotEqualTo(Id idAutoincrement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: idAutoincrement, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: idAutoincrement, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: idAutoincrement, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: idAutoincrement, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhereClause>
      idAutoincrementGreaterThan(Id idAutoincrement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(
            lower: idAutoincrement, includeLower: include),
      );
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhereClause>
      idAutoincrementLessThan(Id idAutoincrement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idAutoincrement, includeUpper: include),
      );
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterWhereClause>
      idAutoincrementBetween(
    Id lowerIdAutoincrement,
    Id upperIdAutoincrement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdAutoincrement,
        includeLower: includeLower,
        upper: upperIdAutoincrement,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GrupoProdutoQueryFilter
    on QueryBuilder<GrupoProduto, GrupoProduto, QFilterCondition> {
  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileImagem',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileImagem',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileImagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileImagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileImagem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileImagem',
        value: '',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      fileImagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileImagem',
        value: '',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grupoDescricao',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grupoDescricao',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupoDescricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupoDescricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupoDescricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoDescricao',
        value: '',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      grupoDescricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupoDescricao',
        value: '',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idAutoincrementEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAutoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idAutoincrementGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAutoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idAutoincrementLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAutoincrement',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idAutoincrementBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAutoincrement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idGrupoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idGrupoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idGrupoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      idGrupoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idGrupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
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

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition>
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

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterFilterCondition> statusBetween(
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

extension GrupoProdutoQueryObject
    on QueryBuilder<GrupoProduto, GrupoProduto, QFilterCondition> {}

extension GrupoProdutoQueryLinks
    on QueryBuilder<GrupoProduto, GrupoProduto, QFilterCondition> {}

extension GrupoProdutoQuerySortBy
    on QueryBuilder<GrupoProduto, GrupoProduto, QSortBy> {
  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> sortByFileImagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      sortByFileImagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      sortByGrupoDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoDescricao', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      sortByGrupoDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoDescricao', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> sortByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> sortByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension GrupoProdutoQuerySortThenBy
    on QueryBuilder<GrupoProduto, GrupoProduto, QSortThenBy> {
  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> thenByFileImagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      thenByFileImagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileImagem', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      thenByGrupoDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoDescricao', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      thenByGrupoDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoDescricao', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      thenByIdAutoincrement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAutoincrement', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy>
      thenByIdAutoincrementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAutoincrement', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> thenByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> thenByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension GrupoProdutoQueryWhereDistinct
    on QueryBuilder<GrupoProduto, GrupoProduto, QDistinct> {
  QueryBuilder<GrupoProduto, GrupoProduto, QDistinct> distinctByFileImagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileImagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QDistinct> distinctByGrupoDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupoDescricao',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QDistinct> distinctByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGrupo');
    });
  }

  QueryBuilder<GrupoProduto, GrupoProduto, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension GrupoProdutoQueryProperty
    on QueryBuilder<GrupoProduto, GrupoProduto, QQueryProperty> {
  QueryBuilder<GrupoProduto, int, QQueryOperations> idAutoincrementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAutoincrement');
    });
  }

  QueryBuilder<GrupoProduto, String?, QQueryOperations> fileImagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileImagem');
    });
  }

  QueryBuilder<GrupoProduto, String?, QQueryOperations>
      grupoDescricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupoDescricao');
    });
  }

  QueryBuilder<GrupoProduto, int, QQueryOperations> idGrupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGrupo');
    });
  }

  QueryBuilder<GrupoProduto, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
