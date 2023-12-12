import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextFieldController textFieldController = Get.find();
  IsarService service = IsarService();
  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase('IP');
    fetchDataFromDatabase('ID da empresa');
    fetchDataFromDatabase('ID da serie NFCe');
    fetchDataFromDatabase('Número do caixa');
    fetchDataFromDatabase('Intervalo de envio');
  }

  Future<void> fetchDataFromDatabase(String variableName) async {
    final DadoEmpresa? dadoEmpresa = await service.getIpEmpresaFromDatabase();
    if (dadoEmpresa != null) {
      if (dadoEmpresa.ipEmpresa == null) {
        service.deleteDadosEmpresariais();
      } else {
        if (variableName == 'IP') {
          textFieldController.numContratoEmpresaController.text =
              dadoEmpresa.ipEmpresa.toString();
        }
        if (variableName == 'ID da empresa') {
          textFieldController.idEmpresaController.text =
              dadoEmpresa.idEmpresa.toString();
        }
        if (variableName == 'ID da serie NFCe') {
          textFieldController.idSerieNfceController.text =
              dadoEmpresa.idNfce.toString();
        }
        if (variableName == 'Número do caixa') {
          textFieldController.numCaixaController.text =
              dadoEmpresa.numCaixa.toString();
        }
        if (variableName == 'Intervalo de envio') {
          textFieldController.intervaloEnvioController.text =
              dadoEmpresa.intervaloEnvio.toString();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
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
                                  title: 'Erro',
                                  message: 'O campo obrigatório',
                                  icon: Icons.error,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                ).show(context);
                              } else {
                                textFieldController.salvarInformacoesContrato();
                                String ip = await service.getIpEmpresa(context);
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

    Widget backButton() {
      return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      );
    }

    bool verificacoes() {
      if (textFieldController.numContratoEmpresaController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'IP obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (textFieldController.idEmpresaController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'ID da empresa obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (textFieldController.idSerieNfceController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'ID da serie NFCe obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (textFieldController.numCaixaController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'Numero do caixa obrigatorio',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (textFieldController.intervaloEnvioController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'intervalo de envio obrigatorio',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else {
        Get.back();
        return false;
      }
    }

    Widget buttonConfirm() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
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
                  if (verificacoes() == true) {}
                  textFieldController.salvarInformacoes(context);
                  DadoEmpresa dadosEmpresa = DadoEmpresa()
                    ..idEmpresa = int.parse(textFieldController.idEmpresa)
                    ..idNfce = int.parse(textFieldController.idSerieNfce)
                    ..numCaixa = int.parse(textFieldController.numCaixa)
                    ..intervaloEnvio =
                        int.parse(textFieldController.intervaloEnvio)
                    ..ipEmpresa = textFieldController.numContratoEmpresa;

                  var iplocal = textFieldController.numContratoEmpresa;

                  if (iplocal != '' &&
                      iplocal.isNotEmpty &&
                      iplocal.isBlank == false) {
                    await service.insertDadosEmpresariais(dadosEmpresa);
                    await service
                        .getEmpresa(int.parse(textFieldController.idEmpresa));
                    await service
                        .getGrupo(int.parse(textFieldController.idEmpresa));
                    await service
                        .getProduto(int.parse(textFieldController.idEmpresa));
                    await service
                        .getUsuarios(int.parse(textFieldController.idEmpresa));
                    await Get.offAllNamed(PagesRoutes.loginRoute);
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
    }

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

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            backButton(),
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
