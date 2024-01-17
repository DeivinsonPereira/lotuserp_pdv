import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/controllers/information_controller.dart';
import 'package:lotuserp_pdv/pages/auth/widget/custom_snack_bar.dart';

import '../../../core/app_routes.dart';
import '../../../services/injection_dependencies.dart';
import '../../../shared/isar_service.dart';
import '../../close_register/close_register_page.dart';
import '../../load_data/load_data_page.dart';
import '../../moviment_cash/moviment_cash_page.dart';
import '../../open_register/open_register_page.dart';
import '../../second_copy/second_copy_page.dart';

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
      this.isSegundaVia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IsarService service = IsarService();
    InformationController informationController =
        InjectionDependencies.informationController();

    return InkWell(
      onTap: () async {
        await informationController.searchCaixaId();
        var dadosUsuario = await service.getUserLogged();
        bool caixaExistente =
            await service.checkUserCaixa(dadosUsuario!.id_user!);

        if (isAbrirCaixa == true) {
          caixaExistente
              ? const CustomSnackBar(
                      message:
                          'Já existe um caixa aberto para o usuário logado.')
                  .show()
              : Get.dialog(const OpenRegisterPage());
        } else if (isMovimentarCaixa == true ||
            isPdv == true ||
            isFecharCaixa == true ||
            isSegundaVia == true) {
          if (!caixaExistente) {
            const CustomSnackBar(
                    message:
                        'Não existe um caixa aberto para o usuário logado.')
                .show();
          } else {
            if (isMovimentarCaixa == true) {
              Get.dialog(const MovimentCashPage());
            } else if (isPdv == true) {
              Get.offAndToNamed(PagesRoutes.pdvMonitor);
            } else if (isFecharCaixa == true) {
              Get.dialog(const CloseRegisterPage());
            } else if (isSegundaVia == true) {
              Get.dialog(const SecondCopyPage());
            }
          }
        } else if (isLoadData == true) {
          Get.dialog(const LoadDataPage());
        } else {
          Get.offAndToNamed(navigationIcon!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
        child: Row(
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
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
