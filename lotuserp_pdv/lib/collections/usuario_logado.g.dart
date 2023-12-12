// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'usuario_logado.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getusuario_logadoCollection on Isar {
  IsarCollection<usuario_logado> get usuario_logados => this.collection();
}

const Usuario_logadoSchema = CollectionSchema(
  name: r'usuario_logado',
  id: 356262191186710369,
  properties: {
    r'id_colaborador': PropertySchema(
      id: 0,
      name: r'id_colaborador',
      type: IsarType.long,
    ),
    r'id_user': PropertySchema(
      id: 1,
      name: r'id_user',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 2,
      name: r'login',
      type: IsarType.string,
    )
  },
  estimateSize: _usuario_logadoEstimateSize,
  serialize: _usuario_logadoSerialize,
  deserialize: _usuario_logadoDeserialize,
  deserializeProp: _usuario_logadoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _usuario_logadoGetId,
  getLinks: _usuario_logadoGetLinks,
  attach: _usuario_logadoAttach,
  version: '3.1.0+1',
);

int _usuario_logadoEstimateSize(
  usuario_logado object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.login;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _usuario_logadoSerialize(
  usuario_logado object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_colaborador);
  writer.writeLong(offsets[1], object.id_user);
  writer.writeString(offsets[2], object.login);
}

usuario_logado _usuario_logadoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = usuario_logado();
  object.id = id;
  object.id_colaborador = reader.readLongOrNull(offsets[0]);
  object.id_user = reader.readLongOrNull(offsets[1]);
  object.login = reader.readStringOrNull(offsets[2]);
  return object;
}

P _usuario_logadoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuario_logadoGetId(usuario_logado object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuario_logadoGetLinks(usuario_logado object) {
  return [];
}

void _usuario_logadoAttach(
    IsarCollection<dynamic> col, Id id, usuario_logado object) {
  object.id = id;
}

extension usuario_logadoQueryWhereSort
    on QueryBuilder<usuario_logado, usuario_logado, QWhere> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension usuario_logadoQueryWhere
    on QueryBuilder<usuario_logado, usuario_logado, QWhereClause> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idBetween(
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

extension usuario_logadoQueryFilter
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition> idBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_colaborador',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_colaborador',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_colaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorGreaterThan(
    int? value, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorLessThan(
    int? value, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_colaboradorBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_user',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_user',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_user',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_userBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_user',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'login',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }
}

extension usuario_logadoQueryObject
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {}

extension usuario_logadoQueryLinks
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {}

extension usuario_logadoQuerySortBy
    on QueryBuilder<usuario_logado, usuario_logado, QSortBy> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortById_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_user', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_user', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }
}

extension usuario_logadoQuerySortThenBy
    on QueryBuilder<usuario_logado, usuario_logado, QSortThenBy> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenById_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_user', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_userDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_user', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }
}

extension usuario_logadoQueryWhereDistinct
    on QueryBuilder<usuario_logado, usuario_logado, QDistinct> {
  QueryBuilder<usuario_logado, usuario_logado, QDistinct>
      distinctById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_colaborador');
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctById_user() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_user');
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }
}

extension usuario_logadoQueryProperty
    on QueryBuilder<usuario_logado, usuario_logado, QQueryProperty> {
  QueryBuilder<usuario_logado, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations>
      id_colaboradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_colaborador');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations> id_userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_user');
    });
  }

  QueryBuilder<usuario_logado, String?, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }
}
