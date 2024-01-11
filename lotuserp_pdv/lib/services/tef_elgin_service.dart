import 'package:flutter/services.dart';

abstract class TefService {
  static const platform = MethodChannel('com.lotuserp_pdv/tef');

  static Future<String?> startTef(Map<String, String?> params) async {
    try {
      final String? result = await platform.invokeMethod('startTEF', params);
      return result;
    } on PlatformException catch (e) {
      
      print("Erro ao chamar o TEF: '${e.message}'.");
      return null;
    }
  }
}
