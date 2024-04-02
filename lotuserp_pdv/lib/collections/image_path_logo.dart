// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:isar/isar.dart';

part 'image_path_logo.g.dart';

@Collection()
class image_path_logo {
  late Id id = Isar.autoIncrement;
  late String? file_image;
  late String? path_image;

  image_path_logo(
    this.file_image,
    this.path_image,
  );
}