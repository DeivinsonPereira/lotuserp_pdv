import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/collections/dado_empresa.dart';
import 'package:lotuserp_pdv/controllers/moviment_register_controller.dart';
import 'package:lotuserp_pdv/controllers/password_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class OpenRegisterPage extends StatelessWidget {
  const OpenRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Get.find();
    IsarService service = IsarService();
    MovimentRegisterController movimentRegisterController =
        Get.put(MovimentRegisterController());

    var userName = passwordController.userController.text;

    DateTime atualDate = DateTime.now();

    var date = DateFormat('dd/MM/yyyy').format(atualDate);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      
      title: Text(
        'Confirmar Abertura de Caixa:',
        style: TextStyle(
          color: CustomColors.customSwatchColor[900],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data: $date | Operador: $userName',
            style: TextStyle(
              fontSize: 14,
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Valor da Abertura:',
            style: TextStyle(
                height: 3,
                color: CustomColors.customSwatchColor[900],
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: FormWidgets().textFieldOpenRegister(Icons.add, 'R\$ 0,00',
                movimentRegisterController.openRegisterController),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            movimentRegisterController.clearOpenRegister();
            Get.back();
          },
          child: Text(
            "Não",
            style: TextStyle(
              color: CustomColors.customSwatchColor[900],
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.customSwatchColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () async {
            movimentRegisterController.openRegisterValue();
            DadoEmpresa? dataEmpresa = await service.getIpEmpresaFromDatabase();
            int? idEmpresa = dataEmpresa?.idEmpresa;
            

            movimentRegisterController.clearOpenRegister();
            Get.back();
          },
          child: Text(
            "Sim",
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ),
      ],
    );
  }
}
