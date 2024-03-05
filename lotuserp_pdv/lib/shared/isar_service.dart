// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/default_printer.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/image_path_group.dart';
import 'package:lotuserp_pdv/collections/image_path_product.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/controllers/config_controller.dart';
import 'package:lotuserp_pdv/controllers/global_controller.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/pages/common/custom_snack_bar.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../collections/caixa_fechamento.dart';
import '../collections/cartao_item.dart';
import '../collections/empresa_valida.dart';
import '../collections/nfce_resultado.dart';
import '../controllers/response_servidor_controller.dart';
import '../controllers/text_field_controller.dart';
import '../core/app_routes.dart';
import '../pages/printer/printer_popup.dart';
import '../repositories/caixa_item_servidor_repository.dart';
import '../repositories/venda_servidor_repository.dart';
import '../services/dependencies.dart';

Map<String, String> _headers = {
  'content-type': 'application/json',
  'ptoken': 'ed9a811327979c9382ffd6361cfc5013'
};

class IsarService {
  late Future<Isar> db;
  bool conexaoApi = false;
  bool conexaoSiage = false;

  var logger = Logger();

  //chama o método para abrir o banco de dados e atribui a variável db
  IsarService() {
    db = openDB();
  }

  //verifica se a api Siage esta conectada
  Future<void> connectionVerifySiage() async {
    Uri uri = Uri.parse(Endpoints().prefixo());
    try {
      conexaoSiage = false;
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        conexaoSiage = true;
        return;
      } else {
        conexaoSiage = false;
        return;
      }
    } catch (e) {
      logger.e('Erro ao conectar com a API Siage: $e');
      conexaoSiage = false;
      return;
    }
  }

  //verifica se a api esta conectada
  Future<void> connectionVerifyApi(BuildContext context) async {
    TextFieldController textFieldController =
        Dependencies.textFieldController();
    String ipEmpresa;

    ipEmpresa = textFieldController.numContratoEmpresaController.text;
    Uri uri = Uri.parse(ipEmpresa);
    if (!ipEmpresa.isNotEmpty && !ipEmpresa.isBlank!) {
      dado_empresa? dadosEmpresariais = await getDataEmpresa();
      String? url = dadosEmpresariais!.ip_empresa;
      uri = Uri.parse(url!);
    }

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        conexaoApi = true;
        logger.d('Conexão com a API bem-sucedida!');
      } else {
        conexaoApi = false;
        logger.e('Falha na conexão com a API!');
        const CustomCherryError(message: 'Falha na conexão com o servidor!')
            .show(context);
      }
    } catch (e) {
      conexaoApi = false;
      logger.e('Erro ao conectar com a API: $e');
      const CustomCherryError(message: 'Falha na conexão com o servidor!')
          .show(context);
    }
  }

  //buscar ipEmpresa na tabela 'Dados Empresarias'
  Future<dado_empresa?> getIpEmpresaFromDatabase() async {
    final isar = await db;
    final ipEmpresa = await isar.dado_empresas.where().findFirst();
    try {
      if (ipEmpresa == null) {
        const CustomSnackBar(
            message: 'Nenhum registro encontrado no servidor.');
        logger.e('Nenhum registro encontrado na tabela "dado_empresas".');
        return null;
      } else {
        return ipEmpresa;
      }
    } catch (e) {
      logger.e('Erro ao buscar dados da empresa: $e');
    }
  }

  //inserindo dados na tabela empresa vindos do servidor
  Future getEmpresa(
      String companyId, String companyIp, BuildContext context) async {
    await connectionVerifyApi(context);

    if (conexaoApi) {
      final isar = await db;

      Uri getEmpresaUri =
          Uri.parse('${companyIp}pdvmobget01_empresa?pidEmpresa=$companyId');
      try {
        final response = await http.get(
          getEmpresaUri,
          headers: _headers,
        );
        if (response.statusCode != 200) {
          throw Exception(
              'Falha ao obter dados da empresa do servidor. Código de erro HTTP: ${response.statusCode}');
        }
        var empresas = jsonDecode(utf8.decode(response.bodyBytes));
        int i = await isar.empresas.count();

        if (i > 0) {
          await isar.writeTxn(() async {
            await isar.empresas.clear();
          });
        }

        final emp = empresa(
            empresas['itens'][0]['id'],
            empresas['itens'][0]['razao'],
            empresas['itens'][0]['fantasia'],
            empresas['itens'][0]['cnpj'],
            empresas['itens'][0]['insc_estadual'],
            empresas['itens'][0]['insc_municipal'],
            empresas['itens'][0]['fone1'],
            empresas['itens'][0]['fone2'],
            empresas['itens'][0]['fone3'],
            empresas['itens'][0]['endereco'],
            empresas['itens'][0]['bairro'],
            empresas['itens'][0]['numero'],
            empresas['itens'][0]['municipio'],
            empresas['itens'][0]['municipio_uf'],
            empresas['itens'][0]['cep'],
            empresas['itens'][0]['email'],
            empresas['itens'][0]['site'],
            empresas['itens'][0]['complemento'],
            empresas['itens'][0]['estoque_grade'],
            1,
            empresas['itens'][0]['param_nf_crt'],
            empresas['itens'][0]['param_pdv_usar_pvista_pprazo'],
            empresas['itens'][0]['param_vendas_tpcomissao'],
            empresas['itens'][0]['param_vendas_portador'],
            empresas['itens'][0]['param_vendas_descmaximo'].toDouble(),
            empresas['itens'][0]['param_pdv_codigopesagem'],
            empresas['itens'][0]['param_pdv_formapagto'],
            empresas['itens'][0]['param_pdv_cliente'],
            empresas['itens'][0]['param_pdv_bloq_est_neg'],
            empresas['itens'][0]['param_pdv_validar_cx_fechado'],
            empresas['itens'][0]['param_pdv_senha_cancelar'],
            empresas['itens'][0]['param_pdv_imp_cp_nf_venda'],
            empresas['itens'][0]['param_pdv_prodcomposto'],
            empresas['itens'][0]['param_pdv_informa_cliente'],
            empresas['itens'][0]['param_pdv_vendedor_venda'],
            empresas['itens'][0]['param_pdv_cartao_gerarparc'],
            empresas['itens'][0]['param_pdv_imp_comprovante'],
            empresas['itens'][0]['param_pdv_permitir_desconto'],
            empresas['itens'][0]['param_pdv_tipo_desconto'],
            empresas['itens'][0]['param_pdv_gerar_senha'],
            empresas['itens'][0]['param_pdv_comanda_producao']);
        isar.writeTxn(() async {
          await isar.empresas.put(emp);
        });
        return isar;
      } catch (e) {
        const CustomCherryError(
          message:
              'Não foi possível obter os dados da empresa. Tente novamente mais tarde.',
        ).show(context);

        // Usando Logger para registrar a exceção
        logger.e('Erro ao obter ou processar dados da empresa: $e');

        return null;
      }
    }
  }

  //verifica se tem dados na tabela empresa
  Future<int> empresaCount() async {
    final isar = await db;
    return isar.empresas.count();
  }

  //inserindo dados na tabela grupo vindos do servidor
  Future getGrupo(BuildContext context) async {
    await connectionVerifyApi(context);

    if (conexaoApi) {
      final isar = await db;
      int tentativas = 0;
      const maxTentativas = 3; // Número máximo de tentativas
      int empresaCount = 0;

      while (tentativas < maxTentativas) {
        empresaCount = await isar.empresas.count();
        if (empresaCount > 0) {
          break; // Sai do loop se encontrar dados na tabela empresa
        }
        tentativas++;
        await Future.delayed(const Duration(milliseconds: 500));
      }

      if (empresaCount == 0) {
        throw Exception('Tabela empresa vazia. Não é possível buscar grupos.');
      }

      dado_empresa? dadoEmpresa = await getIpEmpresaFromDatabase();

      if (dadoEmpresa == null) {
        CustomCherryError(
          message: 'Dados da empresa não encontrados.',
        ).show(context);
        return null;
      }

      var ipEmpresaUrl = dadoEmpresa.ip_empresa!;
      var idEmpresaNum = dadoEmpresa.id_empresa!;

      Uri getGrupoUri = Uri.parse(
          '${ipEmpresaUrl}pdvmobget03_produtos_grupos?pidEmpresa=$idEmpresaNum');

      try {
        final response = await http.get(
          getGrupoUri,
          headers: _headers,
        );

        if (response.statusCode != 200) {
          throw Exception(
              'Falha ao obter dados dos grupos do servidor. Código de erro HTTP: ${response.statusCode}');
        }

        int i = await isar.produto_grupos.count();

        var gruposData = jsonDecode(utf8.decode(response.bodyBytes));

        if (i >= 0) {
          isar.writeTxn(() async {
            await isar.produto_grupos.clear();
          });
        }

        var grupoCount = gruposData['itens'].length;

        final List<produto_grupo> listaGrupo = [];

        for (int i = 0; i < grupoCount; i++) {
          final gru = produto_grupo(
            gruposData['itens'][i]['id_grupo'],
            gruposData['itens'][i]['grupo_descricao'],
            gruposData['itens'][i]['status'],
            gruposData['itens'][i]['file_imagem'],
          );

          listaGrupo.add(gru);
        }

        isar.writeTxn(() async {
          await isar.produto_grupos.putAll(listaGrupo);
        });
        return isar;
      } catch (e) {
        CustomCherryError(
          message:
              'Não foi possível obter os dados dos grupos. Tente novamente mais tarde.',
        ).show(context);

        logger.e('Erro ao obter ou processar dados dos grupos: $e');

        return null;
      }
    }
  }

  //stream para buscar dados da tabela grupo
  Stream<List<produto_grupo>> listenGrupo() async* {
    final isar = await db;
    yield* isar.produto_grupos
        .where()
        .sortByGrupo_descricao()
        .watch(fireImmediately: true);
  }

  //busca todos os dados da tabela grupo no banco de dados local
  Future<List<produto_grupo>> searchGrupos() async {
    final isar = await db;
    var grupos =
        await isar.produto_grupos.where().sortByGrupo_descricao().findAll();
    if (grupos.isNotEmpty) {
      return grupos;
    } else {
      return [];
    }
  }

  //Salvar imagens dos grupos
  Future<Isar> saveImagemGrupos() async {
    final isar = await db;

    int i = await isar.image_path_groups.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.image_path_groups.clear();
        },
      );
    }
    try {
      isar.writeTxn(() async {
        var saveImagePathController = Dependencies.saveImagePathController();
        await saveImagePathController.getGrupos();
        // OBTER OS GRUPOS
        List<produto_grupo> grupos = saveImagePathController.grupos;

        Directory dir = await getApplicationDocumentsDirectory();
        String pathNameGrupos = '${dir.path}/assets/grupos/';
        Directory directoryGrupos = Directory(pathNameGrupos);
        List<String> files = [];
        List<FileSystemEntity> filesPath = [];

        if (await directoryGrupos.exists()) {
          filesPath = directoryGrupos.listSync();
          for (var i = 0; i < filesPath.length; i++) {
            files.add(filesPath[i].path.split('/').last);
          }
        }

        List<image_path_group> images = [];

        List<produto_grupo> gruposSelected = grupos
            .where((element) => files.contains(element.file_imagem))
            .toList();

        List<String> saveFile = [];

        for (var i = 0; i < gruposSelected.length; i++) {
          saveFile.add(gruposSelected[i].file_imagem!);
        }

        //SALVA IMAGENS NO BANCO DE DADOS
        for (var i = 0; i < saveFile.length; i++) {
          image_path_group image = image_path_group()
            ..file_image = gruposSelected[i].file_imagem
            ..nome_grupo = gruposSelected[i].grupo_descricao
            ..path_image = filesPath[i].path;

          images.add(image);
          // saveImagePathController.addImagePathSimple(pathName);
        }
        await isar.image_path_groups.putAll(images);
      });
    } catch (e) {
      logger.e('Erro ao salvar imagem dos grupos: $e');
    }
    return isar;
  }

  //Busca o path das imagens salvas no diretório
  Future<List<String?>> searchImagePathGroup() async {
    final isar = await db;

    var grupos =
        await isar.image_path_groups.where().sortByNome_grupo().findAll();
    var gruposPath = grupos.map((gru) => gru.path_image).toList();

    if (grupos.isNotEmpty) {
      return gruposPath;
    } else {
      return [];
    }
  }

  //salva as imagens dos produtos no diretório do aplicativo
  Future<Isar> saveImagemProdutos() async {
    final isar = await db;

    int i = await isar.image_path_products.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.image_path_products.clear();
        },
      );
    }
    try {
      isar.writeTxn(() async {
        var saveImagePathController = Dependencies.saveImagePathController();
        await saveImagePathController.getProdutos();
        // OBTER OS PRODUTOS
        List<produto> produtos = saveImagePathController.produtos;

        Directory dir = await getApplicationDocumentsDirectory();
        String pathNameProducts = '${dir.path}/assets/produtos/';
        Directory directoryProducts = Directory(pathNameProducts);
        List<String> files = [];
        List<FileSystemEntity> filesPath = [];

        if (await directoryProducts.exists()) {
          filesPath = directoryProducts.listSync();
          for (var i = 0; i < filesPath.length; i++) {
            files.add(filesPath[i].path.split('/').last);
          }
        }

        List<image_path_product> images = [];

        List<produto> produtosSelected = produtos
            .where((element) => files.contains(element.file_imagem))
            .toList();

        List<String> saveFile = [];

        for (var i = 0; i < produtosSelected.length; i++) {
          saveFile.add(produtosSelected[i].file_imagem!);
        }

        for (var i = 0; i < saveFile.length; i++) {
          // BAIXAR A IMAGEM
          image_path_product image = image_path_product()
            ..id_grupo = produtosSelected[i].id_grupo
            ..id_produto = produtosSelected[i].id_produto
            ..favorite = produtosSelected[i].favorito
            ..descricao = produtosSelected[i].descricao
            ..gtin = produtosSelected[i].gtin
            ..file_image = produtosSelected[i].file_imagem
            ..path_image = filesPath[i].path;

          images.add(image);
        }
        // saveImagePathController.addImagePathSimple(pathName);
        await isar.image_path_products.putAll(images);
      });
    } catch (e) {
      logger.e('Erro ao salvar imagem dos grupos: $e');
    }
    return isar;
  }

  //inserindo dados na tabela produtos vindos do servidor
  Future getProduto(BuildContext context) async {
    await connectionVerifyApi(context);

    if (conexaoApi) {
      final isar = await db;
      int i = await isar.produtos.count();

      if (i >= 0) {
        isar.writeTxn(
          () async {
            await isar.produtos.clear();
          },
        );
      }

      dado_empresa? dadoEmpresa = await getIpEmpresaFromDatabase();

      var ipEmpresaUrl = '';
      var idEmpresaNum = 0;

      if (dadoEmpresa != null) {
        ipEmpresaUrl = dadoEmpresa.ip_empresa!;
        idEmpresaNum = dadoEmpresa.id_empresa!;
      }

      try {
        Uri getProdutos = Uri.parse(
            '${ipEmpresaUrl}pdvmobget05_produtos?pidEmpresa=$idEmpresaNum');
        final response = await http.get(
          getProdutos,
          headers: _headers,
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> produtos =
              jsonDecode(utf8.decode(response.bodyBytes));

          var produtosCount = produtos['itens'].length;

          final List<produto> listaProduto = [];

          for (int i = 0; i < produtosCount; i++) {
            DateTime? dataLimitePromocao;
            DateTime? dataInicioPromocao;
            if (produtos['itens']?[i]?['promocao_data_limite'] != null) {
              dataLimitePromocao = DateTime.tryParse(
                  produtos['itens']?[i]?['promocao_data_limite']);
            } else {
              dataLimitePromocao = null;
            }

            if (produtos['itens']?[i]?['promocao_data_inicio'] != null) {
              dataInicioPromocao =
                  DateTime.parse(produtos['itens']![i]['promocao_data_inicio']);
            } else {
              dataInicioPromocao = null;
            }
            final pro = produto(
              produtos['itens'][i]['id_empresa'],
              produtos['itens'][i]['id_produto'],
              produtos['itens'][i]['grade'],
              produtos['itens'][i]['id_grupo'],
              produtos['itens'][i]['descricao'],
              produtos['itens'][i]['unidade'],
              produtos['itens'][i]['gtin'],
              produtos['itens'][i]['composto'],
              produtos['itens'][i]['venda_kg'],
              produtos['itens'][i]['nao_rec_desconto'],
              produtos['itens'][i]['status'],
              produtos['itens'][i]['saldo_produto'].toDouble(),
              produtos['itens'][i]['pvenda'].toDouble(),
              produtos['itens'][i]['alt_preco_venda'],
              produtos['itens'][i]['alt_preco_venda_tipo'],
              produtos['itens'][i]['balanca_tipo_pesagem'],
              produtos['itens'][i]['balanca_idproduto'],
              produtos['itens'][i]['gtin_grade'],
              produtos['itens'][i]['promocao_ativar'],
              produtos['itens'][i]['promocao_preco'].toDouble(),
              dataInicioPromocao,
              dataLimitePromocao,
              produtos['itens'][i]['promocao_hora_inicial'],
              produtos['itens'][i]['promocao_hora_final'],
              produtos['itens'][i]['promocao_tipo_desc'],
              produtos['itens'][i]['promocao_compre'],
              produtos['itens'][i]['promocao_leve'],
              produtos['itens'][i]['promocao_apartir'],
              produtos['itens'][i]['promocao_apartir_perc'].toDouble(),
              produtos['itens'][i]['file_imagem'],
              produtos['itens'][i]['favorito'],
            );

            listaProduto.add(pro);
          }

          isar.writeTxn(() async {
            await isar.produtos.putAll(listaProduto);
          });
          return isar;
        }
      } catch (e) {
        return Container();
      }
    }
  }

  //Busca o path das imagens salvas no diretório
  Future<List<String?>> searchImagePathProduct(int idGrupo) async {
    final isar = await db;

    var produtos = await isar.image_path_products
        .filter()
        .id_grupoEqualTo(idGrupo)
        .findAll();
    var produtosPath = produtos.map((pro) => pro.path_image).toList();

    if (produtos.isNotEmpty) {
      return produtosPath;
    } else {
      return [];
    }
  }

  // Busca o path das imagens salvas no diretório
  Future<List<String?>> searchImagePathFavorite() async {
    final isar = await db;

    var produtos =
        await isar.image_path_products.filter().favoriteEqualTo(1).findAll();
    var produtosPath = produtos.map((pro) => pro.path_image).toList();

    if (produtos.isNotEmpty) {
      return produtosPath;
    } else {
      return [];
    }
  }

  //busca os paths das imagens de acordo com a descrição no campo de busca
  Future<List<String?>> searchImagePathDesc(value) async {
    final isar = await db;

    var produtos = await isar.image_path_products
        .filter()
        .descricaoStartsWith(value)
        .findAll();
    var produtosPath = produtos.map((pro) => pro.path_image).toList();

    if (produtos.isNotEmpty) {
      return produtosPath;
    } else {
      return [];
    }
  }

  //busca os paths das imagens de acordo com o codigo de barras (gtin) no campo de busca
  Future<List<String?>> searchImagePathBarcode(value) async {
    final isar = await db;

    var produtos =
        await isar.image_path_products.filter().gtinEqualTo(value).findAll();

    var produtosPath = produtos.map((pro) => pro.path_image).toList();

    if (produtos.isNotEmpty) {
      return produtosPath;
    } else {
      return [];
    }
  }

  //busca o objeto produtos
  Future<List<produto>> searchProdutos() async {
    final isar = await db;
    var produtos = await isar.produtos.where().findAll();
    if (produtos.isNotEmpty) {
      return produtos;
    } else {
      return [];
    }
  }

  //stream para buscar dados da tabela produtos
  Stream<List<produto>> listenProdutos() async* {
    final isar = await db;
    yield* isar.produtos.where().sortById_grupo().watch(fireImmediately: true);
  }

  //traz os grupos que tem favoritos marcados como 1
  Stream<List<produto>> listenProdutosFavorite() async* {
    final isar = await db;

    yield* isar.produtos
        .filter()
        .favoritoEqualTo(1)
        .watch(fireImmediately: true);
  }

  //busca o objeto produto de acordo com o id
  Future<List<produto?>> searchListProdutoById(int id) async {
    final isar = await db;

    return await isar.produtos.filter().id_produtoEqualTo(id).findAll();
  }

  //busca o objeto produto de acordo com o id
  Future<produto?> searchProdutoById(int id) async {
    final isar = await db;

    return await isar.produtos.filter().id_produtoEqualTo(id).findFirst();
  }

  //busca o objeto produtos de acordo com o gtin (código de barras)
  Future<List<produto?>> searchProdutoByGtin(String gtin) async {
    final isar = await db;

    return await isar.produtos.filter().gtinEqualTo(gtin).findAll();
  }

  //busca o objeto produto de acordo com a descrição de forma paginada
  Future searchProdutoByDescPaged(String desc) async {
    final isar = await db;

    return await isar.produtos
        .filter()
        .descricaoStartsWith(desc)
        .sortByDescricao()
        .findAll();
  }

  //busca o objeto produto de acordo com o código de barras
  Future<List<produto?>> searchProdutoByBarcode(String barcode) async {
    final isar = await db;

    return await isar.produtos.filter().gtinEqualTo(barcode).findAll();
  }

  //busca o objeto produtos de acordo com a descrição
  Future<List<produto?>> searchProdutoByDesc(String desc) async {
    final isar = await db;
    return await isar.produtos.filter().descricaoStartsWith(desc).findAll();
  }

  //inserindo dados na tabela usuarios vindos do servidor
  Future getUsuarios(BuildContext context) async {
    await connectionVerifyApi(context);

    if (conexaoApi) {
      final isar = await db;
      int i = await isar.usuarios.count();

      if (i >= 0) {
        isar.writeTxn(
          () async {
            await isar.usuarios.clear();
          },
        );
      }

      dado_empresa? dadoEmpresa = await getIpEmpresaFromDatabase();

      var ipEmpresaUrl = '';
      var idEmpresaNum = 0;

      if (dadoEmpresa != null) {
        ipEmpresaUrl = dadoEmpresa.ip_empresa!;
        idEmpresaNum = dadoEmpresa.id_empresa!;
      }

      try {
        Uri getUsuarios = Uri.parse(
            '${ipEmpresaUrl}pdvmobget02_usuarios?pidEmpresa=$idEmpresaNum');
        final response = await http.get(
          getUsuarios,
          headers: _headers,
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> usuarios =
              jsonDecode(utf8.decode(response.bodyBytes));

          var usuariosCount = usuarios['itens'].length;

          final List<usuario> listaUsuarios = [];

          for (int i = 0; i < usuariosCount; i++) {
            final usu = usuario(
              usuarios['itens'][i]['id'],
              usuarios['itens'][i]['login'],
              usuarios['itens'][i]['id_colaborador'],
              usuarios['itens'][i]['senha'],
              usuarios['itens'][i]['status'],
              usuarios['itens'][i]['mob_dashboard'],
              usuarios['itens'][i]['trocar_senha'],
              usuarios['itens'][i]['administrador'],
              usuarios['itens'][i]['logar_empresas'],
              usuarios['itens'][i]['caixa_abrir'],
              usuarios['itens'][i]['caixa_movimentar'],
              usuarios['itens'][i]['caixa_gerenciar'],
              usuarios['itens'][i]['caixa_fechar'],
              usuarios['itens'][i]['caixa_pdv'],
              usuarios['itens'][i]['caixa_carga'],
              usuarios['itens'][i]['caixa_parametros'],
            );

            listaUsuarios.add(usu);
          }

          isar.writeTxn(() async {
            await isar.usuarios.putAll(listaUsuarios);
          });
          return isar;
        }
      } catch (e) {
        return Container();
      }
    }
  }

  //busca tipo_recebimento do servidor e insere na tabela do banco de dados local
  Future getTipo_recebimento(BuildContext context) async {
    await connectionVerifyApi(context);

    if (conexaoApi) {
      final isar = await db;
      int i = await isar.tipo_recebimentos.count();

      if (i >= 0) {
        isar.writeTxn(
          () async {
            await isar.tipo_recebimentos.clear();
          },
        );
      }

      dado_empresa? dadoEmpresa = await getIpEmpresaFromDatabase();

      var ipEmpresaUrl = '';
      var idEmpresaNum = 0;

      if (dadoEmpresa != null) {
        ipEmpresaUrl = dadoEmpresa.ip_empresa!;
        idEmpresaNum = dadoEmpresa.id_empresa!;
      }

      try {
        Uri getTipo_recebimento = Uri.parse(
            '${ipEmpresaUrl}pdvmobget06_tipos_recebimentos?pidEmpresa=$idEmpresaNum');
        final response = await http.get(
          getTipo_recebimento,
          headers: _headers,
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> tipo_recebimentoType =
              jsonDecode(utf8.decode(response.bodyBytes));

          var tipo_recebimento_count = tipo_recebimentoType['itens'].length;

          final List<tipo_recebimento> lista_tipo_recebimento = [];

          for (int i = 0; i < tipo_recebimento_count; i++) {
            final tip = tipo_recebimento(
              tipo_recebimentoType['itens'][i]['id'],
              tipo_recebimentoType['itens'][i]['id_empresa'],
              tipo_recebimentoType['itens'][i]['descricao'],
              tipo_recebimentoType['itens'][i]['permite_troco'],
              tipo_recebimentoType['itens'][i]['tipo_forma'],
              tipo_recebimentoType['itens'][i]['status'],
              tipo_recebimentoType['itens'][i]['listar_pdv'],
              tipo_recebimentoType['itens'][i]['id_pcontas'],
              tipo_recebimentoType['itens'][i]['tef'],
              tipo_recebimentoType['itens'][i]['id_fpagto'],
              tipo_recebimentoType['itens'][i]['pix_integrado'],
              tipo_recebimentoType['itens'][i]['imp_comprovante'],
              tipo_recebimentoType['itens'][i]['cortesia'],
              tipo_recebimentoType['itens'][i]['obrigar_nfce'],
              tipo_recebimentoType['itens'][i]['solicitar_senha'],
            );

            lista_tipo_recebimento.add(tip);
          }

          isar.writeTxn(() async {
            await isar.tipo_recebimentos.putAll(lista_tipo_recebimento);
          });
          return isar;
        }
      } catch (e) {
        return Container();
      }
    }
  }

  //stream para buscar dados da tabela tipo_recebimento
  Stream<List<tipo_recebimento>> listenTipo_recebimento() async* {
    final isar = await db;
    yield* isar.tipo_recebimentos
        .where()
        .sortById_empresa()
        .watch(fireImmediately: true);
  }

  //busca o tipo de recebimento de acordo com o id
  Future<tipo_recebimento?> search_tipoRecebimento(int id) async {
    final isar = await db;

    var tipo = await isar.tipo_recebimentos.filter().idEqualTo(id).findFirst();

    return tipo;
  }

  //busca o tipo de recebimento de acordo com a descrição
  Future<int?> search_tipoRecebimentoIdByDesc(String desc) async {
    final isar = await db;

    var tipo = await isar.tipo_recebimentos
        .filter()
        .descricaoEqualTo(desc)
        .findFirst();

    if (tipo != null) {
      return tipo.id;
    } else {
      return null;
    }
  }

  //metodos para inserir dados no banco ########################################################

  //inserir dados na tabela caixa
  Future<int?> insertCaixa(caixa caixa) async {
    final isar = await db;

    int? idCaixa;
    //inserindo dados na tabela caixa
    isar.writeTxn(() async {
      idCaixa = await isar.caixas.put(caixa);
    });

    return idCaixa;
  }

  //inserir dados na tabela caixa e caixaItem
  Future<Isar> insertCaixaWithCaixaItem(caixa caixa, DateTime atualDate,
      String hourFormatted, double openRegisterDouble, int? idUser) async {
    final isar = await db;
    PrinterController printerController = Dependencies.printerController();
    Configcontroller configcontroller = Dependencies.configcontroller();
    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();

    var tamanhoImpressora = configcontroller.tamanhoImpressora.value;
    caixa_item caixaItem = caixa_item();

    String atualDateFormatted = DatetimeFormatterWidget.formatDate(atualDate);

    await isar.writeTxn(() async {
      await isar.caixas.put(caixa);

      var descricao = 'ABERTURA DE CAIXA';

      await CaixaItemServidorRepository().caixaItemServidor(idUser,
          atualDateFormatted, hourFormatted, openRegisterDouble, descricao);

      caixaItem = caixa_item()
        ..id_caixa = caixa.id_caixa
        ..descricao = descricao
        ..data = atualDate
        ..hora = hourFormatted
        ..id_tipo_recebimento = 1
        ..valor_cre = openRegisterDouble
        ..valor_deb = 0
        ..id_venda = null
        ..enviado = responseServidorController.enviado.value;

      await isar.caixa_items.put(caixaItem);
    });
    if (tamanhoImpressora != 'SEM IMPRESSORA') {
      var printerPopupController = Dependencies.printerPopupController();
      printerPopupController.isButtonEnabled.value = true;
      await Get.dialog(
        PrinterPopup(onPrint: () async {
          printerPopupController.toggleButton();
          await printerController.printOpenRegister(caixaItem);
          Get.back();
        }),
      );
    }
    return isar;
  }

  //busca dados da empresa cadastrada nas configurações
  Future<empresa?> searchEmpresa() async {
    final isar = await db;

    var empresa = await isar.empresas.where().findFirst();

    return empresa;
  }

  //inserir dados na tabela venda e vendaItem ****** ainda vai ter o caixaItem junto ******
  Future<Isar> insertVendaWithVendaItemAndCaixaItem(
      BuildContext context, venda venda) async {
    final isar = await db;
    PdvController pdvController = Dependencies.pdvController();
    PaymentController paymentController = Dependencies.paymentController();
    PrinterController printerController = Dependencies.printerController();
    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();
    GlobalController globalController = Dependencies.globalController();

    isar.writeTxn(() async {
      await isar.vendas.put(venda);
      List<caixa_item> caixaItems = [];

      List<venda_item> vendaItems = [];

      if (responseServidorController.xmlNotaFiscal.value == true) {
        for (var i = 0; i < pdvController.pedidos.length; i++) {
          venda_item vendaItem = venda_item()
            ..id_venda = venda.id_venda
            ..id_produto = pdvController.pedidos[i]['idProduto']
            ..item = i + 1
            ..vlr_vendido = double.parse(
                pdvController.pedidos[i]['price'].toStringAsFixed(2))
            ..qtde = pdvController.pedidos[i]['quantidade']
            ..tot_bruto = double.parse(
                pdvController.pedidos[i]['total'].toStringAsFixed(2))
            ..grade = pdvController.pedidos[i]['unidade'];

          vendaItems.add(vendaItem);
        }

        int? idPayment = 0;
        for (var i = 0; i < paymentController.paymentsTotal.length; i++) {
          idPayment = await search_tipoRecebimentoIdByDesc(
              paymentController.paymentsTotal[i]['nome']);

          var valuePayment = double.parse(
              paymentController.paymentsTotal[i]['valor'].replaceAll(',', '.'));
          caixa_item caixaItem = caixa_item()
            ..id_caixa = venda.id_caixa
            ..descricao = 'VENDA'
            ..data = venda.data
            ..hora = venda.hora
            ..id_tipo_recebimento = idPayment!
            ..valor_deb = 0
            ..id_venda = venda.id_venda
            ..enviado = 1;

          if (paymentController.paymentsTotal[i]['nome'] == 'DINHEIRO') {
            caixaItem.valor_cre = venda.valor_troco > 0
                ? valuePayment - venda.valor_troco
                : valuePayment;
          } else {
            caixaItem.valor_cre = valuePayment;
          }
          caixaItems.add(caixaItem);
          paymentController.caixaItems.add(caixaItem);
        }
        await isar.venda_items.putAll(vendaItems);
        await isar.caixa_items.putAll(caixaItems);

        await printerController.printVendas(venda, vendaItems);
        for (var element in paymentController.paymentTefId) {
          String comprovante = '';
          var comp = await getCartaoItemById(element);
          if (comp != null) {
            comprovante = comp.imagem_comprovante;

            paymentController.updateComprovanteTef(comprovante);
            // printerController.printTransactionCard(comprovante);
            await updateCartaoItem(element, venda.id_venda);
            /*print('imprimindo imagem de transação: ${comprovante}');*/
          }
        }

        var idCaixaServidor =
            await globalController.updateCaixaAbertaId(globalController.userId);

        String cpfCnpj;
        if (responseServidorController.cpfCnpj.isEmpty ||
            responseServidorController.cpfCnpj == '') {
          cpfCnpj = '';
        } else {
          cpfCnpj = responseServidorController.cpfCnpj;
        }

        await VendaServidorRepository().vendaToServer(
            context,
            venda,
            caixaItems,
            pdvController,
            paymentController,
            idCaixaServidor,
            cpfCnpj);

        /* print(responseServidorController.cpfCnpj);
        String cpfCnpj;
        if (responseServidorController.cpfCnpj.isEmpty ||
            responseServidorController.cpfCnpj == '') {
          cpfCnpj = '';
        } else {
          cpfCnpj = responseServidorController.cpfCnpj;
        }

        Future.delayed(const Duration(milliseconds: 300));
        await PostOnServidor.postOnServidor(
            venda,
            caixaItems,
            pdvController,
            paymentController,
            responseServidorController.idVendaServidor.value,
            cpfCnpj);*/
      } else {}

      if (responseServidorController.xmlNotaFiscal.value == true) {
        nfce_resultado nfce = nfce_resultado()
          ..id_caixa = venda.id_caixa
          ..id_venda = paymentController.idVenda
          ..qr_code = paymentController.qrCode.value
          ..xml = paymentController.xml.value;

        await isar.nfce_resultados.put(nfce);
      }
      if (responseServidorController.xmlNotaFiscal.value == true) {
        var vendas = await isar.vendas.get(venda.id_venda);

        if (vendas != null) {
          vendas.id_venda_servidor =
              responseServidorController.idVendaServidor.value;
          vendas.enviado = responseServidorController.enviado.value;
          isar.vendas.put(vendas);
        }

        pdvController.zerarCampos();
        paymentController.paymentsTotal.clear();
        paymentController.clearPaymentTef();
      }
    });
    return isar;
  }

  //busca dados da tabela caixa do banco de dados
  Future<caixa?> getCaixaFromDatabase() async {
    final isar = await db;

    var caixaId = await isar.caixas.where().findFirst();
    if (caixaId != null) {
      return caixaId;
    } else {
      return null;
    }
  }

  //buscar id caixa na tabela 'caixa'
  Future<int?> getIdCaixa(int aberturaIdUser) async {
    final isar = await db;

    caixa? caixas = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(aberturaIdUser)
        .statusEqualTo(0)
        .findFirst();
    if (caixas != null) {
      return caixas.id_caixa;
    } else {
      return null;
    }
  }

  //buscar caixa de acordo com o idUser
  Future<caixa?> getCaixaWithIdUser(int aberturaIdUser) async {
    final isar = await db;

    caixa? caixas = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(aberturaIdUser)
        .statusEqualTo(0)
        .findFirst();
    if (caixas != null) {
      return caixas;
    } else {
      return null;
    }
  }

  //encontrar o id_caixa_servidor
  Future<int?> getIdCaixaServidor(int aberturaIdUser) async {
    final isar = await db;
    caixa? caixas = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(aberturaIdUser)
        .statusEqualTo(0)
        .findFirst();
    if (caixas != null) {
      return caixas.id_caixa_servidor;
    } else {
      return null;
    }
  }

  //inserir dados na tabela caixaItem
  Future<Isar> insertCaixaItem(caixa_item caixaItem) async {
    final isar = await db;
    var printerController = Dependencies.printerController();
    var configController = Dependencies.configcontroller();
    var tamanhoImpressora = configController.tamanhoImpressora.value;

    isar.writeTxn(() async {
      await isar.caixa_items.put(caixaItem);

      if (tamanhoImpressora != 'SEM IMPRESSORA') {
        var printerPopupController = Dependencies.printerPopupController();
        var globalController = Dependencies.globalController();
        printerPopupController.isButtonEnabled.value = true;
        await Get.dialog(
          PrinterPopup(onPrint: () async {
            printerPopupController.toggleButton();
            await printerController.printMovimentationCaixa(
                caixaItem, globalController.userId);
            Get.back();
          }),
        );
      }
    });
    return isar;
  }

  // busca o login do usuario
  Future<String?> getLoginFromDatabase(String login) async {
    final isar = await db;

    usuario? usuarioUser =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuarioUser != null) {
      return usuarioUser
          .login; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return "";
    }
  }

  //busca a senha do usuario
  Future<String?> getPasswordFromDatabase(String login) async {
    final isar = await db;

    usuario? usuarioUser =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    //verifica se o usuario existe
    if (usuarioUser != null) {
      return usuarioUser.senha;
    } else {
      return "";
    }
  }

  //buscar informações de acordo com a url e o numero do contrato
  Future<String> getIpEmpresa(BuildContext context,
      {bool isCorrectUrl = false}) async {
    try {
      Uri getIpEmpresa = Uri.parse(Endpoints().ipEmpresa());
      final response = await http.get(
        getIpEmpresa,
        headers: _headers,
      );

      if (response.statusCode != 200 && isCorrectUrl == false) {
        throw Exception(
          'Não foi possível encontrar os itens do banco de dados',
        );
      }

      if (response.statusCode == 200) {
        var ip = jsonDecode(utf8.decode(response.bodyBytes));
        if (ip != null &&
            ip['itens'] != null &&
            ip['itens'][0]['link'] != null) {
          String link = ip['itens'][0]['link'];
          return link;
        } else {
          !isCorrectUrl
              ? const CustomCherryError(
                  message: 'Numero de contrato inválido',
                ).show(context)
              : '';
        }
      }
    } catch (e) {
      const CustomCherryError(
        message:
            'Falha ao buscar dados da empresa. Tente novamente mais tarde!',
      ).show(context);
    }
    return "";
  }

  //criar um listen que faz a busca dos dados da tabela 'Dado_empresa'
  Future<dado_empresa?> getDataEmpresa() async {
    final isar = await db;
    try {
      return await isar.dado_empresas.where().findFirst();
    } catch (e) {
      return null;
    }
  }

  //inserir dados na tabela 'Dado_empresa'
  Future<Object> insertDadosEmpresariais(
      BuildContext context, dado_empresa empresa) async {
    try {
      final isar = await db;

      int i = await isar.dado_empresas.count();

      if (i > 0) {
        isar.writeTxn(
          () async {
            await isar.dado_empresas.clear();
            await isar.dado_empresas.put(empresa);
          },
        );
      }

      //inserindo dados na tabela 'Dados Empresariais'
      isar.writeTxn(() async {
        await isar.dado_empresas.put(empresa);
      });
      return isar;
    } catch (e) {
      CustomCherryError(
        message:
            "Erro ao inserir dados da empresa. Tente novamente mais tarde!",
      ).show(context);
      logger.e('erro ao inserir dados da empresa: $e');
      return '';
    }
  }

  //deletar dados na tabela 'Dado_empresa'
  Future<Isar> deleteDadosEmpresariais() async {
    final isar = await db;
    isar.writeTxn(() async {
      await isar.dado_empresas.clear();
    });
    return isar;
  }

  // BUSCA LISTA DE USUARIOS
  Future<List<String>> getUsersLogin() async {
    final isar = await db;

    try {
      var users = await isar.usuarios.where().findAll();

      return users
          .map((e) => e.login)
          .where((login) => login != null)
          .cast<String>()
          .toList();
    } catch (e) {
      return [];
    }
  }

  //cria um usuario na tabela 'Usuarios'
  Future<Isar> insertUser(usuario_logado user) async {
    final isar = await db;

    int i = await isar.usuario_logados.count();

    if (i > 0) {
      isar.writeTxn(() async {
        await isar.usuario_logados.clear();
      });
    }

    isar.writeTxn(() async {
      await isar.usuario_logados.put(user);
    });

    Get.toNamed(PagesRoutes.homePageRoute);
    return isar;
  }

  //buscar todos os dados do login com as verificações
  Future<int?> getUserIdColaborador(String login) async {
    final isar = await db;

    usuario? usuariosUser =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuariosUser != null) {
      return usuariosUser
          .id_colaborador; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return null;
    }
  }

  //deletar todos os dados do usuario logado
  Future<void> deleteLoggedUser() async {
    final isar = await db;

    isar.writeTxn(() async {
      await isar.usuario_logados.clear();
    });
  }

  //buscar o id do Usuario logado
  Future<int?> getUserIdUser(String login) async {
    final isar = await db;

    usuario? usuariosUser =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuariosUser != null) {
      return usuariosUser
          .id; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return null;
    }
  }

  //buscar o objeto do usuario logado
  Future<usuario_logado?> getUserLogged() async {
    final isar = await db;

    usuario_logado? usuario =
        await isar.usuario_logados.filter().idEqualTo(1).findFirst();

    if (usuario != null) {
      return usuario;
    }

    return null;
  }

  //busca o id do caixa de acordo com o idUser e status 0
  Future<int?> getCaixaIdWithIdUserAndStatus0() async {
    final isar = await db;
    try {
      usuario_logado? usuariologado =
          await isar.usuario_logados.filter().idEqualTo(1).findFirst();

      caixa? caixas = await isar.caixas
          .filter()
          .abertura_id_userEqualTo(usuariologado!.id_user!)
          .statusEqualTo(0)
          .findFirst();

      if (caixas != null) {
        return caixas.id_caixa;
      }
    } catch (e) {
      logger.e('erro ao buscar caixa: $e');
      return 0;
    }

    return 0;
  }

  //busca o objeto do caixa de acordo com o idUser e status 0
  Future<caixa?> getCaixaWithIdUserAndStatus0() async {
    final isar = await db;
    usuario_logado? usuariologado =
        await isar.usuario_logados.filter().idEqualTo(1).findFirst();

    caixa? caixas = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(usuariologado!.id)
        .statusEqualTo(0)
        .findFirst();

    if (caixas != null) {
      return caixas;
    }

    return null;
  }

  //busca o objeto do caixa de acordo com o idUser e status 0
  Future<caixa?> getCaixaItemValue() async {
    final isar = await db;
    usuario_logado? usuariologado =
        await isar.usuario_logados.filter().idEqualTo(1).findFirst();

    caixa? caixas = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(usuariologado!.id)
        .statusEqualTo(0)
        .findFirst();
    if (caixas != null) {
      return caixas;
    }

    return null;
  }

  //verifica se o usuario possui caixa aberto
  Future<bool> checkUserCaixa(int idUser) async {
    final isar = await db;

    caixa? usuario = await isar.caixas
        .filter()
        .abertura_id_userEqualTo(idUser)
        .statusEqualTo(0)
        .findFirst();

    int status = usuario?.status ?? 1;

    if (usuario?.status == 0 && status == 0) {
      return true;
    } else {
      return false;
    }
  }

  //Encontrar a data de abertura do caixa
  Future<DateTime?> getDateCaixa(int idUser) async {
    final isar = await db;

    caixa? usuario =
        await isar.caixas.filter().abertura_id_userEqualTo(idUser).findFirst();

    if (usuario != null) {
      return usuario.abertura_data;
    } else {
      return null;
    }
  }

  //salvar dados da impressora padrão se já houver alguma salva, ele substitui
  Future<Isar> insertDefaultPrinter(default_printer printer) async {
    final isar = await db;

    int i = await isar.default_printers.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.default_printers.clear();
          await isar.default_printers.put(printer);
        },
      );
    }

    isar.writeTxn(() async {
      await isar.default_printers.put(printer);
    });
    return isar;
  }

  //busca o dado da impressora padrão
  Future<default_printer?> getDefaultPrinter() async {
    final isar = await db;

    return await isar.default_printers.where().findFirst();
  }

  //cria o fechamento de caixa
  Future<Isar> insertCaixaFechamento(
      List<caixa_fechamento> caixaFechamento) async {
    final isar = await db;
    IsarService service = IsarService();

    ResponseServidorController responseServidorController =
        Dependencies.responseServidorController();

    var hourFormatted = DatetimeFormatterWidget.formatHour(DateTime.now());
    var dadosUsuario = await service.getUserLogged();

    caixa? caixas = await isar.caixas.get(caixaFechamento[0].id_caixa);

    if (caixas != null) {
      caixas.enviado = responseServidorController.enviado.value;
      caixas.status = 1;
      caixas.fechou_data = DateTime.now();
      caixas.fechou_hora = hourFormatted;
      caixas.fechou_id_user = dadosUsuario!.id_user;

      isar.writeTxn(() async {
        await isar.caixas.put(caixas);
        await isar.caixa_fechamentos.putAll(caixaFechamento);
      });
    }
    return isar;
  }

  //cria um registro na tabela cartao_item
  Future<Isar> insertCartaoItem(cartao_item cartaoItem) async {
    PaymentController controller = Dependencies.paymentController();
    final isar = await db;
    isar.writeTxn(() async {
      await isar.cartao_items.put(cartaoItem);
      controller.updatePaymentTefId(cartaoItem.id);
    });
    return isar;
  }

  //buscar o cartaoItem pelo id
  Future<cartao_item?> getCartaoItemById(int id) async {
    final isar = await db;

    try {
      return await isar.cartao_items.where().idEqualTo(id).findFirst();
    } catch (e) {
      // Lida com qualquer exceção que possa ocorrer
      logger.e("Erro ao buscar item: $e");
      return null;
    }
  }

  //atualiza os dados do cartao_item
  Future<void> updateCartaoItem(int id, int idVenda) async {
    final isar = await db;

    final cartao = await isar.cartao_items.where().idEqualTo(id).findFirst();

    if (cartao != null) {
      cartao.id_venda = idVenda;
      await isar.cartao_items.put(cartao);
    } else {
      logger.e("Erro ao buscar item: $id");
    }
  }

  //busca todos os dados da tabela cartao_item
  Stream<List<cartao_item>> listenCartaoItem() async* {
    final isar = await db;
    yield* isar.cartao_items
        .where()
        .sortByData_lanca()
        .watch(fireImmediately: true);
  }

  //busca todos os dados da tabela nfce_resultado
  Stream<List<nfce_resultado>> listenNfceResultados() async* {
    final isar = await db;
    try {
      yield* isar.nfce_resultados
          .where()
          .sortById_venda()
          .watch(fireImmediately: true);
    } catch (e) {
      logger.e("Erro ao buscar nfce: $e");
    }
  }

  //busca todos os dados da tabela nfce_resultado
  Future<List<nfce_resultado?>> getNfceResultados() async {
    final isar = await db;

    try {
      return await isar.nfce_resultados.where().findAll();
    } catch (e) {
      logger.e("Erro ao buscar nfce: $e");
      return [];
    }
  }

  //deletar todos os dados da tabela cartao_item
  Future<void> deleteCartaoItem() async {
    final isar = await db;

    int i = await isar.cartao_items.count();

    if (i >= 0) {
      isar.writeTxn(() async {
        await isar.cartao_items.clear();
      });
    }
  }

  //busca os dados da tabela empresa
  Future<empresa?> getDadoTabelaEmpresa() async {
    final isar = await db;

    try {
      var empresa = await isar.empresas.where().findFirst();
      return empresa;
    } catch (e) {
      logger.e("Erro ao buscar empresa: $e");
      return null;
    }
  }

  // busca os dados da tabela nfce pelo id da venda
  Future<nfce_resultado?> getDadosNfce(int idVenda) async {
    final isar = await db;
    try {
      var nfce = await isar.nfce_resultados.get(idVenda);
      return nfce;
    } catch (e) {
      logger.e("Erro ao buscar nfce: $e");
      return null;
    }
  }

  // busca os dados da tabela nfce pelo id da venda gerada pelo servidor
  Future<nfce_resultado?> getDadosNfceByIdVendaServidor(
      int idVendaServidor) async {
    final isar = await db;
    try {
      var nfce = await isar.nfce_resultados
          .filter()
          .id_vendaEqualTo(idVendaServidor)
          .findFirst();
      return nfce;
    } catch (e) {
      logger.e("Erro ao buscar nfce: $e");
      return null;
    }
  }

  // busca os dados da tabela vendas
  Future<List<venda?>> getVendas() async {
    final isar = await db;

    var vendasDb = await isar.vendas.where().findAll();

    if (vendasDb.isNotEmpty) {
      return vendasDb;
    } else {
      return [];
    }
  }

  // busca os dados da tabela vendas pelo id do caixa logado
  Future<List<venda?>> getVendaByIdCaixaLogged(int idUser) async {
    final isar = await db;

    var vendasDb = await isar.vendas.filter().id_caixaEqualTo(idUser).findAll();
    try {
      if (vendasDb.isNotEmpty) {
        return vendasDb;
      } else {
        logger.e('Nenhuma venda encontrada');
        return [];
      }
    } catch (e) {
      logger.e("Erro ao buscar venda: $e");
      return [];
    }
  }

  // insere os dados o contrato e data limite na tabela
  Future<Isar> insertEmpresaValida(
      dynamic response, BuildContext context) async {
    final isar = await db;

    //verifica se o registro ja existe
    var i = await isar.empresa_validas.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.empresa_validas.clear();
        },
      );
    }

    try {
      empresa_valida dadosEmpresa = empresa_valida()
        ..nocontrato = response['itens'][0]['nucontrato']
        ..data_limite = DateTime.parse(response['itens'][0]['data_limite']);

      await isar.writeTxn(() async {
        await isar.empresa_validas.put(dadosEmpresa);
      });
      Get.back();
      return isar;
    } catch (e) {
      logger.e("Erro ao inserir dados do contrato: $e");
      return isar;
    }
  }

  // deleta a data da tabela empresa_valida
  Future<Isar> updateDadoTabelaContrato() async {
    final isar = await db;

    try {
      isar.writeTxn(() async {
        var empresa = await isar.empresa_validas.where().findFirst();
        if (empresa != null) {
          empresa.data_limite = null;
          await isar.empresa_validas.put(empresa);
        }
      });

      return isar;
    } catch (e) {
      logger.e("Erro ao alterar dados do contrato: $e");
      return isar;
    }
  }

  //busca os dados da tabela empresa_valida
  Future<empresa_valida?> getDadoTabelaEmpresaValida() async {
    final isar = await db;

    try {
      var empresa = await isar.empresa_validas.where().findFirst();
      return empresa;
    } catch (e) {
      logger.e("Erro ao buscar empresa: $e");
      return null;
    }
  }

  //abre o banco de dados
  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();

    if (Isar.instanceNames.isEmpty) {
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
          Empresa_validaSchema
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
