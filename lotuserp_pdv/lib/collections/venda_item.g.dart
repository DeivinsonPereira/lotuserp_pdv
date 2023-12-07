// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVendaItemCollection on Isar {
  IsarCollection<VendaItem> get vendaItems => this.collection();
}

const VendaItemSchema = CollectionSchema(
  name: r'VendaItem',
  id: -4441565788783203714,
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
  estimateSize: _vendaItemEstimateSize,
  serialize: _vendaItemSerialize,
  deserialize: _vendaItemDeserialize,
  deserializeProp: _vendaItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vendaItemGetId,
  getLinks: _vendaItemGetLinks,
  attach: _vendaItemAttach,
  version: '3.1.0+1',
);

int _vendaItemEstimateSize(
  VendaItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.grade.length * 3;
  return bytesCount;
}

void _vendaItemSerialize(
  VendaItem object,
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

VendaItem _vendaItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VendaItem(
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

P _vendaItemDeserializeProp<P>(
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

Id _vendaItemGetId(VendaItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vendaItemGetLinks(VendaItem object) {
  return [];
}

void _vendaItemAttach(IsarCollection<dynamic> col, Id id, VendaItem object) {
  object.id = id;
}

extension VendaItemQueryWhereSort
    on QueryBuilder<VendaItem, VendaItem, QWhere> {
  QueryBuilder<VendaItem, VendaItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VendaItemQueryWhere
    on QueryBuilder<VendaItem, VendaItem, QWhereClause> {
  QueryBuilder<VendaItem, VendaItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VendaItem, VendaItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterWhereClause> idBetween(
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

extension VendaItemQueryFilter
    on QueryBuilder<VendaItem, VendaItem, QFilterCondition> {
  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeEqualTo(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeStartsWith(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeEndsWith(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idProdutoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition>
      idProdutoGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idProdutoLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idProdutoBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idVendaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idVenda',
        value: value,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idVendaGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idVendaLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> idVendaBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> itemEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> itemGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> itemLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> itemBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> qtdeEqualTo(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> qtdeGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> qtdeLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> qtdeBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> totBrutoEqualTo(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> totBrutoGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> totBrutoLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> totBrutoBetween(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> vlrVendidoEqualTo(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition>
      vlrVendidoGreaterThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> vlrVendidoLessThan(
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

  QueryBuilder<VendaItem, VendaItem, QAfterFilterCondition> vlrVendidoBetween(
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

extension VendaItemQueryObject
    on QueryBuilder<VendaItem, VendaItem, QFilterCondition> {}

extension VendaItemQueryLinks
    on QueryBuilder<VendaItem, VendaItem, QFilterCondition> {}

extension VendaItemQuerySortBy on QueryBuilder<VendaItem, VendaItem, QSortBy> {
  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> sortByVlrVendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.desc);
    });
  }
}

extension VendaItemQuerySortThenBy
    on QueryBuilder<VendaItem, VendaItem, QSortThenBy> {
  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByIdProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProduto', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByIdVendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idVenda', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByTotBrutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totBruto', Sort.desc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.asc);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QAfterSortBy> thenByVlrVendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlrVendido', Sort.desc);
    });
  }
}

extension VendaItemQueryWhereDistinct
    on QueryBuilder<VendaItem, VendaItem, QDistinct> {
  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByIdProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idProduto');
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByIdVenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idVenda');
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item');
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtde');
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByTotBruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totBruto');
    });
  }

  QueryBuilder<VendaItem, VendaItem, QDistinct> distinctByVlrVendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vlrVendido');
    });
  }
}

extension VendaItemQueryProperty
    on QueryBuilder<VendaItem, VendaItem, QQueryProperty> {
  QueryBuilder<VendaItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VendaItem, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<VendaItem, int, QQueryOperations> idProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idProduto');
    });
  }

  QueryBuilder<VendaItem, int, QQueryOperations> idVendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idVenda');
    });
  }

  QueryBuilder<VendaItem, int, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<VendaItem, double, QQueryOperations> qtdeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtde');
    });
  }

  QueryBuilder<VendaItem, double, QQueryOperations> totBrutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totBruto');
    });
  }

  QueryBuilder<VendaItem, double, QQueryOperations> vlrVendidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vlrVendido');
    });
  }
}
