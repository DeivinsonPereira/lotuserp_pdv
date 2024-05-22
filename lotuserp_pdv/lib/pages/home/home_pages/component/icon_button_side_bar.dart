// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/pages/close_register/components/create_password_close_register.dart';
import 'package:lotuserp_pdv/pages/common/custom_cherry.dart';
import 'package:lotuserp_pdv/pages/open_register/open_register_page.dart';
import 'package:lotuserp_pdv/utils/methods/password_close_register/password_close_register_features.dart';

import '../../../../core/app_routes.dart';
import '../../../../services/dependencies.dart';
import '../../../../shared/isar_service.dart';
import '../../../close_register/components/confirm_password_close_register.dart';
import '../../../load_data/load_data_page.dart';
import '../../../moviment_cash/moviment_cash_page.dart';

//Botões para o side bar
// ignore: must_be_immutable
class IconButtonSideBar extends StatelessWidget {
  final IconData icon;
  final String text;
  String? navigationIcon;
  bool? isAbrirCaixa = false;
  bool? isMovimentarCaixa = false;
  bool? isPdv = false;
  bool? isLoadData = false;
  bool? isFecharCaixa = false;
  bool? isSegundaVia = false;
  bool? isNfceSegundaVia = false;

  IconButtonSideBar(
      {Key? key,
      required this.icon,
      required this.text,
      this.navigationIcon,
      this.isAbrirCaixa,
      this.isMovimentarCaixa,
      this.isPdv,
      this.isLoadData,
      this.isFecharCaixa,
      this.isSegundaVia,
      this.isNfceSegundaVia})
      : super(key: key);

  IsarService service = IsarService();
  InformationController informationController =
      Dependencies.informationController();
  var pdvController = Dependencies.pdvController();
  var saveImagePathController = Dependencies.saveImagePathController();
  var closeRegisterController = Dependencies.closeRegisterController();
  final _passwordCloseRegisterController =
      Dependencies.passwordCloseRegisterController();
  final _passwordCloseRegisterFeatures = PasswordCloseRegisterFeatures();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(45, 252, 252, 252),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: InkWell(
        onTap: () async {
          await informationController.searchCaixaId();
          var dadosUsuario = await service.getUserLogged();
          bool caixaExistente =
              await service.checkUserCaixa(dadosUsuario!.id_user!);

          if (isAbrirCaixa == true) {
            caixaExistente
                ? const CustomCherryError(
                        message:
                            'Já existe um caixa aberto para o usuário logado.')
                    .show(context)
                : Get.dialog(const OpenRegisterPage());
          } else if (isMovimentarCaixa == true ||
              isPdv == true ||
              isFecharCaixa == true) {
            if (!caixaExistente) {
              const CustomCherryError(
                      message:
                          'Não existe um caixa aberto para o usuário logado.')
                  .show(context);
            } else {
              if (isMovimentarCaixa == true) {
                Get.dialog(const MovimentCashPage());
              } else if (isPdv == true) {
                await pdvController.setGrupos();
                await pdvController.setGruposDescription();
                await saveImagePathController.addImagePathGroup();
                pdvController.setImagensGrupos();
                await pdvController.setListAllProducts();
                pdvController.setGroupId(0);
                await pdvController.setProductsByIdGroup();
                pdvController.setImagensProducts();
                Future.delayed(const Duration(seconds: 1), () {
                  Get.toNamed(PagesRoutes.pdvMonitor);
                });
              } else if (isFecharCaixa == true) {
                _handleCloseRegister(context);
              }
            }
          } else if (isLoadData == true) {
            Get.dialog(const LoadDataPage());
          } else {
            Get.offAndToNamed(navigationIcon!);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleCloseRegister(BuildContext context) async {
    _passwordCloseRegisterController.password = '';
    await _passwordCloseRegisterFeatures.getPassword();
    if (_passwordCloseRegisterController.password.isEmpty) {
      Get.dialog(const CreatePasswordCloseRegister());
      return;
    }

    Get.dialog(const ConfirmPasswordCloseRegister());
  }
}
