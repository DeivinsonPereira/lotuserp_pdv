// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'admin_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getadmin_configCollection on Isar {
  IsarCollection<admin_config> get admin_configs => this.collection();
}

const Admin_configSchema = CollectionSchema(
  name: r'admin_config',
  id: -1184053705678588972,
  properties: {
    r'senha': PropertySchema(
      id: 0,
      name: r'senha',
      type: IsarType.long,
    )
  },
  estimateSize: _admin_configEstimateSize,
  serialize: _admin_configSerialize,
  deserialize: _admin_configDeserialize,
  deserializeProp: _admin_configDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _admin_configGetId,
  getLinks: _admin_configGetLinks,
  attach: _admin_configAttach,
  version: '3.1.0+1',
);

int _admin_configEstimateSize(
  admin_config object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _admin_configSerialize(
  admin_config object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.senha);
}

admin_config _admin_configDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = admin_config(
    senha: reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _admin_configDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _admin_configGetId(admin_config object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _admin_configGetLinks(admin_config object) {
  return [];
}

void _admin_configAttach(
    IsarCollection<dynamic> col, Id id, admin_config object) {
  object.id = id;
}

extension admin_configQueryWhereSort
    on QueryBuilder<admin_config, admin_config, QWhere> {
  QueryBuilder<admin_config, admin_config, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension admin_configQueryWhere
    on QueryBuilder<admin_config, admin_config, QWhereClause> {
  QueryBuilder<admin_config, admin_config, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<admin_config, admin_config, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterWhereClause> idBetween(
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

extension admin_configQueryFilter
    on QueryBuilder<admin_config, admin_config, QFilterCondition> {
  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> idBetween(
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

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> senhaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: value,
      ));
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition>
      senhaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senha',
        value: value,
      ));
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> senhaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senha',
        value: value,
      ));
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterFilterCondition> senhaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension admin_configQueryObject
    on QueryBuilder<admin_config, admin_config, QFilterCondition> {}

extension admin_configQueryLinks
    on QueryBuilder<admin_config, admin_config, QFilterCondition> {}

extension admin_configQuerySortBy
    on QueryBuilder<admin_config, admin_config, QSortBy> {
  QueryBuilder<admin_config, admin_config, QAfterSortBy> sortBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterSortBy> sortBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }
}

extension admin_configQuerySortThenBy
    on QueryBuilder<admin_config, admin_config, QSortThenBy> {
  QueryBuilder<admin_config, admin_config, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterSortBy> thenBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<admin_config, admin_config, QAfterSortBy> thenBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }
}

extension admin_configQueryWhereDistinct
    on QueryBuilder<admin_config, admin_config, QDistinct> {
  QueryBuilder<admin_config, admin_config, QDistinct> distinctBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senha');
    });
  }
}

extension admin_configQueryProperty
    on QueryBuilder<admin_config, admin_config, QQueryProperty> {
  QueryBuilder<admin_config, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<admin_config, int, QQueryOperations> senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senha');
    });
  }
}
