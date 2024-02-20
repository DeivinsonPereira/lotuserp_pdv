import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/empresa_valida/empresa_valida_pages/empresa_valida_popup_monitor.dart';

import 'empresa_valida_pages/empresa_valida_popup_mobile.dart';

class EmpresaValidaPopupPage extends StatelessWidget {
  const EmpresaValidaPopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const EmpresaValidaPopupMonitor();
          /*    } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const PdvTabletPage();*/
        } else if (constraints.maxWidth < 800) {
          return const EmpresaValidaPopupMobile();
        }
        return const EmpresaValidaPopupMonitor();
      },
    );
  }
}