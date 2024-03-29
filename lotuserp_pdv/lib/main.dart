import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/empresa_valida.dart';
import 'package:lotuserp_pdv/collections/image_path_product.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/core/app_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/caixa_fechamento.dart';
import 'collections/cartao_item.dart';
import 'collections/default_printer.dart';
import 'collections/image_path_group.dart';
import 'collections/nfce_resultado.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.
  final dir = await getApplicationSupportDirectory();
  //abre o banco de dados e as tabelas
  await Isar.open(
    [
      EmpresaSchema,
      Produto_grupoSchema,
      ProdutoSchema,
      UsuarioSchema,
      Tipo_recebimentoSchema,
      Dado_empresaSchema,
      Usuario_logadoSchema,
      Default_printerSchema,
      Caixa_itemSchema,
      CaixaSchema,
      Venda_itemSchema,
      VendaSchema,
      Caixa_fechamentoSchema,
      Cartao_itemSchema,
      Nfce_resultadoSchema,
      Image_path_groupSchema,
      Image_path_productSchema,
      Empresa_validaSchema
    ],
    directory: dir.path,
    inspector: true,
  );
  runApp(const AppWidget());
}
