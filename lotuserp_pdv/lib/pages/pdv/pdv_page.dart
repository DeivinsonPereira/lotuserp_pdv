import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_card_machine.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_monitor_page.dart';
import 'package:lotuserp_pdv/pages/pdv/pdv_tablet_page.dart';

class PdvPage extends StatelessWidget {
  const PdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const PdvMonitorPage();
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const PdvTabletPage();
        } else {
          return const PdvCardMachinePage();
        }
      },
    );
  }
}
