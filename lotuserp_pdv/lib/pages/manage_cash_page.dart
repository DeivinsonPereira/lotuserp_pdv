import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';

class ManageCashPage extends StatelessWidget {
  const ManageCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Movimentação de Caixa:',
        style: TextStyle(
          color: CustomColors.customSwatchColor[900],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data: DD/MM/AAA | Operador: Nome Sobrenome',
              style: TextStyle(
                fontSize: 12,
                color: CustomColors.customSwatchColor,
              ),
            ),
            Text(
              'Tipo de Movimentação:',
              style: TextStyle(
                  height: 3,
                  color: CustomColors.customSwatchColor[900],
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            /* const CustomDropdown(
              items: [
                'Suprimento',
                'Sangria',
              ],
              paddingBottom: 0,
              paddingTop: 15,
            ),*/
            Text(
              'Valor da Movimentação:',
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
              child: FormWidgets().textFieldNumberWidget(
                Icons.add,
                'R\$ 0,00',
              ),
            )
          ],
        ),
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
            Navigator.of(context).pop(false);
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
          onPressed: () {
            Navigator.of(context).pop(true);
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
