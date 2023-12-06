import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/controllers/login_controller.dart';
import 'package:lotuserp_pdv/core/custom_colors.dart';
import 'package:lotuserp_pdv/pages/widgets_pages/form_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 50,
              child: Material(
                color: const Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                'Bem vindo!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF2B2F5B),
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Form(
                              child: Column(
                                children: [
                                  FormWidgets()
                                      .customTextField(Icons.person, 'Usuário'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => FormWidgets().customTextField(
                                        Icons.lock, 'Senha',
                                        obscureText: true),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: SizedBox(
                              width: 180,
                              child: Image.asset(
                                  'assets/images/Logo_Nova_Transparente.png'),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const Alignment(0, -0.72),
                              child: SizedBox(
                                width: 350,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2B2F5B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.toNamed('/');
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 24,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 70,
                                height: 70,
                                child: FloatingActionButton(
                                  backgroundColor:
                                      CustomColors.customSwatchColor,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.settings,
                                    size: 50,
                                    color: CustomColors.customContrastColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
