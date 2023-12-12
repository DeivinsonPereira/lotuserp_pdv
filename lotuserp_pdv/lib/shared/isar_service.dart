import 'dart:convert';

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
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers = {
  'content-type': 'application/json',
  'ptoken': 'ed9a811327979c9382ffd6361cfc5013'
};

class IsarService {
  late Future<Isar> db;

  //chama o método para abrir o banco de dados e atribui a variável db
  IsarService() {
    db = openDB();
  }
  //buscar ipEmpresa na tabela 'Dados Empresarias'
  Future<DadoEmpresa?> getIpEmpresaFromDatabase() async {
    final isar = await db;

    return await isar.dadoEmpresas.where().findFirst();
  }

  //inserindo dados na tabela empresa vindos do servidor
  Future getEmpresa(int companyId) async {
    final isar = await db;
    int i = await isar.empresas.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.empresas.clear();
        },
      );
    }

    DadoEmpresa? dadoEmpresa = await getIpEmpresaFromDatabase();

    var ipEmpresaUrl = '';
    var idEmpresaNum = 0;

    if (dadoEmpresa != null) {
      ipEmpresaUrl = dadoEmpresa.ipEmpresa!;
      idEmpresaNum = dadoEmpresa.idEmpresa!;
    }

    Uri getEmpresa = Uri.parse(
        '${ipEmpresaUrl}pdvmobget01_empresa?pidEmpresa=$idEmpresaNum');
    final response = await http.get(
      getEmpresa,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      var empresa = jsonDecode(utf8.decode(response.bodyBytes));

      final emp = Empresa(
          empresa['itens'][0]['id'],
          empresa['itens'][0]['razao'],
          empresa['itens'][0]['fantasia'],
          empresa['itens'][0]['cnpj'],
          empresa['itens'][0]['insc_estadual'],
          empresa['itens'][0]['insc_municipal'],
          empresa['itens'][0]['fone1'],
          empresa['itens'][0]['fone2'],
          empresa['itens'][0]['fone3'],
          empresa['itens'][0]['endereco'],
          empresa['itens'][0]['bairro'],
          empresa['itens'][0]['numero'],
          empresa['itens'][0]['municipio'],
          empresa['itens'][0]['municipio_uf'],
          empresa['itens'][0]['cep'],
          empresa['itens'][0]['email'],
          empresa['itens'][0]['site'],
          empresa['itens'][0]['complemento'],
          empresa['itens'][0]['estoque_grade'],
          empresa['itens'][0]['usar_paf_nfce'],
          empresa['itens'][0]['param_nf_crt'],
          empresa['itens'][0]['param_pdv_usar_pvista_pprazo'],
          empresa['itens'][0]['param_vendas_tpcomissao'],
          empresa['itens'][0]['param_vendas_portador'],
          empresa['itens'][0]['param_vendas_descmaximo'].toDouble(),
          empresa['itens'][0]['param_pdv_codigopesagem'],
          empresa['itens'][0]['param_pdv_formapagto'],
          empresa['itens'][0]['param_pdv_cliente'],
          empresa['itens'][0]['param_pdv_bloq_est_neg'],
          empresa['itens'][0]['param_pdv_validar_cx_fechado'],
          empresa['itens'][0]['param_pdv_senha_cancelar'],
          empresa['itens'][0]['param_pdv_imp_cp_nf_venda'],
          empresa['itens'][0]['param_pdv_prodcomposto'],
          empresa['itens'][0]['param_pdv_informa_cliente'],
          empresa['itens'][0]['param_pdv_vendedor_venda'],
          empresa['itens'][0]['param_pdv_cartao_gerarparc'],
          empresa['itens'][0]['param_pdv_imp_comprovante'],
          empresa['itens'][0]['param_pdv_permitir_desconto'],
          empresa['itens'][0]['param_pdv_tipo_desconto'],
          empresa['itens'][0]['param_pdv_gerar_senha'],
          empresa['itens'][0]['param_pdv_comanda_producao']);
      isar.writeTxn(() async {
        await isar.empresas.put(emp);
      });
      return isar;
    } else {
      throw Exception('Não foi possível encontrar os itens do banco de dados');
    }
  }

  //stream para buscar dados da tabela empresa
  Stream<List<Empresa>> listenEmpresa() async* {
    final isar = await db;
    yield* isar.empresas.where().sortByRazao().watch(fireImmediately: true);
  }

  //inserindo dados na tabela grupo vindos do servidor
  Future getGrupo(int companyId) async {
    final isar = await db;
    int i = await isar.grupoProdutos.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.grupoProdutos.clear();
        },
      );
    }

    DadoEmpresa? dadoEmpresa = await getIpEmpresaFromDatabase();

    var ipEmpresaUrl = '';
    var idEmpresaNum = 0;

    if (dadoEmpresa != null) {
      ipEmpresaUrl = dadoEmpresa.ipEmpresa!;
      idEmpresaNum = dadoEmpresa.idEmpresa!;
    }

    Uri getGrupo = Uri.parse(
        '${ipEmpresaUrl}pdvmobget03_produtos_grupos?pidEmpresa=$idEmpresaNum');
    final response = await http.get(
      getGrupo,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> grupo = jsonDecode(utf8.decode(response.bodyBytes));

      var grupoCount = grupo['itens'].length;

      final List<GrupoProduto> listaGrupo = [];

      for (int i = 0; i < grupoCount; i++) {
        final gru = GrupoProduto(
          grupo['itens'][i]['id_grupo'],
          grupo['itens'][i]['grupo_descricao'],
          grupo['itens'][i]['status'],
          grupo['itens'][i]['file_imagem'],
        );

        listaGrupo.add(gru);
      }

      isar.writeTxn(() async {
        await isar.grupoProdutos.putAll(listaGrupo);
      });
      return isar;
    } else {
      throw Exception('Não foi possível encontrar os itens do banco de dados');
    }
  }

  //stream para buscar dados da tabela grupo
  Stream<List<GrupoProduto>> listenGrupo() async* {
    final isar = await db;
    yield* isar.grupoProdutos
        .where()
        .sortByIdGrupo()
        .watch(fireImmediately: true);
  }

  //inserindo dados na tabela produtos vindos do servidor
  Future getProduto(int companyId) async {
    final isar = await db;
    int i = await isar.produtos.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.produtos.clear();
        },
      );
    }

    DadoEmpresa? dadoEmpresa = await getIpEmpresaFromDatabase();

    var ipEmpresaUrl = '';
    var idEmpresaNum = 0;

    if (dadoEmpresa != null) {
      ipEmpresaUrl = dadoEmpresa.ipEmpresa!;
      idEmpresaNum = dadoEmpresa.idEmpresa!;
    }

    Uri getProdutos = Uri.parse(
        '${ipEmpresaUrl}pdvmobget05_produtos?pidEmpresa=$idEmpresaNum');
    final response = await http.get(
      getProdutos,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> produto =
          jsonDecode(utf8.decode(response.bodyBytes));

      var produtosCount = produto['itens'].length;

      final List<Produto> listaProduto = [];

      for (int i = 0; i < produtosCount; i++) {
        DateTime? dataLimitePromocao;
        DateTime? dataInicioPromocao;
        if (produto['itens']?[i]?['promocao_data_limite'] != null) {
          dataLimitePromocao =
              DateTime.tryParse(produto['itens']?[i]?['promocao_data_limite']);
        } else {
          dataLimitePromocao = null;
        }

        if (produto['itens']?[i]?['promocao_data_inicio'] != null) {
          dataInicioPromocao =
              DateTime.parse(produto['itens']![i]['promocao_data_inicio']);
        } else {
          dataInicioPromocao = null;
        }
        final gru = Produto(
          produto['itens'][i]['id_empresa'],
          produto['itens'][i]['id_produto'],
          produto['itens'][i]['grade'],
          produto['itens'][i]['id_grupo'],
          produto['itens'][i]['descricao'],
          produto['itens'][i]['unidade'],
          produto['itens'][i]['gtin'],
          produto['itens'][i]['composto'],
          produto['itens'][i]['venda_kg'],
          produto['itens'][i]['nao_rec_desconto'],
          produto['itens'][i]['status'],
          produto['itens'][i]['saldo_produto'].toDouble(),
          produto['itens'][i]['pvenda'].toDouble(),
          produto['itens'][i]['alt_preco_venda'],
          produto['itens'][i]['alt_preco_venda_tipo'],
          produto['itens'][i]['balanca_tipo_pesagem'],
          produto['itens'][i]['balanca_idproduto'],
          produto['itens'][i]['gtin_grade'],
          produto['itens'][i]['promocao_ativar'],
          produto['itens'][i]['promocao_preco'].toDouble(),
          dataInicioPromocao,
          dataLimitePromocao,
          produto['itens'][i]['promocao_hora_inicial'],
          produto['itens'][i]['promocao_hora_final'],
          produto['itens'][i]['promocao_tipo_desc'],
          produto['itens'][i]['promocao_compre'],
          produto['itens'][i]['promocao_leve'],
          produto['itens'][i]['promocao_apartir'],
          produto['itens'][i]['promocao_apartir_perc'].toDouble(),
          produto['itens'][i]['file_imagem'],
        );

        listaProduto.add(gru);
      }

      isar.writeTxn(() async {
        await isar.produtos.putAll(listaProduto);
      });
      return isar;
    } else {
      throw Exception('Não foi possível encontrar os itens do banco de dados');
    }
  }

  //stream para buscar dados da tabela produtos
  Stream<List<Produto>> listenProdutos() async* {
    final isar = await db;
    yield* isar.produtos.where().sortByIdGrupo().watch(fireImmediately: true);
  }

  //inserindo dados na tabela usuarios vindos do servidor
  Future getUsuarios(int companyId) async {
    final isar = await db;
    int i = await isar.usuarios.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.usuarios.clear();
        },
      );
    }

    DadoEmpresa? dadoEmpresa = await getIpEmpresaFromDatabase();

    var ipEmpresaUrl = '';
    var idEmpresaNum = 0;

    if (dadoEmpresa != null) {
      ipEmpresaUrl = dadoEmpresa.ipEmpresa!;
      idEmpresaNum = dadoEmpresa.idEmpresa!;
    }

    Uri getUsuarios = Uri.parse(
        '${ipEmpresaUrl}pdvmobget02_usuarios?pidEmpresa=$idEmpresaNum');
    final response = await http.get(
      getUsuarios,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> usuario =
          jsonDecode(utf8.decode(response.bodyBytes));

      var usuariosCount = usuario['itens'].length;

      final List<Usuario> listaUsuarios = [];

      for (int i = 0; i < usuariosCount; i++) {
        final usu = Usuario(
          usuario['itens'][i]['id'],
          usuario['itens'][i]['login'],
          usuario['itens'][i]['id_colaborador'],
          usuario['itens'][i]['senha'],
          usuario['itens'][i]['status'],
          usuario['itens'][i]['mob_dashboard'],
          usuario['itens'][i]['trocar_senha'],
          usuario['itens'][i]['administrador'],
          usuario['itens'][i]['logar_empresas'],
          usuario['itens'][i]['caixa_abrir'],
          usuario['itens'][i]['caixa_movimentar'],
          usuario['itens'][i]['caixa_gerenciar'],
          usuario['itens'][i]['caixa_fechar'],
          usuario['itens'][i]['caixa_pdv'],
          usuario['itens'][i]['caixa_carga'],
          usuario['itens'][i]['caixa_parametros'],
        );

        listaUsuarios.add(usu);
      }

      isar.writeTxn(() async {
        await isar.usuarios.putAll(listaUsuarios);
      });
      return isar;
    } else {
      throw Exception('Não foi possível encontrar os itens do banco de dados');
    }
  }

  //stream para buscar dados da tabela usuarios
  Stream<List<Usuario>> listenUsuarios() async* {
    final isar = await db;
    yield* isar.usuarios
        .where()
        .sortByIdColaborador()
        .watch(fireImmediately: true);
  }

  //metodos para inserir dados no banco

  //inserir dados na tabela caixa
  Future<Isar> insertCaixa(Caixa caixa) async {
    final isar = await db;

    //inserindo dados na tabela caixa
    isar.writeTxn(() async {
      await isar.caixas.put(caixa);
    });
    return isar;
  }

  //stream para buscar dados da tabela caixa
  Stream<List<Caixa>> listenCaixa() async* {
    final isar = await db;
    yield* isar.caixas.where().sortByIdEmpresa().watch(fireImmediately: true);
  }

  //buscar id caixa na tabela 'caixa'
  Future<int?> getIdCaixa(int AberturaIdUser) async {
    final isar = await db;
    
    Caixa? caixa = await isar.caixas.filter().aberturaIdUserEqualTo(AberturaIdUser).findFirst();
    if (caixa != null) {
      return caixa.idCaixa;
    }else{
      return null;
    }
  }

  //inserir dados na tabela caixaItem
  Future<Isar> insertCaixaItem(CaixaItem caixaItem) async {
    final isar = await db;

    isar.writeTxn(() async {
      await isar.caixaItems.put(caixaItem);
    });
    return isar;
  }

  //stream para buscar dados da tabela caixaItem
  Stream<List<CaixaItem>> listenCaixaItem() async* {
    final isar = await db;
    yield* isar.caixaItems.where().sortByIdCaixa().watch(fireImmediately: true);
  }

  //inserir dados na tabela venda
  Future<Isar> insertVenda(Venda venda, VendaItem vendaItem) async {
    final isar = await db;

    //inserindo dados na tabela venda
    isar.writeTxn(() async {
      await isar.vendas.put(venda);
      await isar.vendaItems.put(vendaItem);
    });
    return isar;
  }

  //stream para buscar dados da tabela venda
  Stream<List<Venda>> listenVenda() async* {
    final isar = await db;
    yield* isar.vendas.where().sortByIdUsuario().watch(fireImmediately: true);
  }

  //inserir dados na tabela vendaItem
  Future<Isar> insertVendaItem(VendaItem vendaItem) async {
    final isar = await db;

    isar.writeTxn(() async {
      await isar.vendaItems.put(vendaItem);
    });
    return isar;
  }

  //stream para buscar dados da tabela vendaItem
  Stream<List<VendaItem>> listenVendaItem() async* {
    final isar = await db;
    yield* isar.vendaItems.where().sortByIdVenda().watch(fireImmediately: true);
  }

  // busca o login do usuario
  Future<String?> getLoginFromDatabase(String login) async {
    final isar = await db;

    Usuario? usuario =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuario != null) {
      return usuario
          .login; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return "";
    }
  }

  //busca a senha do usuario
  Future<String?> getPasswordFromDatabase(String login) async {
    final isar = await db;

    Usuario? usuario =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    //verifica se o usuario existe
    if (usuario != null) {
      return usuario.senha;
    } else {
      return "";
    }
  }

  //buscar informações de acordo com a url e o numero do contrato
  Future<String> getIpEmpresa(context) async {
    Uri getIpEmpresa = Uri.parse(Endpoints().ipEmpresa());
    final response = await http.get(
      getIpEmpresa,
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Não foi possível encontrar os itens do banco de dados',
      );
    }
    if (response.statusCode == 200) {
      var ip = jsonDecode(utf8.decode(response.bodyBytes));
      if (ip != null && ip['itens'] != null && ip['itens'][0]['link'] != null) {
        String link = ip['itens'][0]['link'];
        return link;
      } else {
        const CustomSnackBar(
                title: 'Erro',
                message: 'Numero de contrato inválido',
                icon: Icons.error,
                backgroundColor: Colors.red,
                textColor: Colors.white)
            .show(context);
      }
    }
    return "";
  }

  //criar um listen que faz a busca dos dados da tabela 'Dados Empresariais'
  Future<DadoEmpresa?> getDataEmpresa() async {
    final isar = await db;
    return await isar.dadoEmpresas.where().findFirst();
  }

  //inserir dados na tabela 'Dados Empresariais'
  Future<Isar> insertDadosEmpresariais(DadoEmpresa empresa) async {
    final isar = await db;

    int i = await isar.dadoEmpresas.count();

    if (i > 0) {
      isar.writeTxn(
        () async {
          await isar.dadoEmpresas.clear();
        },
      );
    }

    //inserindo dados na tabela 'Dados Empresariais'
    isar.writeTxn(() async {
      await isar.dadoEmpresas.put(empresa);
    });
    return isar;
  }

  //stream para buscar dados da tabela 'Dados Empresariais'
  Stream<List<DadoEmpresa>> listenDadosEmpresariais() async* {
    final isar = await db;
    yield* isar.dadoEmpresas
        .where()
        .sortByIdEmpresa()
        .watch(fireImmediately: true);
  }

  //update do ipEmpresa
  Future<Isar> updateIpEmpresa(DadoEmpresa empresa) async {
    final isar = await db;
    isar.writeTxn(() async {
      await isar.dadoEmpresas.put(empresa);
    });
    return isar;
  }

  //deletar dados na tabela 'Dados Empresariais'
  Future<Isar> deleteDadosEmpresariais() async {
    final isar = await db;
    isar.writeTxn(() async {
      await isar.dadoEmpresas.clear();
    });
    return isar;
  }

  //cria um usuario na tabela 'Usuarios'
  Future<Isar> insertUser(UsuarioLogado user) async {
    final isar = await db;

    int i = await isar.usuarioLogados.count();

    if (i > 0) {
      isar.writeTxn(() async {
        await isar.usuarioLogados.clear();
      });
    }

    isar.writeTxn(() async {
      await isar.usuarioLogados.put(user);
    });

    return isar;
  }

  //buscar todos os dados do login com as verificações
  Future<int?> getUserIdColaborador(String login) async {
    final isar = await db;

    Usuario? usuario =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuario != null) {
      return usuario
          .idColaborador; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return null;
    }
  }

  Future<int?> getUserIdUser(String login) async {
    final isar = await db;

    Usuario? usuario =
        await isar.usuarios.filter().loginEqualTo(login).findFirst();

    if (usuario != null) {
      return usuario
          .id; // Substitua 'nome' pelo campo correto do nome do usuário no banco de dados
    } else {
      return null;
    }
  }

  Future<UsuarioLogado?> getUserLogged() async {
    final isar = await db;

    UsuarioLogado? usuario =
        await isar.usuarioLogados.filter().idEqualTo(1).findFirst();

    return usuario;
  }

  Future<bool> checkUserCaixa(int idUser) async {
    final isar = await db;

    Caixa? usuario = await isar.caixas.filter().aberturaIdUserEqualTo(idUser).findFirst();

    if (usuario != null) {
      return true;
    }else{
      return false;
    }
  }

  //abre o banco de dados
  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          EmpresaSchema,
          GrupoProdutoSchema,
          ProdutoSchema,
          UsuarioSchema,
          CaixaItemSchema,
          CaixaSchema,
          VendaItemSchema,
          VendaSchema,
          DadoEmpresaSchema,
          UsuarioLogadoSchema,
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
