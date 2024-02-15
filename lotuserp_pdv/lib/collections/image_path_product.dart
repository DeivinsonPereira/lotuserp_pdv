// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:isar/isar.dart';

part 'image_path_product.g.dart';

@Collection()
class image_path_product {
  Id id = Isar.autoIncrement;
  late int? id_produto;
  late int? id_grupo;
  late int? favorite;
  late String? descricao;
  late String? path_image;
  late String? file_image;
}
