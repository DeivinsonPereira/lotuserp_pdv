// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'usuario.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetusuarioCollection on Isar {
  IsarCollection<usuario> get usuarios => this.collection();
}

const UsuarioSchema = CollectionSchema(
  name: r'usuario',
  id: 5509211092415108114,
  properties: {
    r'administrador': PropertySchema(
      id: 0,
      name: r'administrador',
      type: IsarType.long,
    ),
    r'caixa_abrir': PropertySchema(
      id: 1,
      name: r'caixa_abrir',
      type: IsarType.long,
    ),
    r'caixa_carga': PropertySchema(
      id: 2,
      name: r'caixa_carga',
      type: IsarType.long,
    ),
    r'caixa_fechar': PropertySchema(
      id: 3,
      name: r'caixa_fechar',
      type: IsarType.long,
    ),
    r'caixa_gerenciar': PropertySchema(
      id: 4,
      name: r'caixa_gerenciar',
      type: IsarType.long,
    ),
    r'caixa_movimentar': PropertySchema(
      id: 5,
      name: r'caixa_movimentar',
      type: IsarType.long,
    ),
    r'caixa_parametros': PropertySchema(
      id: 6,
      name: r'caixa_parametros',
      type: IsarType.long,
    ),
    r'caixa_pdv': PropertySchema(
      id: 7,
      name: r'caixa_pdv',
      type: IsarType.long,
    ),
    r'id_colaborador': PropertySchema(
      id: 8,
      name: r'id_colaborador',
      type: IsarType.long,
    ),
    r'logar_empresas': PropertySchema(
      id: 9,
      name: r'logar_empresas',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 10,
      name: r'login',
      type: IsarType.string,
    ),
    r'mob_dashboard': PropertySchema(
      id: 11,
      name: r'mob_dashboard',
      type: IsarType.long,
    ),
    r'senha': PropertySchema(
      id: 12,
      name: r'senha',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.long,
    ),
    r'trocar_senha': PropertySchema(
      id: 14,
      name: r'trocar_senha',
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
  usuario object,
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
  {
    final value = object.senha;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _usuarioSerialize(
  usuario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.administrador);
  writer.writeLong(offsets[1], object.caixa_abrir);
  writer.writeLong(offsets[2], object.caixa_carga);
  writer.writeLong(offsets[3], object.caixa_fechar);
  writer.writeLong(offsets[4], object.caixa_gerenciar);
  writer.writeLong(offsets[5], object.caixa_movimentar);
  writer.writeLong(offsets[6], object.caixa_parametros);
  writer.writeLong(offsets[7], object.caixa_pdv);
  writer.writeLong(offsets[8], object.id_colaborador);
  writer.writeLong(offsets[9], object.logar_empresas);
  writer.writeString(offsets[10], object.login);
  writer.writeLong(offsets[11], object.mob_dashboard);
  writer.writeString(offsets[12], object.senha);
  writer.writeLong(offsets[13], object.status);
  writer.writeLong(offsets[14], object.trocar_senha);
}

usuario _usuarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = usuario(
    id,
    reader.readStringOrNull(offsets[10]),
    reader.readLongOrNull(offsets[8]),
    reader.readStringOrNull(offsets[12]),
    reader.readLongOrNull(offsets[13]),
    reader.readLongOrNull(offsets[11]),
    reader.readLongOrNull(offsets[14]),
    reader.readLongOrNull(offsets[0]),
    reader.readLongOrNull(offsets[9]),
    reader.readLongOrNull(offsets[1]),
    reader.readLongOrNull(offsets[5]),
    reader.readLongOrNull(offsets[4]),
    reader.readLongOrNull(offsets[3]),
    reader.readLongOrNull(offsets[7]),
    reader.readLongOrNull(offsets[2]),
    reader.readLongOrNull(offsets[6]),
  );
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
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
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
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuarioGetId(usuario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuarioGetLinks(usuario object) {
  return [];
}

void _usuarioAttach(IsarCollection<dynamic> col, Id id, usuario object) {
  object.id = id;
}

extension usuarioQueryWhereSort on QueryBuilder<usuario, usuario, QWhere> {
  QueryBuilder<usuario, usuario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension usuarioQueryWhere on QueryBuilder<usuario, usuario, QWhereClause> {
  QueryBuilder<usuario, usuario, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<usuario, usuario, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> idBetween(
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

extension usuarioQueryFilter
    on QueryBuilder<usuario, usuario, QFilterCondition> {
  QueryBuilder<usuario, usuario, QAfterFilterCondition> administradorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'administrador',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      administradorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'administrador',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> administradorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'administrador',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      administradorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'administrador',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> administradorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'administrador',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> administradorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'administrador',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_abrir',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_abrir',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_abrir',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_abrir',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_abrir',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_abrirBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_abrir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_carga',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_carga',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_carga',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_carga',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_carga',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_cargaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_carga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_fecharIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_fechar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_fecharIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_fechar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_fecharEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_fechar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_fecharGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_fechar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_fecharLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_fechar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_fecharBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_fechar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_gerenciarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_gerenciar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_gerenciarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_gerenciar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_gerenciarEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_gerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_gerenciarGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_gerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_gerenciarLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_gerenciar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_gerenciarBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_gerenciar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_movimentarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_movimentar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_movimentarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_movimentar',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_movimentarEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_movimentar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_movimentarGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_movimentar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_movimentarLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_movimentar',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_movimentarBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_movimentar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_parametrosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_parametros',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_parametrosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_parametros',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_parametrosEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_parametros',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_parametrosGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_parametros',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      caixa_parametrosLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_parametros',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_parametrosBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_parametros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caixa_pdv',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caixa_pdv',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caixa_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caixa_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caixa_pdv',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> caixa_pdvBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caixa_pdv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> idBetween(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_colaboradorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_colaborador',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_colaboradorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_colaborador',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_colaboradorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_colaborador',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_colaboradorLessThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_colaboradorBetween(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> logar_empresasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logar_empresas',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      logar_empresasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logar_empresas',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> logar_empresasEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logar_empresas',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      logar_empresasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logar_empresas',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> logar_empresasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logar_empresas',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> logar_empresasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logar_empresas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginEqualTo(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginGreaterThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginLessThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginBetween(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginStartsWith(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginEndsWith(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginContains(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginMatches(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> mob_dashboardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mob_dashboard',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      mob_dashboardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mob_dashboard',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> mob_dashboardEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mob_dashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      mob_dashboardGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mob_dashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> mob_dashboardLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mob_dashboard',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> mob_dashboardBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mob_dashboard',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaEqualTo(
    String? value, {
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaGreaterThan(
    String? value, {
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaLessThan(
    String? value, {
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaStartsWith(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaEndsWith(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaContains(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaMatches(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<usuario, usuario, QAfterFilterCondition> trocar_senhaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trocar_senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      trocar_senhaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trocar_senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> trocar_senhaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trocar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> trocar_senhaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trocar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> trocar_senhaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trocar_senha',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> trocar_senhaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trocar_senha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension usuarioQueryObject
    on QueryBuilder<usuario, usuario, QFilterCondition> {}

extension usuarioQueryLinks
    on QueryBuilder<usuario, usuario, QFilterCondition> {}

extension usuarioQuerySortBy on QueryBuilder<usuario, usuario, QSortBy> {
  QueryBuilder<usuario, usuario, QAfterSortBy> sortByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByAdministradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_abrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_abrir', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_abrirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_abrir', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_carga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_carga', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_cargaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_carga', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_fechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_fechar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_fecharDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_fechar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_gerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_gerenciar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_gerenciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_gerenciar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_movimentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_movimentar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_movimentarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_movimentar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_parametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_parametros', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_parametrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_parametros', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_pdv', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByCaixa_pdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_pdv', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLogar_empresas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logar_empresas', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLogar_empresasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logar_empresas', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByMob_dashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mob_dashboard', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByMob_dashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mob_dashboard', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByTrocar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trocar_senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByTrocar_senhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trocar_senha', Sort.desc);
    });
  }
}

extension usuarioQuerySortThenBy
    on QueryBuilder<usuario, usuario, QSortThenBy> {
  QueryBuilder<usuario, usuario, QAfterSortBy> thenByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByAdministradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_abrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_abrir', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_abrirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_abrir', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_carga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_carga', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_cargaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_carga', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_fechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_fechar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_fecharDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_fechar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_gerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_gerenciar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_gerenciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_gerenciar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_movimentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_movimentar', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_movimentarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_movimentar', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_parametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_parametros', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_parametrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_parametros', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_pdv', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByCaixa_pdvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caixa_pdv', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_colaboradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_colaborador', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLogar_empresas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logar_empresas', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLogar_empresasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logar_empresas', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByMob_dashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mob_dashboard', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByMob_dashboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mob_dashboard', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByTrocar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trocar_senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByTrocar_senhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trocar_senha', Sort.desc);
    });
  }
}

extension usuarioQueryWhereDistinct
    on QueryBuilder<usuario, usuario, QDistinct> {
  QueryBuilder<usuario, usuario, QDistinct> distinctByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'administrador');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_abrir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_abrir');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_carga() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_carga');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_fechar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_fechar');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_gerenciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_gerenciar');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_movimentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_movimentar');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_parametros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_parametros');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByCaixa_pdv() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caixa_pdv');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctById_colaborador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_colaborador');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByLogar_empresas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logar_empresas');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByMob_dashboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mob_dashboard');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctBySenha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByTrocar_senha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trocar_senha');
    });
  }
}

extension usuarioQueryProperty
    on QueryBuilder<usuario, usuario, QQueryProperty> {
  QueryBuilder<usuario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> administradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'administrador');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_abrirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_abrir');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_cargaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_carga');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_fecharProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_fechar');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_gerenciarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_gerenciar');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_movimentarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_movimentar');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_parametrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_parametros');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> caixa_pdvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caixa_pdv');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> id_colaboradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_colaborador');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> logar_empresasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logar_empresas');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> mob_dashboardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mob_dashboard');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senha');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> trocar_senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trocar_senha');
    });
  }
}
