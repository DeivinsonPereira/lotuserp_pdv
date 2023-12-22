// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'venda_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

// ignore: camel_case_extensions
extension Getvenda_itemCollection on Isar {
  IsarCollection<venda_item> get venda_items => this.collection();
}

const Venda_itemSchema = CollectionSchema(
  name: r'venda_item',
  id: -2597354827828582956,
  properties: {
    r'grade': PropertySchema(
      id: 0,
      name: r'grade',
      type: IsarType.string,
    ),
    r'id_produto': PropertySchema(
      id: 1,
      name: r'id_produto',
      type: IsarType.long,
    ),
    r'id_venda': PropertySchema(
      id: 2,
      name: r'id_venda',
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
    r'tot_bruto': PropertySchema(
      id: 5,
      name: r'tot_bruto',
      type: IsarType.double,
    ),
    r'vlr_vendido': PropertySchema(
      id: 6,
      name: r'vlr_vendido',
      type: IsarType.double,
    )
  },
  estimateSize: _venda_itemEstimateSize,
  serialize: _venda_itemSerialize,
  deserialize: _venda_itemDeserialize,
  deserializeProp: _venda_itemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _venda_itemGetId,
  getLinks: _venda_itemGetLinks,
  attach: _venda_itemAttach,
  version: '3.1.0+1',
);

int _venda_itemEstimateSize(
  venda_item object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.grade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _venda_itemSerialize(
  venda_item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.grade);
  writer.writeLong(offsets[1], object.id_produto);
  writer.writeLong(offsets[2], object.id_venda);
  writer.writeLong(offsets[3], object.item);
  writer.writeDouble(offsets[4], object.qtde);
  writer.writeDouble(offsets[5], object.tot_bruto);
  writer.writeDouble(offsets[6], object.vlr_vendido);
}

venda_item _venda_itemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = venda_item();
  object.grade = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.id_produto = reader.readLong(offsets[1]);
  object.id_venda = reader.readLong(offsets[2]);
  object.item = reader.readLong(offsets[3]);
  object.qtde = reader.readDoubleOrNull(offsets[4]);
  object.tot_bruto = reader.readDoubleOrNull(offsets[5]);
  object.vlr_vendido = reader.readDoubleOrNull(offsets[6]);
  return object;
}

P _venda_itemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _venda_itemGetId(venda_item object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _venda_itemGetLinks(venda_item object) {
  return [];
}

void _venda_itemAttach(IsarCollection<dynamic> col, Id id, venda_item object) {
  object.id = id;
}

extension venda_itemQueryWhereSort
    on QueryBuilder<venda_item, venda_item, QWhere> {
  QueryBuilder<venda_item, venda_item, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension venda_itemQueryWhere
    on QueryBuilder<venda_item, venda_item, QWhereClause> {
  QueryBuilder<venda_item, venda_item, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<venda_item, venda_item, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterWhereClause> idBetween(
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

extension venda_itemQueryFilter
    on QueryBuilder<venda_item, venda_item, QFilterCondition> {
  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeEqualTo(
    String? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeGreaterThan(
    String? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeLessThan(
    String? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeStartsWith(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeEndsWith(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeContains(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeMatches(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> idBetween(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> id_produtoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      id_produtoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      id_produtoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> id_produtoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_produto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> id_vendaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_venda',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> id_vendaLessThan(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> id_vendaBetween(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> itemEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> itemGreaterThan(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> itemLessThan(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> itemBetween(
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtde',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtde',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeEqualTo(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeGreaterThan(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeLessThan(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> qtdeBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      tot_brutoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tot_bruto',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      tot_brutoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tot_bruto',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> tot_brutoEqualTo(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      tot_brutoGreaterThan(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> tot_brutoLessThan(
    double? value, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition> tot_brutoBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vlr_vendido',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vlr_vendido',
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vlr_vendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vlr_vendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vlr_vendido',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterFilterCondition>
      vlr_vendidoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vlr_vendido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension venda_itemQueryObject
    on QueryBuilder<venda_item, venda_item, QFilterCondition> {}

extension venda_itemQueryLinks
    on QueryBuilder<venda_item, venda_item, QFilterCondition> {}

extension venda_itemQuerySortBy
    on QueryBuilder<venda_item, venda_item, QSortBy> {
  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortById_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortById_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByTot_brutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByVlr_vendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlr_vendido', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> sortByVlr_vendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlr_vendido', Sort.desc);
    });
  }
}

extension venda_itemQuerySortThenBy
    on QueryBuilder<venda_item, venda_item, QSortThenBy> {
  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenById_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenById_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenById_vendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_venda', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByQtdeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtde', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByTot_brutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tot_bruto', Sort.desc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByVlr_vendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlr_vendido', Sort.asc);
    });
  }

  QueryBuilder<venda_item, venda_item, QAfterSortBy> thenByVlr_vendidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vlr_vendido', Sort.desc);
    });
  }
}

extension venda_itemQueryWhereDistinct
    on QueryBuilder<venda_item, venda_item, QDistinct> {
  QueryBuilder<venda_item, venda_item, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctById_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_produto');
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctById_venda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_venda');
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item');
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctByQtde() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtde');
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctByTot_bruto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tot_bruto');
    });
  }

  QueryBuilder<venda_item, venda_item, QDistinct> distinctByVlr_vendido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vlr_vendido');
    });
  }
}

extension venda_itemQueryProperty
    on QueryBuilder<venda_item, venda_item, QQueryProperty> {
  QueryBuilder<venda_item, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<venda_item, String?, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<venda_item, int, QQueryOperations> id_produtoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_produto');
    });
  }

  QueryBuilder<venda_item, int, QQueryOperations> id_vendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_venda');
    });
  }

  QueryBuilder<venda_item, int, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<venda_item, double?, QQueryOperations> qtdeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtde');
    });
  }

  QueryBuilder<venda_item, double?, QQueryOperations> tot_brutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tot_bruto');
    });
  }

  QueryBuilder<venda_item, double?, QQueryOperations> vlr_vendidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vlr_vendido');
    });
  }
}
