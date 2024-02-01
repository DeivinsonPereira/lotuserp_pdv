// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/balanca_prix_controller.dart';
import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

import '../../services/dependencies.dart';
import '../common/header_popup.dart';

class BalancePopUp extends StatelessWidget {
  final String nomeProduto;
  final String unidade;
  final String price;
  final int idProduto;
  bool? isBalance;
  String? quantity;

  BalancePopUp({
    Key? key,
    required this.nomeProduto,
    required this.unidade,
    required this.price,
    required this.idProduto,
    this.isBalance,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BalancaPrix3FitController balancaController =
        Dependencies.balancaController();
    PdvController pdvController = Dependencies.pdvController();

    // Constrói o textField
    Widget _buildTextField() {
      return Container(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SizedBox(
          width: 300,
          child: TextField(
            controller: pdvController.pesagemController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              prefixIcon: Icon(Icons.balance),
              labelText: 'Quantidade',
            ),
          ),
        ),
      );
    }

    //Constrói o botão de pesagem
    Widget _buildButtonWeighing() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 75,
          width: 300,
          child: ElevatedButton(
            onPressed: () async {
              await balancaController.iniciarEscutaDados(
                  nomeProduto, unidade, price, idProduto,
                  isBalance: true, quantity: '');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.customSwatchColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: const Text(
              'Pesagem',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ),
      );
    }

    //Constrói o corpo
    Widget _buildBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Digite a quantidade ou clique no botão de pesagem',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          _buildTextField(),
          _buildButtonWeighing(),
        ],
      );
    }

    //Constroi o botão de voltar
    Widget _buildButtonBack() {
      return Expanded(
        child: Container(
          height: 65,
          color: CustomColors.informationBox,
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Voltar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    //Constroi o botão de confirmação
    Widget _buildButtonConfirm() {
      return Expanded(
        child: Container(
          height: 65,
          color: CustomColors.confirmButtonColor,
          child: TextButton(
            onPressed: () async {
              await pdvController.adicionarPedidos(
                  nomeProduto, unidade, price, idProduto,
                  isBalance: true,
                  quantity: pdvController.pesagemController.text);
              Get.back();
              await pdvController.clearPesagem();
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    //inicio da página

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: 400,
        height: 450,
        child: Column(
          children: [
            HeaderPopup(
              text: 'Pesagem',
              icon: Icons.balance,
              isPesagem: true,
            ),
            Expanded(
              child: _buildBody(),
            ),
            Row(
              children: [
                _buildButtonBack(),
                _buildButtonConfirm(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
