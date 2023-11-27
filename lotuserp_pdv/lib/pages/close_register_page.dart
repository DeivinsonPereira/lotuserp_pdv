import 'package:flutter/material.dart';
import 'package:lotuserp_pdv/pages/close_register_list_page.dart';

class CloseRegisterPage extends StatelessWidget {
  const CloseRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/images/Logo_Nova_Transparente.png',
          ),
        ),
        centerTitle: true,
      ),
      body: const CloseRegisterList(),
    );
  }
}
