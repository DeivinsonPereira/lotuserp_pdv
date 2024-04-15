// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_extensions

part of 'image_path_logo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getimage_path_logoCollection on Isar {
  IsarCollection<image_path_logo> get image_path_logos => this.collection();
}

const Image_path_logoSchema = CollectionSchema(
  name: r'image_path_logo',
  id: -4682099945043754983,
  properties: {
    r'file_image': PropertySchema(
      id: 0,
      name: r'file_image',
      type: IsarType.string,
    ),
    r'path_image': PropertySchema(
      id: 1,
      name: r'path_image',
      type: IsarType.string,
    )
  },
  estimateSize: _image_path_logoEstimateSize,
  serialize: _image_path_logoSerialize,
  deserialize: _image_path_logoDeserialize,
  deserializeProp: _image_path_logoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _image_path_logoGetId,
  getLinks: _image_path_logoGetLinks,
  attach: _image_path_logoAttach,
  version: '3.1.0+1',
);

int _image_path_logoEstimateSize(
  image_path_logo object,
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
    final value = object.path_image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _image_path_logoSerialize(
  image_path_logo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.file_image);
  writer.writeString(offsets[1], object.path_image);
}

image_path_logo _image_path_logoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = image_path_logo(
    reader.readStringOrNull(offsets[0]),
    reader.readStringOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _image_path_logoDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _image_path_logoGetId(image_path_logo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _image_path_logoGetLinks(image_path_logo object) {
  return [];
}

void _image_path_logoAttach(
    IsarCollection<dynamic> col, Id id, image_path_logo object) {
  object.id = id;
}

extension image_path_logoQueryWhereSort
    on QueryBuilder<image_path_logo, image_path_logo, QWhere> {
  QueryBuilder<image_path_logo, image_path_logo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension image_path_logoQueryWhere
    on QueryBuilder<image_path_logo, image_path_logo, QWhereClause> {
  QueryBuilder<image_path_logo, image_path_logo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterWhereClause>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterWhereClause> idBetween(
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

extension image_path_logoQueryFilter
    on QueryBuilder<image_path_logo, image_path_logo, QFilterCondition> {
  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'file_image',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'file_image',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageEqualTo(
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageBetween(
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file_image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      file_imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path_image',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path_image',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageEqualTo(
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageBetween(
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
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

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path_image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path_image',
        value: '',
      ));
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterFilterCondition>
      path_imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path_image',
        value: '',
      ));
    });
  }
}

extension image_path_logoQueryObject
    on QueryBuilder<image_path_logo, image_path_logo, QFilterCondition> {}

extension image_path_logoQueryLinks
    on QueryBuilder<image_path_logo, image_path_logo, QFilterCondition> {}

extension image_path_logoQuerySortBy
    on QueryBuilder<image_path_logo, image_path_logo, QSortBy> {
  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      sortByFile_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.asc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      sortByFile_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.desc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      sortByPath_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.asc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      sortByPath_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.desc);
    });
  }
}

extension image_path_logoQuerySortThenBy
    on QueryBuilder<image_path_logo, image_path_logo, QSortThenBy> {
  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      thenByFile_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.asc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      thenByFile_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_image', Sort.desc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      thenByPath_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.asc);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QAfterSortBy>
      thenByPath_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path_image', Sort.desc);
    });
  }
}

extension image_path_logoQueryWhereDistinct
    on QueryBuilder<image_path_logo, image_path_logo, QDistinct> {
  QueryBuilder<image_path_logo, image_path_logo, QDistinct>
      distinctByFile_image({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file_image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<image_path_logo, image_path_logo, QDistinct>
      distinctByPath_image({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path_image', caseSensitive: caseSensitive);
    });
  }
}

extension image_path_logoQueryProperty
    on QueryBuilder<image_path_logo, image_path_logo, QQueryProperty> {
  QueryBuilder<image_path_logo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<image_path_logo, String?, QQueryOperations>
      file_imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file_image');
    });
  }

  QueryBuilder<image_path_logo, String?, QQueryOperations>
      path_imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path_image');
    });
  }
}
