// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_path.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getimage_pathCollection on Isar {
  IsarCollection<image_path> get image_paths => this.collection();
}

const Image_pathSchema = CollectionSchema(
  name: r'image_path',
  id: -62448443992049869,
  properties: {
    r'file_image': PropertySchema(
      id: 0,
      name: r'file_image',
      type: IsarType.string,
    ),
    r'nome_grupo': PropertySchema(
      id: 1,
      name: r'nome_grupo',
      type: IsarType.string,
    ),
    r'path_image': PropertySchema(
      id: 2,
      name: r'path_image',
      type: IsarType.string,
    )
  },
  estimateSize: _image_pathEstimateSize,
  serialize: _image_pathSerialize,
  deserialize: _image_pathDeserialize,
  deserializeProp: _image_pathDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _image_pathGetId,
  getLinks: _image_pathGetLinks,
  attach: _image_pathAttach,
  version: '3.1.0+1',
);

int _image_pathEstimateSize(
  image_path object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.file_image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nome_grupo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.path_image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _image_pathSerialize(
  image_path object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.file_image);
  writer.writeString(offsets[1], object.nome_grupo);
  writer.writeString(offsets[2], object.path_image);
}

image_path _image_pathDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = image_path();
  object.file_image = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.nome_grupo = reader.readStringOrNull(offsets[1]);
  object.path_image = reader.readStringOrNull(offsets[2]);
  return object;
}

P _image_pathDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _image_pathGetId(image_path object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _image_pathGetLinks(image_path object) {
  return [];
}

void _image_pathAttach(IsarCollection<dynamic> col, Id id, image_path object) {
  object.id = id;
}

extension image_pathQueryWhereSort
    on QueryBuilder<image_path, image_path, QWhere> {
  QueryBuilder<image_path, image_path, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension image_pathQueryWhere
    on QueryBuilder<image_path, image_path, QWhereClause> {
  QueryBuilder<image_path, image_path, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<image_path, image_path, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<image_path, image_path, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<image_path, image_path, QAfterWhereClause> idBetween(
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

extension image_pathQueryFilter
    on QueryBuilder<image_path, image_path, QFilterCondition> {
  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'file_image',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'file_image',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> file_imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> file_imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'file_image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> file_imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file_image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      file_imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<image_path, image_path, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<image_path, image_path, QAfterFilterCondition> idBetween(
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

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nome_grupo',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nome_grupo',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> nome_grupoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> nome_grupoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome_grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome_grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> nome_grupoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome_grupo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome_grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      nome_grupoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome_grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path_image',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path_image',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> path_imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> path_imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path_image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition> path_imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path_image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path, image_path, QAfterFilterCondition>
      path_imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path_image',
        value: '',
      ));
    });
  }
}

extension image_pathQueryObject
    on QueryBuilder<image_path, image_path, QFilterCondition> {}

extension image_pathQueryLinks
    on QueryBuilder<image_path, image_path, QFilterCondition> {}

extension image_pathQuerySortBy
    on QueryBuilder<image_path, image_path, QSortBy> {
  QueryBuilder<image_path, image_path, QAfterSortBy> sortByFile_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> sortByFile_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.desc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> sortByNome_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_grupo', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> sortByNome_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_grupo', Sort.desc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> sortByPath_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> sortByPath_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.desc);
    });
  }
}

extension image_pathQuerySortThenBy
    on QueryBuilder<image_path, image_path, QSortThenBy> {
  QueryBuilder<image_path, image_path, QAfterSortBy> thenByFile_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByFile_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.desc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByNome_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_grupo', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByNome_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_grupo', Sort.desc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByPath_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.asc);
    });
  }

  QueryBuilder<image_path, image_path, QAfterSortBy> thenByPath_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.desc);
    });
  }
}

extension image_pathQueryWhereDistinct
    on QueryBuilder<image_path, image_path, QDistinct> {
  QueryBuilder<image_path, image_path, QDistinct> distinctByFile_image(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file_image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<image_path, image_path, QDistinct> distinctByNome_grupo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome_grupo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<image_path, image_path, QDistinct> distinctByPath_image(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path_image', caseSensitive: caseSensitive);
    });
  }
}

extension image_pathQueryProperty
    on QueryBuilder<image_path, image_path, QQueryProperty> {
  QueryBuilder<image_path, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<image_path, String?, QQueryOperations> file_imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file_image');
    });
  }

  QueryBuilder<image_path, String?, QQueryOperations> nome_grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome_grupo');
    });
  }

  QueryBuilder<image_path, String?, QQueryOperations> path_imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path_image');
    });
  }
}
