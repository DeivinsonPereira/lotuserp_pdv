// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_pdv/controllers/pdv.controller.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/information_buttons_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/payment_total_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/product_widget.dart';
import 'package:lotuserp_pdv/pages/pdv/widgets/resume_list_pedidos_widget.dart';

import '../../services/dependencies.dart';
import 'widgets/line_group_widget.dart';
import 'service/logic/logic_icon_back_button.dart';
import 'widgets/search_camp_widget.dart';

class PdvMonitorPage extends StatelessWidget {
  const PdvMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.sidebarController();
    Dependencies.passwordController();
    Dependencies.responseServidorController();
    Dependencies.configcontroller();
    Dependencies.textFieldController();
    var globalController = Dependencies.globalController();
    var controller = Dependencies.pdvController();
    Dependencies.paymentController();
    var saveImagePathController = Dependencies.saveImagePathController();

    globalController.setIdUsuario();
    globalController.setCaixaAbertaId(globalController.userId);
    controller.fetchDataFromDatabase();
    saveImagePathController.clearProductImages();
    saveImagePathController.addImagePathFavorite();
    saveImagePathController.addImagePathFavorites();

    // linha de pesquisa e voltar
    Widget lineSearchAndBackButton(PdvController controller) {
      return Row(
        children: [
          // Icone de voltar
          IconButton(
            onPressed: () {
              LogicIconBackButton().getLogic(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 70, 70, 70),
            ),
          ),

          // Constrói o campo de busca
          const Flexible(
            child: SearchCamp(),
          ),
        ],
      );
    }

    // divisão da tela
    Widget divisionWidget(PdvController controller) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(children: [
                // Constrói a linha de pesquisa e voltar
                lineSearchAndBackButton(controller),
                // Constrói a linha do grupo
                const LineGroup(),
                // Constrói os produtos
                const ProductWidget(),
                // Constrói a linha dos botões e informaçãoes
                Expanded(
                  child:
                      InformationButtonsWidget(controllerReactive: controller),
                )
              ]),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  //Constrói o resumo dos pedidos
                  Flexible(
                    flex: 6,
                    child: ResumeListPedidosWidget(controller: controller),
                  ),
                  const SizedBox(height: 10),
                  // Constrói o botão pagamento e o total
                  Flexible(
                    flex: 1,
                    child: PaymentTotalWidget(controller: controller),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    //início do conteúdo
    Widget conteudo(PdvController controller) {
      return SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: divisionWidget(controller),
        ),
      );
    }

    //builder da page
    return GetBuilder<PdvController>(
      init: PdvController(),
      builder: (controller) {
        return Scaffold(
          body: conteudo(controller),
        );
      },
    );
  }
}
