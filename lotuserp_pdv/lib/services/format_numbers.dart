import 'package:intl/intl.dart';

abstract class FormatNumbers {

  static String formatNumbertoString(double? number){
    return NumberFormat('###,###,###,##0.00', 'pt_BR').format(number);
  }

  static double formatStringToDouble(String number){
    return double.parse(number.replaceAll('.', '').replaceAll(',', '.'));
  }
}