// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:isar/isar.dart';

part 'image_path_group.g.dart';

@Collection()
class image_path_group {

  Id id = Isar.autoIncrement;
  late String? path_image;
  late String? nome_grupo;
  late String? file_image; 
}