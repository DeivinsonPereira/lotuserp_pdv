// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_logado.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUsuarioLogadoCollection on Isar {
  IsarCollection<UsuarioLogado> get usuarioLogados => this.collection();
}

const UsuarioLogadoSchema = CollectionSchema(
  name: r'UsuarioLogado',
  id: 318919432229487554,
  properties: {
    r'idColaborador': PropertySchema(
      id: 0,
      name: r'idColaborador',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 1,
      name: r'login',
      type: IsarType.string,
    )
  },
  estimateSize: _usuarioLogadoEstimateSize,
  serialize: _usuarioLogadoSerialize,
  deserialize: _usuarioLogadoDeserialize,
  deserializeProp: _usuarioLogadoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _usuarioLogadoGetId,
  getLinks: _usuarioLogadoGetLinks,
  attach: _usuarioLogadoAttach,
  version: '3.1.0+1',
);

int _usuarioLogadoEstimateSize(
  UsuarioLogado object,
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

void _usuarioLogadoSerialize(
  UsuarioLogado object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.idColaborador);
  writer.writeString(offsets[1], object.login);
}

UsuarioLogado _usuarioLogadoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UsuarioLogado();
  object.id = id;
  object.idColaborador = reader.readLongOrNull(offsets[0]);
  object.login = reader.readStringOrNull(offsets[1]);
  return object;
}

P _usuarioLogadoDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuarioLogadoGetId(UsuarioLogado object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuarioLogadoGetLinks(UsuarioLogado object) {
  return [];
}

void _usuarioLogadoAttach(
    IsarCollection<dynamic> col, Id id, UsuarioLogado object) {
  object.id = id;
}

extension UsuarioLogadoQueryWhereSort
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QWhere> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UsuarioLogadoQueryWhere
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QWhereClause> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterWhereClause> idBetween(
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

extension UsuarioLogadoQueryFilter
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QFilterCondition> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idColaborador',
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idColaborador',
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idColaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idColaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idColaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      idColaboradorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idColaborador',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
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

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterFilterCondition>
      loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }
}

extension UsuarioLogadoQueryObject
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QFilterCondition> {}

extension UsuarioLogadoQueryLinks
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QFilterCondition> {}

extension UsuarioLogadoQuerySortBy
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QSortBy> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy>
      sortByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.asc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy>
      sortByIdColaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.desc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }
}

extension UsuarioLogadoQuerySortThenBy
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QSortThenBy> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy>
      thenByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.asc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy>
      thenByIdColaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.desc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }
}

extension UsuarioLogadoQueryWhereDistinct
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QDistinct> {
  QueryBuilder<UsuarioLogado, UsuarioLogado, QDistinct>
      distinctByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idColaborador');
    });
  }

  QueryBuilder<UsuarioLogado, UsuarioLogado, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }
}

extension UsuarioLogadoQueryProperty
    on QueryBuilder<UsuarioLogado, UsuarioLogado, QQueryProperty> {
  QueryBuilder<UsuarioLogado, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UsuarioLogado, int?, QQueryOperations> idColaboradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idColaborador');
    });
  }

  QueryBuilder<UsuarioLogado, String?, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }
}
