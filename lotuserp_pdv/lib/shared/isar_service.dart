// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/caixa.dart';
import 'package:lotuserp_pdv/collections/caixa_item.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/collections/default_printer.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/produto_grupo.dart';
import 'package:lotuserp_pdv/collections/tipo_recebimento.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/collections/usuario_logado.dart';
import 'package:lotuserp_pdv/collections/venda.dart';
import 'package:lotuserp_pdv/collections/venda_item.dart';
import 'package:lotuserp_pdv/controllers/payment_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/controllers/printer_controller.dart';
import 'package:lotuserp_pdv/pages/common/custom_snack_bar.dart';
import 'package:lotuserp_pdv/services/datetime_formatter_widget.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../collections/caixa_fechamento.dart';
import '../collections/cartao_item.dart';
import '../core/app_routes.dart';
import '../services/injection_dependencies.dart';

Map<String, String> _headers = {
  'content-type': 'application/json',
  'ptoken': 'ed9a811327979c9382ffd6361cfc5013'
};

class IsarService {
  late Future<Isar> db;

  var logger = Logger();

  //chama o método para abrir o banco de dados e atribui a variável db
  IsarService() {
    db = openDB();
  }

  //buscar ipEmpresa na tabela 'Dados Empresarias'
  Future<dado_empresa?> getIpEmpresaFromDatabase() async {
    final isar = await db;
    final ipEmpresa = await isar.dado_empresas.where().findFirst();

    if (ipEmpresa == null) {
      throw Exception("Nenhum registro encontrado na tabela 'dado_empresa'.");
    }

    return ipEmpresa;
  }

  //inserindo dados na tabela empresa vindos do servidor
  Future getEmpresa(String companyId, String companyIp) async {
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
          empresas['itens'][0]['usar_paf_nfce'],
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
      Get.snackbar(
        'Erro', // Título
        'Não foi possível obter os dados da empresa. Tente novamente mais tarde.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      // Usando Logger para registrar a exceção
      logger.e('Erro ao obter ou processar dados da empresa: $e');

      return null;
    }
  }

  //verifica se tem dados na tabela empresa
  Future<int> empresaCount() async {
    final isar = await db;
    return isar.empresas.count();
  }

  //inserindo dados na tabela grupo vindos do servidor
  Future getGrupo() async {
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
      Get.snackbar(
        'Erro',
        'Dados da empresa não encontrados.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
      Get.snackbar(
        'Erro',
        'Não foi possível obter os dados dos grupos. Tente novamente mais tarde.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      logger.e('Erro ao obter ou processar dados dos grupos: $e');

      return null;
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

  //inserindo dados na tabela produtos vindos do servidor
  Future getProduto() async {
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

  //stream para buscar dados da tabela produtos
  Stream<List<produto>> listenProdutos() async* {
    final isar = await db;
    yield* isar.produtos.where().sortById_grupo().watch(fireImmediately: true);
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
  Future getUsuarios() async {
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

  //busca tipo_recebimento do servidor e insere na tabela do banco de dados local
  Future getTipo_recebimento() async {
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
      String hourFormatted, double openRegisterDouble) async {
    final isar = await db;
    PrinterController printerController =
        Dependencies.printerController();

    caixa_item caixaItem = caixa_item();

    await isar.writeTxn(() async {
      await isar.caixas.put(caixa);

      caixaItem = caixa_item()
        ..id_caixa = caixa.id_caixa
        ..descricao = 'ABERTURA DE CAIXA'
        ..data = atualDate
        ..hora = hourFormatted
        ..id_tipo_recebimento = 1
        ..valor_cre = openRegisterDouble
        ..valor_deb = 0
        ..id_venda = null
        ..enviado = 0;

      await isar.caixa_items.put(caixaItem);
    });
    await printerController.printOpenRegister(caixaItem);
    return isar;
  }

  //busca dados da empresa cadastrada nas configurações
  Future<empresa?> searchEmpresa() async {
    final isar = await db;

    var empresa = await isar.empresas.where().findFirst();

    return empresa;
  }

  //inserir dados na tabela venda e vendaItem ****** ainda vai ter o caixaItem junto ******
  Future<Isar> insertVendaWithVendaItemAndCaixaItem(venda venda) async {
    final isar = await db;
    PdvController pdvController = Dependencies.pdvController();
    PaymentController paymentController =
        Dependencies.paymentController();
    PrinterController printerController =
        Dependencies.printerController();

    isar.writeTxn(() async {
      await isar.vendas.put(venda);

      List<venda_item> vendaItems = [];

      for (var i = 0; i < pdvController.pedidos.length; i++) {
        venda_item vendaItem = venda_item()
          ..id_venda = venda.id_venda
          ..id_produto = pdvController.pedidos[i]['idProduto']
          ..item = i + 1
          ..vlr_vendido =
              double.parse(pdvController.pedidos[i]['price'].toStringAsFixed(2))
          ..qtde = pdvController.pedidos[i]['quantidade']
          ..tot_bruto =
              double.parse(pdvController.pedidos[i]['total'].toStringAsFixed(2))
          ..grade = pdvController.pedidos[i]['unidade'];

        vendaItems.add(vendaItem);
      }

      List<caixa_item> caixaItems = [];

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
          ..enviado = 0;

        if (paymentController.paymentsTotal[i]['nome'] == 'DINHEIRO') {
          caixaItem.valor_cre = venda.valor_troco > 0
              ? valuePayment - venda.valor_troco
              : valuePayment;
        } else {
          caixaItem.valor_cre = valuePayment;
        }
        caixaItems.add(caixaItem);
      }
      await isar.venda_items.putAll(vendaItems);
      await isar.caixa_items.putAll(caixaItems);

      await printerController.printVendas(venda, vendaItems);
      for (var element in paymentController.paymentTefId) {
        String comprovante = '';
        var comp = await getCartaoItemById(element);
        if (comp != null) {
          comprovante = comp.imagem_comprovante;

          printerController.printTransactionCard(comprovante);
          await updateCartaoItem(element, venda.id_venda);
          /*print('imprimindo imagem de transação: ${comprovante}');*/
        }
      }
      pdvController.zerarCampos();
      paymentController.paymentsTotal.clear();
      paymentController.clearPaymentTef();
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
        .findFirst();
    if (caixas != null) {
      return caixas;
    } else {
      return null;
    }
  }

  //inserir dados na tabela caixaItem
  Future<Isar> insertCaixaItem(caixa_item caixaItem) async {
    final isar = await db;
    var printerController = Dependencies.printerController();

    isar.writeTxn(() async {
      await isar.caixa_items.put(caixaItem);
      await printerController.printMovimentationCaixa(caixaItem);
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
  Future<String> getIpEmpresa({bool isCorrectUrl = false}) async {
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
              ? const CustomSnackBar(
                  message: 'Numero de contrato inválido',
                ).show()
              : '';
        }
      }
    } catch (e) {
      const CustomSnackBar(
        message:
            'Falha ao buscar dados da empresa. Tente novamente mais tarde!',
      ).show();
    }
    return "";
  }

  //criar um listen que faz a busca dos dados da tabela 'Dados Empresariais'
  Future<dado_empresa?> getDataEmpresa() async {
    final isar = await db;
    return await isar.dado_empresas.where().findFirst();
  }

  //inserir dados na tabela 'Dados Empresariais'
  Future<Object> insertDadosEmpresariais(dado_empresa empresa) async {
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
      return Get.snackbar("Erro",
          "Erro ao inserir dados da empresa. Tente novamente mais tarde!",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  //deletar dados na tabela 'Dados Empresariais'
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

    var hourFormatted = DatetimeFormatterWidget.formatHour(DateTime.now());
    var dadosUsuario = await service.getUserLogged();

    caixa? caixas = await isar.caixas.get(caixaFechamento[0].id_caixa);

    if (caixas != null) {
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

  Future<void> deleteCartaoItem() async {
    final isar = await db;

    int i = await isar.cartao_items.count();

    if (i >= 0) {
      isar.writeTxn(() async {
        await isar.produto_grupos.clear();
      });
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
          Cartao_itemSchema
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
