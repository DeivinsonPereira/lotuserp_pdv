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
    _preferences = await SharedPreferences.getInstance();
  }

  // Salva os dados.
  static Future saveData() async {
    init();

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

  // Retorna os dados.
  static Future getData() async {
    init();

    ip = _preferences.getString('ip');
    idEmpresa = _preferences.getString('idEmpresa');
    idSerieNfce = _preferences.getString('idSerieNfce');
    numCaixa = _preferences.getString('numCaixa');
    intervaloEnvio = _preferences.getString('intervaloEnvio');
  }

  // Deleta os dados.
  static Future deleteData() async {
    init();

    await _preferences.remove('ip');
    await _preferences.remove('idEmpresa');
    await _preferences.remove('idSerieNfce');
    await _preferences.remove('numCaixa');
    await _preferences.remove('intervaloEnvio');
  }

  // Deleta o numero de ip.
  static Future deleteNumeroIp() async {
    init();

    await _preferences.remove('ip');
  }

  // Deleta o id da empresa.
  static Future deleteIdEmpresa() async {
    init();
    await _preferences.remove('idEmpresa');
  }

  // Deleta o id da serie nfce.
  static Future deleteIdSerieNfce() async {
    init();
    await _preferences.remove('idSerieNfce');
  }

  // Deleta o numero de caixa.
  static Future deleteNumCaixa() async {
    init();
    await _preferences.remove('numCaixa');
  }

  // Deleta o intervalo de envio.
  static Future deleteIntervaloEnvio() async {
    init();
    await _preferences.remove('intervaloEnvio');
  }

  // Atualiza o numero de ip.
  static Future updateNumeroIp(String ip) async {
    init();
    await _preferences.setString('ip', ip);
  }

  // Atualiza o id da empresa.
  static Future updateIdEmpresa(String idEmpresa) async {
    init();
    await _preferences.setString('idEmpresa', idEmpresa);
  }

  // Atualiza o id da serie nfce.
  static Future updateIdSerieNfce(String idSerieNfce) async {
    init();
    await _preferences.setString('idSerieNfce', idSerieNfce);
  }

  // Atualiza o numero de caixa.
  static Future updateNumCaixa(String numCaixa) async {
    init();
    await _preferences.setString('numCaixa', numCaixa);
  }

  // Atualiza o intervalo de envio.
  static Future updateIntervaloEnvio(String intervaloEnvio) async {
    init();
    await _preferences.setString('intervaloEnvio', intervaloEnvio);
  }
}
