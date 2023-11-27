// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'grupo_produto.g.dart';

@Collection()
class GrupoProduto {
  late Id id = Isar.autoIncrement;
  late int idGrupo = Isar.autoIncrement;
  late String grupoDescricao;
  late int status;
  late int enviarMobile;
  late String fileImagem;
  

  GrupoProduto(
    
    this.idGrupo,
    this.grupoDescricao,
    this.status,
    this.enviarMobile,
    this.fileImagem,
  );

 
}
