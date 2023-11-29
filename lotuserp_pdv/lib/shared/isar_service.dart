import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:lotuserp_pdv/collections/empresa.dart';
import 'package:lotuserp_pdv/collections/grupo_produto.dart';
import 'package:lotuserp_pdv/collections/produto.dart';
import 'package:lotuserp_pdv/collections/usuario.dart';
import 'package:lotuserp_pdv/shared/widgets/endpoints_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers = {
  'content-type': 'application/json',
  'ptoken': 'ed9a811327979c9382ffd6361cfc5013'
};

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

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

    Uri getEmpresa = Uri.parse(Endpoints.empresa());
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

  Stream<List<Empresa>> listenEmpresa() async* {
    final isar = await db;
    yield* isar.empresas.where().sortByRazao().watch(fireImmediately: true);
  }

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

    Uri getGrupo = Uri.parse(Endpoints.grupo());
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

  Stream<List<GrupoProduto>> listenGrupo() async* {
    final isar = await db;
    yield* isar.grupoProdutos
        .where()
        .sortByIdGrupo()
        .watch(fireImmediately: true);
  }

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

    Uri getProdutos = Uri.parse(Endpoints.produto());
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

  Stream<List<Produto>> listenProdutos() async* {
    final isar = await db;
    yield* isar.produtos.where().sortByIdGrupo().watch(fireImmediately: true);
  }

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

    Uri getUsuarios = Uri.parse(Endpoints.usuario());
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
          usuario['itens'][i]['id_usuario_grupo'],
          usuario['itens'][i]['id_colaborador'],
          usuario['itens'][i]['login'],
          usuario['itens'][i]['senha'],
          usuario['itens'][i]['status'],
          usuario['itens'][i]['vend_desc_perc'].toDouble(),
          usuario['itens'][i]['vend_excluir_item'],
          usuario['itens'][i]['vend_pdv_off'],
          usuario['itens'][i]['retirada_cx'],
          usuario['itens'][i]['pre_fechamentocx'],
          usuario['itens'][i]['venda_cancelar'],
          usuario['itens'][i]['pdvoff_pessoas'],
          usuario['itens'][i]['pdvoff_emp_cad'],
          usuario['itens'][i]['pdvoff_emp_ser'],
          usuario['itens'][i]['pdvoff_cx_abrir'],
          usuario['itens'][i]['pdvoff_cx_abrir'],
          usuario['itens'][i]['pdvoff_cx_listar'],
          usuario['itens'][i]['pdvoff_cx_gerenciar'],
          usuario['itens'][i]['pdvoff_cx_fechar'],
          usuario['itens'][i]['pdvoff_fis_opera'],
          usuario['itens'][i]['pdvoff_pdv'],
          usuario['itens'][i]['pdvoff_vendas'],
          usuario['itens'][i]['pdvoff_rel_vendas'],
          usuario['itens'][i]['pdvoff_log_opera'],
          usuario['itens'][i]['pdvoff_auditoria'],
          usuario['itens'][i]['pdvoff_cargas_atua'],
          usuario['itens'][i]['pdvoff_cargas_integra'],
          usuario['itens'][i]['pdvoff_cargas_parametros'],
          usuario['itens'][i]['mob_dashboard'],
          usuario['itens'][i]['pdvoff_produto'],
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

  Stream<List<Usuario>> listenUsuarios() async* {
    final isar = await db;
    yield* isar.usuarios
        .where()
        .sortByIdColaborador()
        .watch(fireImmediately: true);
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [EmpresaSchema, GrupoProdutoSchema, ProdutoSchema, UsuarioSchema],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
