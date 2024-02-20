import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/empresa_block/empresa_block_pages/block_verify_popup_monitor.dart';

import 'empresa_block_pages/block_verify_popup_mobile.dart';

class BlockVerifyPopupPage extends StatelessWidget {
  const BlockVerifyPopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const BlockVerifyPopupMonitor();
          /*    } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
          return const PdvTabletPage();*/
        } else if (constraints.maxWidth < 800) {
          return const BlockVerifyPopupMobile();
        }
        return const BlockVerifyPopupMonitor();
      },
    );
  }
}