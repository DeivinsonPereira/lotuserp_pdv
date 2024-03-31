// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../controllers/pdv.controller.dart';
import '../../../core/custom_colors.dart';
import '../../cpf_cnpj_page.dart/cpf_cnpj_page.dart';
import '../../product/product_monitor_page.dart';
import '../../second_copy/second_copy_page.dart';
import '../custom/buttons_widget.dart';

class InformationButtonsWidget extends StatelessWidget {
  final PdvController controllerReactive;
  const InformationButtonsWidget({
    Key? key,
    required this.controllerReactive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sidebarController = Dependencies.sidebarController();
    var passwordController = Dependencies.passwordController();
    var responseServidorController = Dependencies.responseServidorController();

    // Constrói o conteiner da logo
    Widget _buildContainerLogo() {
      return Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
            color: CustomColors.customSwatchColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              'assets/images/Logo Nova Branco Vertical.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }

    // Constrói a hora no conteiner de informações
    Widget _buildHours() {
      return Row(
        children: [
          Text(
            sidebarController.hours.value,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      );
    }

    // Constrói o id do caixa no conteiner de informações
    Widget _buildCaixaId() {
      return Text(
        '${controllerReactive.caixaId.value.toString().padLeft(6, '0')}  -  ',
        style: const TextStyle(
          color: Colors.white,
        ),
      );
    }

    // Constrói a data de abertura no conteiner de informações
    Widget _buildOpenRegisterDate() {
      return Text(
        sidebarController.dataAbertura.value,
        style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14.0),
      );
    }

    // Constrói o nome do usuario no conteiner de informações
    Widget _buildUsername() {
      return Text(
        passwordController.userController.text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      );
    }

    // Constrói o botão Produtos
    Widget _buildButtonProducts() {
      return ButtonsPdv().iconsOptions(
          FontAwesomeIcons.clipboardList,
          'Produtos',
          () => showDialog(
                context: context,
                builder: (context) {
                  return const ProductMonitorPage();
                },
              ));
    }

    // Constrói o botão CPF/CNPJ
    Widget _buildButtonCpfCnpj() {
      return ButtonsPdv().iconsOptions(
          FontAwesomeIcons.addressCard,
          'CPF/CNPJ',
          () => {
                responseServidorController.limparCpfCnpj(),
                Get.dialog(
                  barrierDismissible: false,
                  const CpfCnpjPage(),
                )
              });
    }

    // Constrói o botão Cancelar
    Widget _buildButtonCancel() {
      return ButtonsPdv().iconsOptions(
        FontAwesomeIcons.solidTrashCan,
        'Cancelar',
        () => controllerReactive.cancelarPedido(),
      );
    }

    // Constrói o botão 2ª via
    Widget _buildButtonSecondCopy() {
      return ButtonsPdv().iconsOptions(
        FontAwesomeIcons.moneyBillTrendUp,
        '2ª via',
        () => Get.dialog(
          const SecondCopyPage(),
        ),
      );
    }

    // Constrói o container de informações
    Widget _buildInformationsContainer() {
      return Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.customSwatchColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 170,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHours(),
                  Row(children: [
                    _buildCaixaId(),
                    _buildOpenRegisterDate(),
                  ]),
                  _buildUsername(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // retorna a linha das informações o botões (parte inferior esquerda da tela pdv)
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //container que envolve a logo e informações
            _buildContainerLogo(),
            // Informações
            _buildInformationsContainer(),

            // Botões
            _buildButtonProducts(),
            _buildButtonCpfCnpj(),
            _buildButtonCancel(),
            _buildButtonSecondCopy(),
          ],
        ),
      ),
    );
  }
}
