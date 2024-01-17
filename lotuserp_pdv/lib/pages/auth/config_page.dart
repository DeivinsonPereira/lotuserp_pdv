import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

import '../../services/injection_dependencies.dart';
import '../common/loading_screen.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextFieldController textFieldController =
      InjectionDependencies.textFieldController();

  IsarService service = IsarService();
  Logger logger = Logger();
  //inicia o controller dos campos de texto
  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase('IP');
    fetchDataFromDatabase('ID da empresa');
    fetchDataFromDatabase('ID da serie NFCe');
    fetchDataFromDatabase('Número do caixa');
    fetchDataFromDatabase('Intervalo de envio');
  }

  //Busca dados do banco para preencher os campos de texto
  Future<void> fetchDataFromDatabase(String variableName) async {
    try {
      final dado_empresa? dadoEmpresa =
          await service.getIpEmpresaFromDatabase();
      if (dadoEmpresa != null) {
        if (dadoEmpresa.ip_empresa == null) {
          service.deleteDadosEmpresariais();
        } else {
          if (variableName == 'IP') {
            textFieldController.numContratoEmpresaController.text =
                dadoEmpresa.ip_empresa.toString();
          }
          if (variableName == 'ID da empresa') {
            textFieldController.idEmpresaController.text =
                dadoEmpresa.id_empresa.toString();
          }
          if (variableName == 'ID da serie NFCe') {
            textFieldController.idSerieNfceController.text =
                dadoEmpresa.id_nfce.toString();
          }
          if (variableName == 'Número do caixa') {
            textFieldController.numCaixaController.text =
                dadoEmpresa.num_caixa.toString();
          }
          if (variableName == 'Intervalo de envio') {
            textFieldController.intervaloEnvioController.text =
                dadoEmpresa.intervalo_envio.toString();
          }
        }
      }
    } catch (e) {
      logger.e('Erro ao buscar dados da empresa: $e');
    }
  }

  Future<bool> buscarDadosEmpresa(String ipEmpresa, String idEmpresa) async {
    try {
      var empresaObtida = await service.getEmpresa(idEmpresa, ipEmpresa);
      if (empresaObtida != null) {
        dado_empresa dadosEmpresa = dado_empresa()
          ..id_empresa = int.parse(textFieldController.idEmpresaController.text)
          ..id_nfce = int.parse(textFieldController.idSerieNfceController.text)
          ..num_caixa = int.parse(textFieldController.numCaixaController.text)
          ..intervalo_envio =
              int.parse(textFieldController.intervaloEnvioController.text)
          ..ip_empresa = ipEmpresa;
        await service.insertDadosEmpresariais(dadosEmpresa);
        return true; // Retorna verdadeiro se a empresa for obtida e inserida com sucesso.
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
        return false;
      }
    } catch (e) {
      exibirErro("Ocorreu um erro ao buscar os dados da empresa: $e");
      return false;
    }
  }

  Future<void> buscarOutrosDados() async {
    await service.getGrupo();
    await service.getProduto();
    await service.getUsuarios();
    await service.getTipo_recebimento();
  }

  Future<void> esperarDadosEmpresaEChamarOutrosDados(int tentativas) async {
    while (tentativas > 0) {
      await Future.delayed(const Duration(seconds: 1));
      var empresaCount = await service.empresaCount();
      if (empresaCount > 0) {
        await buscarOutrosDados();
        break;
      }
      tentativas--;
    }
    if (tentativas == 0) {
      exibirErro('Erro ao esperar pelos dados da empresa.');
    }
  }

  Future<void> confirmarDados() async {
    var ipEmpresa = textFieldController.numContratoEmpresaController.text;
    var idEmpresa = textFieldController.idEmpresaController.text;

    if (ipEmpresa.isNotEmpty && !ipEmpresa.isBlank!) {
      var sucesso = await buscarDadosEmpresa(ipEmpresa, idEmpresa);
      if (sucesso) {
        Get.dialog(const LoadingScreen(), barrierDismissible: false);
        await esperarDadosEmpresaEChamarOutrosDados(3); // Tentar 3 vezes
        Get.back(); // Fecha a tela de loading
      } else {
        logger.e(
            "Não foi possível obter os dados da empresa. Verifique a URL/IP e tente novamente.");
      }
    } else {
      exibirErro("O IP da empresa é obrigatório e deve ser válido.");
    }
  }

  void exibirErro(String mensagemErro) {
    Get.snackbar(
      'Erro',
      mensagemErro,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Molde dos campos de texto de configuração do PDV
    Widget textFormFields(
        IconData icon, TextEditingController? controller, String variableName,
        {bool numericKeyboard = false, bool useIconButton = false}) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15,
          bottom: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 510,
              child: Text(
                variableName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: controller,
              keyboardType: numericKeyboard ? TextInputType.number : null,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: useIconButton
                      ? Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.customSwatchColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              icon,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              if (controller!.text.isEmpty) {
                                const CustomSnackBar(
                                  message: 'O campo obrigatório',
                                ).show();
                              } else {
                                textFieldController.salvarInformacoesContrato();
                                String ip = await service.getIpEmpresa(
                                    isCorrectUrl: true);
                                if (ip.isNotEmpty) {
                                  setState(
                                    () {
                                      textFieldController
                                          .updateNumeroContratoToIp(ip);
                                      controller.text = textFieldController
                                          .numContratoEmpresa;
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        )
                      : Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.customSwatchColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            icon,
                            color: Colors.white,
                          ),
                        ),
                ),
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
            ),
          ],
        ),
      );
    }

    //campos de texto do formulário para configuração do sistema
    Widget textFormFieldsCamp() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Column(
              children: [
                textFormFields(
                    FontAwesomeIcons.wifi,
                    textFieldController.numContratoEmpresaController,
                    'Digite o IP da empresa',
                    useIconButton: true),
                textFormFields(FontAwesomeIcons.solidBuilding,
                    textFieldController.idEmpresaController, 'ID da empresa',
                    numericKeyboard: true),
                textFormFields(
                    FontAwesomeIcons.fileInvoiceDollar,
                    textFieldController.idSerieNfceController,
                    'ID da serie NFCe',
                    numericKeyboard: true),
                textFormFields(FontAwesomeIcons.cashRegister,
                    textFieldController.numCaixaController, 'Número do caixa',
                    numericKeyboard: true),
                textFormFields(
                    FontAwesomeIcons.solidClock,
                    textFieldController.intervaloEnvioController,
                    'Intervalo de envio',
                    numericKeyboard: true),
              ],
            ),
          ),
        ],
      );
    }

    //botão voltar
    Widget backButton(String route) {
      return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Get.offNamed(route);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      );
    }

    //verificações de campos obrigatórios
    bool verificacoes() {
      if (textFieldController.numContratoEmpresaController.text.isEmpty) {
        const CustomSnackBar(
          message: 'IP obrigatório',
        ).show();
        return true;
      } else if (textFieldController.idEmpresaController.text.isEmpty) {
        const CustomSnackBar(
          message: 'ID da empresa obrigatório',
        ).show();
        return true;
      } else if (textFieldController.idSerieNfceController.text.isEmpty) {
        const CustomSnackBar(
          message: 'ID da serie NFCe obrigatório',
        ).show();
        return true;
      } else if (textFieldController.numCaixaController.text.isEmpty) {
        const CustomSnackBar(
          message: 'Numero do caixa obrigatorio',
        ).show();
        return true;
      } else if (textFieldController.intervaloEnvioController.text.isEmpty) {
        const CustomSnackBar(
          message: 'intervalo de envio obrigatorio',
        ).show();
        return true;
      } else {
        Get.back();
        return false;
      }
    }

    //Botão de confirmação
    Widget buttonConfirm() {
      var size = MediaQuery.of(context).size;

      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/Logo_Nova_Transparente.png',
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (verificacoes() == true) {
                    } else {
                      confirmarDados();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors
                        .customContrastColor, // Define a cor de fundo como amarelo
                    minimumSize:
                        const Size(300, 50), // Define a largura mínima como 200
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(PagesRoutes.printerPageRoute);
                  },
                  icon: const Icon(
                    Icons.print,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: const Text(
                    'Configurar Impressora',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      backgroundColor: CustomColors.customSwatchColor),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //Conteiner do conteúdo
    Widget centerContainer() {
      return Container(
        width: 1100,
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: textFormFieldsCamp(),
            ),
            Expanded(
              flex: 1,
              child: buttonConfirm(),
            ),
          ],
        ),
      );
    }

    //Scaffold do conteúdo
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            backButton(PagesRoutes.loginRoute),
            const SizedBox(
              height: 75,
            ),
            centerContainer(),
          ],
        ),
      ),
    );
  }
}
