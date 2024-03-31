// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../core/custom_colors.dart';
import '../custom/get_images.dart';

class LineGroup extends StatelessWidget {
  const LineGroup({super.key});

  @override
  Widget build(BuildContext context) {
    var pdvController = Dependencies.pdvController();

    // Contrói a imagem do grupo
    Widget _buildImageGroup(int index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: getImageGroup(pdvController.imagesGroup[index]),
      );
    }

    // Constrói o nome no grupo
    Widget _buildNameGroup(dynamic selectedGroup, int index) {
      return Obx(() => Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: pdvController.indexGrupo.value == index
                      ? CustomColors.customSwatchColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(3),
              child: Text(
                pdvController.gruposDescription[index],
                style: TextStyle(
                  color: pdvController.indexGrupo.value == index
                      ? Colors.white
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ));
    }

    // Contrói o card do grupo
    Widget _buildCardGroup(int index, dynamic selectedGroup) {
      return GestureDetector(
        onTap: () async {
          pdvController.setGroupId(index);
          pdvController.setProductsByIdGroup();
          await pdvController.setImagensProducts();
        },
        child: SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageGroup(index),
              _buildNameGroup(selectedGroup, index),
            ],
          ),
        ),
      );
    }

    // Constrói o grupo
    Widget _buildGroup() {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pdvController.gruposDescription.length,
          itemBuilder: (context, index) {
            var selectedGroup = pdvController.gruposDescription[index];
            return _buildCardGroup(index, selectedGroup);
          });
    }

    // Constrói a linha do grupo
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: Get.size.height * 0.15,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(child: _buildGroup()),
            ],
          ),
        ),
      ),
    );
  }
}
