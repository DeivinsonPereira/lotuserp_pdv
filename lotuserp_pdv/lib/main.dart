import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/admin_config.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/empresa_valida.dart';
import 'package:lotuserp_pdv/collections/image_path_product.dart';
import 'package:lotuserp_pdv/collections/pagamento_venda.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/core/app_widget.dart';
import 'package:lotuserp_pdv/repositories/service/monitoring/close_caixa_monitoring.dart';
import 'package:lotuserp_pdv/repositories/service/monitoring/emitir_nfce_monitoring.dart';
import 'package:lotuserp_pdv/repositories/service/monitoring/moviment_caixa_monitoring.dart';
import 'package:lotuserp_pdv/repositories/service/monitoring/open_caixa_monitoring.dart';
import 'package:lotuserp_pdv/repositories/service/monitoring/venda_monitoring.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/caixa_fechamento.dart';
import 'collections/cartao_item.dart';
import 'collections/default_printer.dart';
import 'collections/image_path_group.dart';
import 'collections/image_path_logo.dart';
import 'collections/nfce_resultado.dart';
import 'repositories/download_persist_images_repository.dart';
import 'services/dependencies.dart';

Future<void> startMonitorarCaixa(String appSupportPath) async {
  final isar = await initializeIsar(appSupportPath);
  Timer.periodic(const Duration(seconds: 15),
      (timer) => monitorarCaixa(timer, isar, appSupportPath));
}

Future<void> monitorarCaixa(Timer t, Isar isar, String appSupportPath) async {
  IsarService isarService = IsarService(directory: appSupportPath);

  await OpenCaixaMonitoring(isar, isarService).monitorarAberturaCaixa();
  await MovimentCaixaMonitoring(isar, isarService)
      .monitoramentoMovimentoCaixa();
  await CloseCaixaMonitoring(isar, isarService).monitorarFechamentoCaixa();
  await EmitirNfceMonitoring(isar, isarService).monitorarNfce();
  await VendaMonitoring(isar, isarService).monitorarVenda();
}

Future<Isar> initializeIsar(String directory) async {
  //abre o banco de dados e as tabelas
  return await Isar.open(
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
      Image_path_logoSchema,
      Empresa_validaSchema,
      Admin_configSchema,
      Pagamento_vendaSchema,
    ],
    directory: directory,
    inspector: true,
  );
}

void isolateEntryPoint(String appSupportPath) async {
  await startMonitorarCaixa(appSupportPath);
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.

  //abre o banco de dados e as tabelas
  //await initializeIsar();
  final dir = await getApplicationSupportDirectory();
  final appSupportPath = dir.path;

  Isolate.spawn(isolateEntryPoint, appSupportPath);

  var logoController = Dependencies.logoController();
  await downloadImageLogo();
  await persistImagesLogo();
  Future.delayed(const Duration(seconds: 2), () async {
    await logoController.setImages();
    await logoController.getImagePath();

    runApp(const AppWidget());
  });
}
