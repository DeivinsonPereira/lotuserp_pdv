// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'dado_empresa.g.dart';

@Collection()
class DadoEmpresa {
  late Id id = Isar.autoIncrement;
  late String? ipEmpresa;
  late int? idEmpresa;
  late int? idNfce;
  late int? numCaixa;
  late int? intervaloEnvio;
  
}
