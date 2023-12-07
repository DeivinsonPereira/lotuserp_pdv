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
    r'grade': PropertySchema(
      id: 0,
      name: r'grade',
      type: IsarType.string,
    ),
    r'idProduto': PropertySchema(
      id: 1,
      name: r'idProduto',
      type: IsarType.long,
    ),
    r'idVenda': PropertySchema(
      id: 2,
      name: r'idVenda',
      type: IsarType.long,
    ),
    r'item': PropertySchema(
      id: 3,
      name: r'item',
      type: IsarType.long,
    ),
    r'qtde': PropertySchema(
      id: 4,
      name: r'qtde',
      type: IsarType.double,
    ),
    r'totBruto': PropertySchema(
      id: 5,
      name: r'totBruto',
      type: IsarType.double,
    ),
    r'vlrVendido': PropertySchema(
      id: 6,
      name: r'vlrVendido',
      type: IsarType.double,
    )
  },
  estimateSize: _caixaEstimateSize,
  serialize: _caixaSerialize,
  deserialize: _caixaDeserialize,
  deserializeProp: _caixaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'caixaItens': LinkSchema(
      id: -6791512984431228201,
      name: r'caixaItens',
      target: r'CaixaItem',
      single: true,
    )
  },
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
  bytesCount += 3 + object.grade.length * 3;
  return bytesCount;
}

void _caixaSerialize(
  Caixa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.grade);
  writer.writeLong(offsets[1], object.idProduto);
  writer.writeLong(offsets[2], object.idVenda);
  writer.writeLong(offsets[3], object.item);
  writer.writeDouble(offsets[4], object.qtde);
  writer.writeDouble(offsets[5], object.totBruto);
  writer.writeDouble(offsets[6], object.vlrVendido);
}

Caixa _caixaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Caixa(
    reader.readLong(offsets[2]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[3]),
    reader.readDouble(offsets[6]),
    reader.readDouble(offsets[4]),
    reader.readDouble(offsets[5]),
    reader.readString(offsets[0]),
  );
  object.id = id;
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caixaGetId(Caixa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _caixaGetLinks(Caixa object) {
  return [object.caixaItens];
}

void _caixaAttach(IsarCollection<dynamic> col, Id id, Caixa object) {
  object.id = id;
  object.caixaItens
      .attach(col, col.isar.collection<CaixaItem>(), r'caixaItens', id);
}

extension CaixaQueryWhereSort on QueryBuilder<Caixa, Caixa, QWhere> {
  QueryBuilder<Caixa, Caixa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CaixaQueryWhere on QueryBuilder<Caixa, Caixa, QWhereClause> {
  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterWhereClause> idBetween(
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

extension CaixaQueryFilter on QueryBuilder<Caixa, Caixa, QFilterCondition> {
  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idProdutoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idProdutoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idProdutoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idProdutoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idProduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idVendaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idVendaGreaterThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idVendaLessThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> idVendaBetween(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> itemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> itemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> itemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> itemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'item',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> qtdeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtde',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> qtdeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtde',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> qtdeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtde',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> qtdeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtde',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> totBrutoEqualTo(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> totBrutoGreaterThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> totBrutoLessThan(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> totBrutoBetween(
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

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> vlrVendidoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vlrVendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> vlrVendidoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vlrVendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> vlrVendidoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vlrVendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> vlrVendidoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vlrVendido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CaixaQueryObject on QueryBuilder<Caixa, Caixa, QFilterCondition> {}

extension CaixaQueryLinks on QueryBuilder<Caixa, Caixa, QFilterCondition> {
  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> caixaItens(
      FilterQuery<CaixaItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'caixaItens');
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterFilterCondition> caixaItensIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'caixaItens', 0, true, 0, true);
    });
  }
}

extension CaixaQuerySortBy on QueryBuilder<Caixa, Caixa, QSortBy> {
  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> sortByVlrVendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.desc);
    });
  }
}

extension CaixaQuerySortThenBy on QueryBuilder<Caixa, Caixa, QSortThenBy> {
  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.asc);
    });
  }

  QueryBuilder<Caixa, Caixa, QAfterSortBy> thenByVlrVendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.desc);
    });
  }
}

extension CaixaQueryWhereDistinct on QueryBuilder<Caixa, Caixa, QDistinct> {
  QueryBuilder<Caixa, Caixa, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idProduto');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idVenda');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtde');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totBruto');
    });
  }

  QueryBuilder<Caixa, Caixa, QDistinct> distinctByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vlrVendido');
    });
  }
}

extension CaixaQueryProperty on QueryBuilder<Caixa, Caixa, QQueryProperty> {
  QueryBuilder<Caixa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Caixa, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> idProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idProduto');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> idVendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idVenda');
    });
  }

  QueryBuilder<Caixa, int, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<Caixa, double, QQueryOperations> qtdeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtde');
    });
  }

  QueryBuilder<Caixa, double, QQueryOperations> totBrutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totBruto');
    });
  }

  QueryBuilder<Caixa, double, QQueryOperations> vlrVendidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vlrVendido');
    });
  }
}
