import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SideBarController extends GetxController {
  RxBool isOpen = false.obs;
  RxString dataAbertura = ''.obs;
  RxString hours = ''.obs;

  IsarService service = IsarService();

  void toggle() {
    isOpen.value = !isOpen.value;
  }

  //inicializa os métodos necesarios
  @override
  void onInit() {
    super.onInit();
    initializeTimezone();
    hoursFormated();
    dateFormatted();

    Timer.periodic(const Duration(seconds: 1), (_) {
      hoursFormated();
    });
  }

  //Inicializa o timezone
  void initializeTimezone() {
    tz.initializeTimeZones();
  }

  //formata a hora referente ao horario de São Paulo
  void hoursFormated() {
    var saoPauloTimeZone = tz.getLocation('America/Sao_Paulo');
    var saoPauloDateTime = tz.TZDateTime.from(DateTime.now(), saoPauloTimeZone);
    var hourFormatted = DateFormat('HH:mm:ss').format(saoPauloDateTime);

    hours.value = hourFormatted;
  }

  //formata a data referente à data de abertura do caixa
  void dateFormatted() async {
    var logged = service.getUserLogged();
    var id = await logged.asStream().first.then((value) => value?.id_user ?? 0);

    var caixa = service.getCaixaWithIdUser(id);
    var dataAberturaCaixa =
        await caixa.asStream().first.then((value) => value?.abertura_data);
    var dateFormatted = DateFormat('dd/MM/yyyy').format(dataAberturaCaixa!);

    dataAbertura.value = dateFormatted;
  }
}
