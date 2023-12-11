import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/grupo_produto.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/core/app_widget.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

   WidgetsFlutterBinding
      .ensureInitialized(); // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.
  final dir = await getApplicationSupportDirectory();
  await Isar.open(
    [
      EmpresaSchema, GrupoProdutoSchema, ProdutoSchema, UsuarioSchema, CaixaItemSchema, CaixaSchema, VendaItemSchema, VendaSchema, DadoEmpresaSchema,UsuarioLogadoSchema
    ],
    directory: dir.path,
    inspector: true,
  );
  
  runApp(const AppWidget());
}


