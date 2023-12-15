import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SideBarController extends GetxController {
  RxBool isOpen = false.obs;
  RxString dataAbertura = ''.obs;
  RxString hours = ''.obs;

  void toggle() {
    isOpen.value = !isOpen.value;
  }

  @override
  void onInit() {
    super.onInit();
    initializeTimezone();
    dateAndHoursFormated();

    Timer.periodic(const Duration(seconds: 1), (_) {
      dateAndHoursFormated();
    });
  }

  void initializeTimezone() {
    tz.initializeTimeZones();
  }

  void dateAndHoursFormated() {
    var saoPauloTimeZone = tz.getLocation('America/Sao_Paulo');
    var saoPauloDateTime = tz.TZDateTime.from(DateTime.now(), saoPauloTimeZone);
    var hourFormatted = DateFormat('HH:mm:ss').format(saoPauloDateTime);
    var dateFormatted = DateFormat('dd/MM/yyyy').format(saoPauloDateTime);

    dataAbertura.value = dateFormatted;
    hours.value = hourFormatted;
  }
}
