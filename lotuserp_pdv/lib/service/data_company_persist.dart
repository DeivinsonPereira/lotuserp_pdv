import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCompanyPersist {
  static TextFieldController textEditingController = Get.find();

  static late SharedPreferences _preferences;

  static String? ip;
  static String? idEmpresa;
  static String? idSerieNfce;
  static String? numCaixa;
  static String? intervaloEnvio;

  // Inicializa o sharedPreferences.
  static Future init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
    } catch (e) {
      print('Erro ao inicializar o SharedPreferences: $e');
    }
  }

  static Future<bool> hasSavedData() async {
    await init();
    return _preferences.containsKey('ip') &&
        _preferences.containsKey('idEmpresa') &&
        _preferences.containsKey('idSerieNfce') &&
        _preferences.containsKey('numCaixa') &&
        _preferences.containsKey(
            'intervaloEnvio'); // Verifica se a chave 'ip' existe no SharedPreferences
  }

  // Salva os dados.
  static Future saveData() async {
    await init();

    ip = textEditingController.numContratoEmpresa;
    idEmpresa = textEditingController.idEmpresa;
    idSerieNfce = textEditingController.idSerieNfce;
    numCaixa = textEditingController.numCaixa;
    intervaloEnvio = textEditingController.intervaloEnvio;

    if (ip != null &&
        idEmpresa != null &&
        idSerieNfce != null &&
        numCaixa != null &&
        intervaloEnvio != null) {
      await _preferences.setString('ip', ip!);
      await _preferences.setString('idEmpresa', idEmpresa!);
      await _preferences.setString('idSerieNfce', idSerieNfce!);
      await _preferences.setString('numCaixa', numCaixa!);
      await _preferences.setString('intervaloEnvio', intervaloEnvio!);
    }
  }

  static Future SaveIp() async {
    await init();
    ip = _preferences.setString('ip', textEditingController.numContratoEmpresa);
  }

  // Retorna os dados.
  static Future getData() async {
    await init();

    ip = _preferences.getString('ip');
    idEmpresa = _preferences.getString('idEmpresa');
    idSerieNfce = _preferences.getString('idSerieNfce');
    numCaixa = _preferences.getString('numCaixa');
    intervaloEnvio = _preferences.getString('intervaloEnvio');
  }

  // Retorna o numero de ip.
  static Future getNumeroIp() async {
    await init();
    ip = _preferences.getString('ip');
  }

  // Retorna o id da empresa.
  static Future getIdEmpresa() async {
    await init();
    idEmpresa = _preferences.getString('idEmpresa');
  }

  // Retorna o id da serie nfce.
  static Future getIdSerieNfce() async {
    await init();
    idSerieNfce = _preferences.getString('idSerieNfce');
  }

  // Retorna o numero de caixa.
  static Future getNumCaixa() async {
    await init();
    numCaixa = _preferences.getString('numCaixa');
  }

  // Retorna o intervalo de envio.
  static Future getIntervaloEnvio() async {
    await init();
    intervaloEnvio = _preferences.getString('intervaloEnvio');
  }

  // Deleta os dados.
  static Future deleteData() async {
    await init();

    await _preferences.remove('ip');
    await _preferences.remove('idEmpresa');
    await _preferences.remove('idSerieNfce');
    await _preferences.remove('numCaixa');
    await _preferences.remove('intervaloEnvio');
  }

  // Deleta o numero de ip.
  static Future deleteNumeroIp() async {
    await init();

    await _preferences.remove('ip');
  }

  // Deleta o id da empresa.
  static Future deleteIdEmpresa() async {
    await init();
    await _preferences.remove('idEmpresa');
  }

  // Deleta o id da serie nfce.
  static Future deleteIdSerieNfce() async {
    await init();
    await _preferences.remove('idSerieNfce');
  }

  // Deleta o numero de caixa.
  static Future deleteNumCaixa() async {
    await init();
    await _preferences.remove('numCaixa');
  }

  // Deleta o intervalo de envio.
  static Future deleteIntervaloEnvio() async {
    await init();
    await _preferences.remove('intervaloEnvio');
  }

  static Future updateAllData() async {
    await init();
    await _preferences.setString('ip', textEditingController.ip);
    await _preferences.setString('idEmpresa', textEditingController.idEmpresa);
    await _preferences.setString(
        'idSerieNfce', textEditingController.idSerieNfce);
    await _preferences.setString('numCaixa', textEditingController.numCaixa);
    await _preferences.setString(
        'intervaloEnvio', textEditingController.intervaloEnvio);
  }

  // Atualiza o numero de ip.
  static Future updateNumeroIp(String ip) async {
    await init();
    await _preferences.setString('ip', ip);
  }

  // Atualiza o id da empresa.
  static Future updateIdEmpresa(String idEmpresa) async {
    await init();
    await _preferences.setString('idEmpresa', idEmpresa);
  }

  // Atualiza o id da serie nfce.
  static Future updateIdSerieNfce(String idSerieNfce) async {
    await init();
    await _preferences.setString('idSerieNfce', idSerieNfce);
  }

  // Atualiza o numero de caixa.
  static Future updateNumCaixa(String numCaixa) async {
    await init();
    await _preferences.setString('numCaixa', numCaixa);
  }

  // Atualiza o intervalo de envio.
  static Future updateIntervaloEnvio(String intervaloEnvio) async {
    await init();
    await _preferences.setString('intervaloEnvio', intervaloEnvio);
  }
}
