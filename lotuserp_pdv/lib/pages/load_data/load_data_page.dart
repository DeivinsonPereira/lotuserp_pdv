import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_pdv/core/app_routes.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';

class LoadDataPage extends StatelessWidget {
  const LoadDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 15.0,
              bottom: 15.0,
            ),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 1,
                        color: CustomColors.customSwatchColor[900]!,
                      ),
                      color: CustomColors.customSwatchColor[900],
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CARGA DE DADOS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(FontAwesomeIcons.download, size: 35),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                            width: size.width * 0.2,
                            height: 639.3,
                            decoration: BoxDecoration(
                              color: CustomColors.customSwatchColor[900],
                              border: Border.all(
                                  width: 1,
                                  color: CustomColors.customSwatchColor[900]!),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.wifi,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Verificar Conexão API',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
