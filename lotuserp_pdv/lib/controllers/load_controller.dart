// ignore_for_file: use_build_context_synchronously

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/pages/common/loading_screen.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:http/http.dart' as http;

import '../pages/common/custom_cherry_error.dart';

class LoadController extends GetxController {
  //conexão com api
  var connectedApi = false.obs;

  //checkbox de escolha de quais dados serão carregados
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;

  var isLoading = true.obs;

  IsarService service = IsarService();

  //atualizar checkbox
  void updateCheckBox(
      {bool ischeckbox1 = false,
      bool ischeckbox2 = false,
      bool ischeckbox3 = false,
      bool ischeckbox4 = false,
      bool ischeckbox5 = false,
      bool ischeckbox6 = false}) {
    if (ischeckbox1 == true) {
      checkbox1.value = !checkbox1.value;
    }

    if (ischeckbox2 == true) {
      checkbox2.value = !checkbox2.value;
    }

    if (ischeckbox3 == true) {
      checkbox3.value = !checkbox3.value;
    }

    if (ischeckbox4 == true) {
      checkbox4.value = !checkbox4.value;
    }

    update();
  }

  //carregar dados da api
  Future<void> loadData(BuildContext context) async {
    const SpinKitRotatingCircle(
      color: Colors.red,
      size: 50.0,
    );
    const LoadingScreen();

    await verificarConexaoApi(context);

    if (connectedApi.value == true) {
      var dadosEmpresariais = await service.getDataEmpresa();
      if (dadosEmpresariais != null) {
        if (checkbox1.value == true) {
          await service.getEmpresa(dadosEmpresariais.id_empresa.toString(),
              dadosEmpresariais.ip_empresa!, context);
        }
        if (checkbox2.value == true) await service.getTipo_recebimento(context);
        if (checkbox3.value == true) await service.getUsuarios(context);
        if (checkbox4.value == true) {
          await service.getGrupo(context);
          await service.getProduto(context);
        }
        isLoading = false.obs;
        update();
      }
    } else {
      const CustomCherryError(
        message: 'Erro ao conectar ao servidor. Tente novamente mais tarde!',
      ).show(context);
      isLoading = false.obs;
      update();
    }
  }

  //verifica a conexão com o servidor e retorna true se estiver conectado
  Future<void> verificarConexaoApi(BuildContext context) async {
    var result = await service.getDataEmpresa();
    var ipEmpresa = '';
    if (result != null) {
      ipEmpresa = result.ip_empresa!;
    }

    try {
      final response = await http.get(Uri.parse(ipEmpresa));
      if (response.statusCode == 200) {
        connectedApi.value = true;
      } else {
        connectedApi.value = false;
      }
    } catch (e) {
      const CustomCherryError(
        message: 'Erro ao conectar ao servidor. Tente novamente mais tarde!',
      ).show(context);
    }

    var resultado = await Connectivity().checkConnectivity();
    connectedApi.value = resultado != ConnectivityResult.none;
  }
}
