import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/text_field_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextFieldController controller = Get.find();

    Widget textFormFields(
        IconData icon, TextEditingController? controller, String text) {
      return Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 15),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      color: CustomColors.customSwatchColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ), // Ícone de IP
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                hintText: text,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 201, 200, 200),
                )),
          ));
    }

    Widget textFormFieldsCamp() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Column(
              children: [
                textFormFields(FontAwesomeIcons.wifi, controller.ipController,
                    'Digite o IP da empresa'),
                textFormFields(FontAwesomeIcons.solidBuilding,
                    controller.idEmpresaController, 'Digite o ID da empresa'),
                textFormFields(
                    FontAwesomeIcons.fileInvoiceDollar,
                    controller.idSerieNfceController,
                    'Digite o ID da serie NFCe'),
                textFormFields(FontAwesomeIcons.cashRegister,
                    controller.numCaixaController, 'Digite o número do caixa'),
                textFormFields(
                    FontAwesomeIcons.solidClock,
                    controller.intervaloEnvioController,
                    'Digite o intervalo de envio'),
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
      if (controller.ipController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'IP obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (controller.idEmpresaController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'ID da empresa obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (controller.idSerieNfceController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'ID da serie NFCe obrigatório',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (controller.numCaixaController.text.isEmpty) {
        const CustomSnackBar(
          title: 'Erro',
          message: 'Numero do caixa obrigatorio',
          icon: Icons.error,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        ).show(context);
        return true;
      } else if (controller.intervaloEnvioController.text.isEmpty) {
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
                onPressed: () {
                  if (verificacoes() == true) {
                    controller.salvarInformacoes();
                  }
                  // Chame o método para salvar as informações nas variáveis do controller aqui
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
        height: 425,
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
            SizedBox(
              height: 75,
            ),
            centerContainer(),
          ],
        ),
      ),
    );
  }
}
