// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'package:isar/isar.dart';

part 'produto_grupo.g.dart';

@Collection()
class produto_grupo {
  late Id id_grupo;
  late String? grupo_descricao;
  late int? status;
  late String? file_imagem;

  produto_grupo(
    this.id_grupo,
    this.grupo_descricao,
    this.status,
    this.file_imagem,
  );
}
