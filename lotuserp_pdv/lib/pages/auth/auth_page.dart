import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/core/app_colors.dart';

class  AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      
      backgroundColor: CustomColors.customSwatchColor[900],
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              //logo
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(
                        45,
                      ),
                    ),
                  ),
                  child:  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                       /*   style: Icon(Icons.vpn_key),
                          icon: Icons.vpn_key,
                          label: 'Número de Contrato', */
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          child: Text('exemplo'),
                       /*   label: 'Autenticar',
                          onPressed: () {
                            Get.to(() => const SignInScreen());
                          }, */
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
