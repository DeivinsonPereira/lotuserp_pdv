// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUsuarioCollection on Isar {
  IsarCollection<Usuario> get usuarios => this.collection();
}

const UsuarioSchema = CollectionSchema(
  name: r'Usuario',
  id: 2086545823229412462,
  properties: {
    r'idColaborador': PropertySchema(
      id: 0,
      name: r'idColaborador',
      type: IsarType.long,
    ),
    r'idUsuario': PropertySchema(
      id: 1,
      name: r'idUsuario',
      type: IsarType.long,
    ),
    r'idUsuarioGrupo': PropertySchema(
      id: 2,
      name: r'idUsuarioGrupo',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 3,
      name: r'login',
      type: IsarType.string,
    ),
    r'mobDashboard': PropertySchema(
      id: 4,
      name: r'mobDashboard',
      type: IsarType.long,
    ),
    r'pdvoffAuditoria': PropertySchema(
      id: 5,
      name: r'pdvoffAuditoria',
      type: IsarType.long,
    ),
    r'pdvoffCargasAtua': PropertySchema(
      id: 6,
      name: r'pdvoffCargasAtua',
      type: IsarType.long,
    ),
    r'pdvoffCargasIntegra': PropertySchema(
      id: 7,
      name: r'pdvoffCargasIntegra',
      type: IsarType.long,
    ),
    r'pdvoffCargasParametros': PropertySchema(
      id: 8,
      name: r'pdvoffCargasParametros',
      type: IsarType.long,
    ),
    r'pdvoffCxAbrir': PropertySchema(
      id: 9,
      name: r'pdvoffCxAbrir',
      type: IsarType.long,
    ),
    r'pdvoffCxFechar': PropertySchema(
      id: 10,
      name: r'pdvoffCxFechar',
      type: IsarType.long,
    ),
    r'pdvoffCxGerenciar': PropertySchema(
      id: 11,
      name: r'pdvoffCxGerenciar',
      type: IsarType.long,
    ),
    r'pdvoffCxListar': PropertySchema(
      id: 12,
      name: r'pdvoffCxListar',
      type: IsarType.long,
    ),
    r'pdvoffCxMov': PropertySchema(
      id: 13,
      name: r'pdvoffCxMov',
      type: IsarType.long,
    ),
    r'pdvoffEmpCad': PropertySchema(
      id: 14,
      name: r'pdvoffEmpCad',
      type: IsarType.long,
    ),
    r'pdvoffEmpSer': PropertySchema(
      id: 15,
      name: r'pdvoffEmpSer',
      type: IsarType.long,
    ),
    r'pdvoffFisOpera': PropertySchema(
      id: 16,
      name: r'pdvoffFisOpera',
      type: IsarType.long,
    ),
    r'pdvoffLogOpera': PropertySchema(
      id: 17,
      name: r'pdvoffLogOpera',
      type: IsarType.long,
    ),
    r'pdvoffPdv': PropertySchema(
      id: 18,
      name: r'pdvoffPdv',
      type: IsarType.long,
    ),
    r'pdvoffPessoas': PropertySchema(
      id: 19,
      name: r'pdvoffPessoas',
      type: IsarType.long,
    ),
    r'pdvoffProduto': PropertySchema(
      id: 20,
      name: r'pdvoffProduto',
      type: IsarType.long,
    ),
    r'pdvoffRelVendas': PropertySchema(
      id: 21,
      name: r'pdvoffRelVendas',
      type: IsarType.long,
    ),
    r'pdvoffVendas': PropertySchema(
      id: 22,
      name: r'pdvoffVendas',
      type: IsarType.long,
    ),
    r'preFechamentocx': PropertySchema(
      id: 23,
      name: r'preFechamentocx',
      type: IsarType.long,
    ),
    r'retiradaCx': PropertySchema(
      id: 24,
      name: r'retiradaCx',
      type: IsarType.long,
    ),
    r'senha': PropertySchema(
      id: 25,
      name: r'senha',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 26,
      name: r'status',
      type: IsarType.long,
    ),
    r'vendDescPerc': PropertySchema(
      id: 27,
      name: r'vendDescPerc',
      type: IsarType.double,
    ),
    r'vendExcluirItem': PropertySchema(
      id: 28,
      name: r'vendExcluirItem',
      type: IsarType.long,
    ),
    r'vendPdvOff': PropertySchema(
      id: 29,
      name: r'vendPdvOff',
      type: IsarType.long,
    ),
    r'vendaCancelar': PropertySchema(
      id: 30,
      name: r'vendaCancelar',
      type: IsarType.long,
    )
  },
  estimateSize: _usuarioEstimateSize,
  serialize: _usuarioSerialize,
  deserialize: _usuarioDeserialize,
  deserializeProp: _usuarioDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _usuarioGetId,
  getLinks: _usuarioGetLinks,
  attach: _usuarioAttach,
  version: '3.1.0+1',
);

int _usuarioEstimateSize(
  Usuario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.login.length * 3;
  bytesCount += 3 + object.senha.length * 3;
  return bytesCount;
}

void _usuarioSerialize(
  Usuario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.idColaborador);
  writer.writeLong(offsets[1], object.idUsuario);
  writer.writeLong(offsets[2], object.idUsuarioGrupo);
  writer.writeString(offsets[3], object.login);
  writer.writeLong(offsets[4], object.mobDashboard);
  writer.writeLong(offsets[5], object.pdvoffAuditoria);
  writer.writeLong(offsets[6], object.pdvoffCargasAtua);
  writer.writeLong(offsets[7], object.pdvoffCargasIntegra);
  writer.writeLong(offsets[8], object.pdvoffCargasParametros);
  writer.writeLong(offsets[9], object.pdvoffCxAbrir);
  writer.writeLong(offsets[10], object.pdvoffCxFechar);
  writer.writeLong(offsets[11], object.pdvoffCxGerenciar);
  writer.writeLong(offsets[12], object.pdvoffCxListar);
  writer.writeLong(offsets[13], object.pdvoffCxMov);
  writer.writeLong(offsets[14], object.pdvoffEmpCad);
  writer.writeLong(offsets[15], object.pdvoffEmpSer);
  writer.writeLong(offsets[16], object.pdvoffFisOpera);
  writer.writeLong(offsets[17], object.pdvoffLogOpera);
  writer.writeLong(offsets[18], object.pdvoffPdv);
  writer.writeLong(offsets[19], object.pdvoffPessoas);
  writer.writeLong(offsets[20], object.pdvoffProduto);
  writer.writeLong(offsets[21], object.pdvoffRelVendas);
  writer.writeLong(offsets[22], object.pdvoffVendas);
  writer.writeLong(offsets[23], object.preFechamentocx);
  writer.writeLong(offsets[24], object.retiradaCx);
  writer.writeString(offsets[25], object.senha);
  writer.writeLong(offsets[26], object.status);
  writer.writeDouble(offsets[27], object.vendDescPerc);
  writer.writeLong(offsets[28], object.vendExcluirItem);
  writer.writeLong(offsets[29], object.vendPdvOff);
  writer.writeLong(offsets[30], object.vendaCancelar);
}

Usuario _usuarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Usuario(
    reader.readLong(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readLong(offsets[0]),
    reader.readString(offsets[3]),
    reader.readString(offsets[25]),
    reader.readLong(offsets[26]),
    reader.readDouble(offsets[27]),
    reader.readLong(offsets[28]),
    reader.readLong(offsets[29]),
    reader.readLong(offsets[24]),
    reader.readLong(offsets[23]),
    reader.readLong(offsets[30]),
    reader.readLong(offsets[19]),
    reader.readLong(offsets[14]),
    reader.readLong(offsets[15]),
    reader.readLong(offsets[9]),
    reader.readLong(offsets[13]),
    reader.readLong(offsets[12]),
    reader.readLong(offsets[11]),
    reader.readLong(offsets[10]),
    reader.readLong(offsets[16]),
    reader.readLong(offsets[18]),
    reader.readLong(offsets[22]),
    reader.readLong(offsets[21]),
    reader.readLong(offsets[17]),
    reader.readLong(offsets[5]),
    reader.readLong(offsets[6]),
    reader.readLong(offsets[7]),
    reader.readLong(offsets[8]),
    reader.readLong(offsets[20]),
    reader.readLong(offsets[4]),
  );
  object.id = id;
  return object;
}

P _usuarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readLong(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuarioGetId(Usuario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuarioGetLinks(Usuario object) {
  return [];
}

void _usuarioAttach(IsarCollection<dynamic> col, Id id, Usuario object) {
  object.id = id;
}

extension UsuarioQueryWhereSort on QueryBuilder<Usuario, Usuario, QWhere> {
  QueryBuilder<Usuario, Usuario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UsuarioQueryWhere on QueryBuilder<Usuario, Usuario, QWhereClause> {
  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idBetween(
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

extension UsuarioQueryFilter
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {
  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idColaboradorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idColaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      idColaboradorGreaterThan(
    int value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idColaboradorLessThan(
    int value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idColaboradorBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUsuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioGrupoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUsuarioGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      idUsuarioGrupoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUsuarioGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioGrupoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUsuarioGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idUsuarioGrupoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUsuarioGrupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginEqualTo(
    String value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginGreaterThan(
    String value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginLessThan(
    String value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginStartsWith(
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginEndsWith(
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> mobDashboardEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobDashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> mobDashboardGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mobDashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> mobDashboardLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mobDashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> mobDashboardBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mobDashboard',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffAuditoriaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffAuditoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffAuditoriaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffAuditoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffAuditoriaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffAuditoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffAuditoriaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffAuditoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCargasAtuaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCargasAtua',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasAtuaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCargasAtua',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasAtuaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCargasAtua',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCargasAtuaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCargasAtua',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasIntegraEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCargasIntegra',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasIntegraGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCargasIntegra',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasIntegraLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCargasIntegra',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasIntegraBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCargasIntegra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasParametrosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCargasParametros',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasParametrosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCargasParametros',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasParametrosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCargasParametros',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCargasParametrosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCargasParametros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxAbrirEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCxAbrir',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxAbrirGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCxAbrir',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxAbrirLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCxAbrir',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxAbrirBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCxAbrir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxFecharEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCxFechar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxFecharGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCxFechar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxFecharLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCxFechar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxFecharBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCxFechar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxGerenciarEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCxGerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxGerenciarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCxGerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxGerenciarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCxGerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxGerenciarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCxGerenciar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxListarEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCxListar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffCxListarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCxListar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxListarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCxListar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxListarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCxListar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxMovEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffCxMov',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxMovGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffCxMov',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxMovLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffCxMov',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffCxMovBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffCxMov',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpCadEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffEmpCad',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpCadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffEmpCad',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpCadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffEmpCad',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpCadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffEmpCad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpSerEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffEmpSer',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpSerGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffEmpSer',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpSerLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffEmpSer',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffEmpSerBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffEmpSer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffFisOperaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffFisOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffFisOperaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffFisOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffFisOperaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffFisOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffFisOperaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffFisOpera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffLogOperaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffLogOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffLogOperaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffLogOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffLogOperaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffLogOpera',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffLogOperaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffLogOpera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPdvEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffPdv',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPdvGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffPdv',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPdvLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffPdv',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPdvBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffPdv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPessoasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffPessoas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffPessoasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffPessoas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPessoasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffPessoas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffPessoasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffPessoas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffProdutoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffProdutoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffProdutoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffProduto',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffProdutoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffProduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffRelVendasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffRelVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      pdvoffRelVendasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffRelVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffRelVendasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffRelVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffRelVendasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffRelVendas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffVendasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdvoffVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffVendasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdvoffVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffVendasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdvoffVendas',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> pdvoffVendasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdvoffVendas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> preFechamentocxEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preFechamentocx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      preFechamentocxGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preFechamentocx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> preFechamentocxLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preFechamentocx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> preFechamentocxBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preFechamentocx',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> retiradaCxEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retiradaCx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> retiradaCxGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retiradaCx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> retiradaCxLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retiradaCx',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> retiradaCxBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retiradaCx',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> senhaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> statusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> statusGreaterThan(
    int value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> statusLessThan(
    int value, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendDescPercEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendDescPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendDescPercGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendDescPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendDescPercLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendDescPerc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendDescPercBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendDescPerc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendExcluirItemEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendExcluirItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      vendExcluirItemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendExcluirItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendExcluirItemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendExcluirItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendExcluirItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendExcluirItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendPdvOffEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendPdvOff',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendPdvOffGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendPdvOff',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendPdvOffLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendPdvOff',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendPdvOffBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendPdvOff',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendaCancelarEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendaCancelar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition>
      vendaCancelarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendaCancelar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendaCancelarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendaCancelar',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> vendaCancelarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendaCancelar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UsuarioQueryObject
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {}

extension UsuarioQueryLinks
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {}

extension UsuarioQuerySortBy on QueryBuilder<Usuario, Usuario, QSortBy> {
  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdColaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdUsuarioGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuarioGrupo', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdUsuarioGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuarioGrupo', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByMobDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobDashboard', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByMobDashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobDashboard', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffAuditoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffAuditoria', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffAuditoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffAuditoria', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCargasAtua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasAtua', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCargasAtuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasAtua', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCargasIntegra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasIntegra', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCargasIntegraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasIntegra', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCargasParametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasParametros', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy>
      sortByPdvoffCargasParametrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasParametros', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxAbrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxAbrir', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxAbrirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxAbrir', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxFechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxFechar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxFecharDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxFechar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxGerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxGerenciar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxGerenciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxGerenciar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxListar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxListar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxListarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxListar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxMov() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxMov', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffCxMovDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxMov', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffEmpCad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpCad', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffEmpCadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpCad', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffEmpSer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpSer', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffEmpSerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpSer', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffFisOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffFisOpera', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffFisOperaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffFisOpera', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffLogOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffLogOpera', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffLogOperaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffLogOpera', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffPdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPdv', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffPdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPdv', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffPessoas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPessoas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffPessoasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPessoas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffProduto', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffProduto', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffRelVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffRelVendas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffRelVendasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffRelVendas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffVendas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPdvoffVendasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffVendas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPreFechamentocx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preFechamentocx', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPreFechamentocxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preFechamentocx', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByRetiradaCx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retiradaCx', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByRetiradaCxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retiradaCx', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendDescPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendDescPerc', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendDescPercDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendDescPerc', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendExcluirItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendExcluirItem', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendExcluirItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendExcluirItem', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendPdvOff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendPdvOff', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendPdvOffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendPdvOff', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendaCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaCancelar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByVendaCancelarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaCancelar', Sort.desc);
    });
  }
}

extension UsuarioQuerySortThenBy
    on QueryBuilder<Usuario, Usuario, QSortThenBy> {
  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdColaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idColaborador', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdUsuarioGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuarioGrupo', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdUsuarioGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuarioGrupo', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByMobDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobDashboard', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByMobDashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobDashboard', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffAuditoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffAuditoria', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffAuditoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffAuditoria', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCargasAtua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasAtua', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCargasAtuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasAtua', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCargasIntegra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasIntegra', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCargasIntegraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasIntegra', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCargasParametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasParametros', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy>
      thenByPdvoffCargasParametrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCargasParametros', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxAbrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxAbrir', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxAbrirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxAbrir', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxFechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxFechar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxFecharDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxFechar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxGerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxGerenciar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxGerenciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxGerenciar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxListar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxListar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxListarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxListar', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxMov() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxMov', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffCxMovDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffCxMov', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffEmpCad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpCad', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffEmpCadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpCad', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffEmpSer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpSer', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffEmpSerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffEmpSer', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffFisOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffFisOpera', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffFisOperaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffFisOpera', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffLogOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffLogOpera', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffLogOperaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffLogOpera', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffPdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPdv', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffPdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPdv', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffPessoas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPessoas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffPessoasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffPessoas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffProduto', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffProduto', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffRelVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffRelVendas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffRelVendasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffRelVendas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffVendas', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPdvoffVendasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdvoffVendas', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPreFechamentocx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preFechamentocx', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPreFechamentocxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preFechamentocx', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByRetiradaCx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retiradaCx', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByRetiradaCxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retiradaCx', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendDescPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendDescPerc', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendDescPercDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendDescPerc', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendExcluirItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendExcluirItem', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendExcluirItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendExcluirItem', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendPdvOff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendPdvOff', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendPdvOffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendPdvOff', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendaCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaCancelar', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByVendaCancelarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendaCancelar', Sort.desc);
    });
  }
}

extension UsuarioQueryWhereDistinct
    on QueryBuilder<Usuario, Usuario, QDistinct> {
  QueryBuilder<Usuario, Usuario, QDistinct> distinctByIdColaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idColaborador');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUsuario');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByIdUsuarioGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUsuarioGrupo');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByMobDashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mobDashboard');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffAuditoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffAuditoria');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCargasAtua() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCargasAtua');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCargasIntegra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCargasIntegra');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCargasParametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCargasParametros');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCxAbrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCxAbrir');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCxFechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCxFechar');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCxGerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCxGerenciar');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCxListar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCxListar');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffCxMov() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffCxMov');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffEmpCad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffEmpCad');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffEmpSer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffEmpSer');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffFisOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffFisOpera');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffLogOpera() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffLogOpera');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffPdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffPdv');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffPessoas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffPessoas');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffProduto');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffRelVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffRelVendas');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPdvoffVendas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdvoffVendas');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPreFechamentocx() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preFechamentocx');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByRetiradaCx() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retiradaCx');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctBySenha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByVendDescPerc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendDescPerc');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByVendExcluirItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendExcluirItem');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByVendPdvOff() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendPdvOff');
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByVendaCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendaCancelar');
    });
  }
}

extension UsuarioQueryProperty
    on QueryBuilder<Usuario, Usuario, QQueryProperty> {
  QueryBuilder<Usuario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> idColaboradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idColaborador');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> idUsuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUsuario');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> idUsuarioGrupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUsuarioGrupo');
    });
  }

  QueryBuilder<Usuario, String, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> mobDashboardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mobDashboard');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffAuditoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffAuditoria');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCargasAtuaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCargasAtua');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCargasIntegraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCargasIntegra');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations>
      pdvoffCargasParametrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCargasParametros');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCxAbrirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCxAbrir');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCxFecharProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCxFechar');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCxGerenciarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCxGerenciar');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCxListarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCxListar');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffCxMovProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffCxMov');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffEmpCadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffEmpCad');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffEmpSerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffEmpSer');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffFisOperaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffFisOpera');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffLogOperaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffLogOpera');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffPdvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffPdv');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffPessoasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffPessoas');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffProduto');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffRelVendasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffRelVendas');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> pdvoffVendasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdvoffVendas');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> preFechamentocxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preFechamentocx');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> retiradaCxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retiradaCx');
    });
  }

  QueryBuilder<Usuario, String, QQueryOperations> senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senha');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Usuario, double, QQueryOperations> vendDescPercProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendDescPerc');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> vendExcluirItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendExcluirItem');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> vendPdvOffProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendPdvOff');
    });
  }

  QueryBuilder<Usuario, int, QQueryOperations> vendaCancelarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendaCancelar');
    });
  }
}
