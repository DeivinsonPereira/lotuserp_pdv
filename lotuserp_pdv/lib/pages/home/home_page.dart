import 'package:flutter/material.dart';

import 'home_pages/home_page_mobile.dart';
import 'home_pages/home_page_monitor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return const HomePageMonitor();
       // } else if (constraints.maxWidth < 1200 && constraints.maxWidth >= 800) {
       //   return const HomeTablet();
        } else {
          return const HomePageMobile();
        }
        
      }
    );
  }
}
