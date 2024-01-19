import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class ToledoPrix3Fit {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');
  static Logger logger = Logger();
  void startListeningForWeight() {
    platform.setMethodCallHandler((MethodCall call) async {
      if (call.method == "onNewWeightData") {
        String weightData = call.arguments;
        // Atualize o TextField ou outra UI com weightData
      }
    });
  }
}
