// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_printer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getdefault_printerCollection on Isar {
  IsarCollection<default_printer> get default_printers => this.collection();
}

const Default_printerSchema = CollectionSchema(
  name: r'default_printer',
  id: 3661428395851878425,
  properties: {
    r'address_printer_bluetooth': PropertySchema(
      id: 0,
      name: r'address_printer_bluetooth',
      type: IsarType.string,
    )
  },
  estimateSize: _default_printerEstimateSize,
  serialize: _default_printerSerialize,
  deserialize: _default_printerDeserialize,
  deserializeProp: _default_printerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _default_printerGetId,
  getLinks: _default_printerGetLinks,
  attach: _default_printerAttach,
  version: '3.1.0+1',
);

int _default_printerEstimateSize(
  default_printer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address_printer_bluetooth.length * 3;
  return bytesCount;
}

void _default_printerSerialize(
  default_printer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address_printer_bluetooth);
}

default_printer _default_printerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = default_printer();
  object.address_printer_bluetooth = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _default_printerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _default_printerGetId(default_printer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _default_printerGetLinks(default_printer object) {
  return [];
}

void _default_printerAttach(
    IsarCollection<dynamic> col, Id id, default_printer object) {
  object.id = id;
}

extension default_printerQueryWhereSort
    on QueryBuilder<default_printer, default_printer, QWhere> {
  QueryBuilder<default_printer, default_printer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension default_printerQueryWhere
    on QueryBuilder<default_printer, default_printer, QWhereClause> {
  QueryBuilder<default_printer, default_printer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterWhereClause>
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

  QueryBuilder<default_printer, default_printer, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterWhereClause> idBetween(
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

extension default_printerQueryFilter
    on QueryBuilder<default_printer, default_printer, QFilterCondition> {
  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address_printer_bluetooth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address_printer_bluetooth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address_printer_bluetooth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address_printer_bluetooth',
        value: '',
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      address_printer_bluetoothIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address_printer_bluetooth',
        value: '',
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
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

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
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

  QueryBuilder<default_printer, default_printer, QAfterFilterCondition>
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
}

extension default_printerQueryObject
    on QueryBuilder<default_printer, default_printer, QFilterCondition> {}

extension default_printerQueryLinks
    on QueryBuilder<default_printer, default_printer, QFilterCondition> {}

extension default_printerQuerySortBy
    on QueryBuilder<default_printer, default_printer, QSortBy> {
  QueryBuilder<default_printer, default_printer, QAfterSortBy>
      sortByAddress_printer_bluetooth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address_printer_bluetooth', Sort.asc);
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterSortBy>
      sortByAddress_printer_bluetoothDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address_printer_bluetooth', Sort.desc);
    });
  }
}

extension default_printerQuerySortThenBy
    on QueryBuilder<default_printer, default_printer, QSortThenBy> {
  QueryBuilder<default_printer, default_printer, QAfterSortBy>
      thenByAddress_printer_bluetooth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address_printer_bluetooth', Sort.asc);
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterSortBy>
      thenByAddress_printer_bluetoothDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address_printer_bluetooth', Sort.desc);
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<default_printer, default_printer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension default_printerQueryWhereDistinct
    on QueryBuilder<default_printer, default_printer, QDistinct> {
  QueryBuilder<default_printer, default_printer, QDistinct>
      distinctByAddress_printer_bluetooth({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address_printer_bluetooth',
          caseSensitive: caseSensitive);
    });
  }
}

extension default_printerQueryProperty
    on QueryBuilder<default_printer, default_printer, QQueryProperty> {
  QueryBuilder<default_printer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<default_printer, String, QQueryOperations>
      address_printer_bluetoothProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address_printer_bluetooth');
    });
  }
}
