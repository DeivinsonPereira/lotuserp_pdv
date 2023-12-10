// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'dado_empresa.g.dart';

@Collection()
class DadoEmpresa {
  late Id id = Isar.autoIncrement;
  late String? ipEmpresa;
  late String? idEmpresa;
  late String? idNfce;
  late String? numCaixa;
  late String? intervaloEnvio;
  
}