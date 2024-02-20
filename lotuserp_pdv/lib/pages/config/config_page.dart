import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/config/config_pages/config_monitor.dart';

import 'config_pages/config_mobile.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const ConfigMonitor();
          /*    } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const PdvTabletPage();*/
        } else if (constraints.maxWidth < 800) {
          return const ConfigMobile();
        }
        return const ConfigMonitor();
      },
    );
  }
}
