import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/auth/login_pages/login_page_monitor.dart';

import 'login_pages/login_page_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return const LoginPageMonitor();
        //}else if(constraints.maxWidth > 800){
        //  return const LoginPageTablet();
      } else if (constraints.maxWidth < 800) {
        return const LoginPageMobile();
      }
      return const LoginPageMonitor();
    });
  }
}
