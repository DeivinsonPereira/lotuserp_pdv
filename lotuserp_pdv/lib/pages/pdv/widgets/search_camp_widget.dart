import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/services/dependencies.dart';

import '../../../controllers/search_product_pdv_controller.dart';
import '../../../services/format_txt.dart';

class SearchCamp extends StatelessWidget {
  const SearchCamp({super.key});

  @override
  Widget build(BuildContext context) {
    var searchProductPdvController = Dependencies.searchProductPdvController();

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: GetBuilder<SearchProductPdvController>(
        builder: (_) {
          return TextField(
            controller: searchProductPdvController.searchController,
            inputFormatters: [UpperCaseTxt()],
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  searchProductPdvController.updateIsBarCode();
                },
                icon: const Icon(Icons.barcode_reader),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 10, right: 10, top: 12),
              disabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
              hintText: _.isBarCode
                  ? 'Faça a leitura do código de barras'
                  : 'Busque um produto por nome',
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 53, 53, 53), fontSize: 18),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: _.isBarCode
                  ? IconButton(
                      onPressed: () {
                        _.updateIsBarCode();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.barcode,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _.updateIsBarCode();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.keyboard,
                        color: Colors.black,
                      ),
                    ),
            ),
            onChanged: (value) {
              searchProductPdvController.updateSearch();
              if (value == '') {
                searchProductPdvController.updateIsSearch(false);
              } else {
                searchProductPdvController.updateIsSearch(true);
              }
            },
          );
        },
      ),
    );
  }
}
