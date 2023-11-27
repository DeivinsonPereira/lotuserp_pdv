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

    Uri getEmpresa = Uri.parse(Endpoints.Empresa());
    final response = await http.get(
      getEmpresa,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      var empresa = jsonDecode(utf8.decode(response.bodyBytes));
    print(empresa['itens'][0]['complemento'],);
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
        empresa['itens'][0]['param_pdv_comanda_producao']
        
      );
      isar.writeTxn(() async {
        await isar.empresas.put(emp);
      });
      return isar;
    } else {
      throw Exception('Não foi possível encontrar os itens do banco de dados');
    }
  }

  Stream<List<Empresa>> listenCompany() async* {
    final isar = await db;
    yield* isar.empresas.where().sortByRazao().watch(fireImmediately: true);
  }
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
