import 'package:get/get.dart';

import '../collections/image_path_logo.dart';
import '../services/dependencies.dart';
import '../shared/isar_service.dart';
import '../shared/widgets/endpoints_widget.dart';

class LogoController extends GetxController {
  var configController = Dependencies.configcontroller();
  IsarService service = IsarService();

  var urlLogoPadrao = ''.obs;
  var urlLogoBranca = ''.obs;

  image_path_logo logoPadrao = image_path_logo('', '');
  image_path_logo logoBranca = image_path_logo('', '');

  var logoImagePadrao = ''.obs;
  var logoImageBranca = ''.obs;

  Future<void> setUrlImages() async {
    urlLogoBranca.value =
        await Endpoints().endpointSearchImageDIV('PDV_Logo_Branca.png');
    urlLogoPadrao.value =
        await Endpoints().endpointSearchImageDIV('PDV_Logo_Padrao.png');
  }

  Future<void> setImages() async {
    logoPadrao = await service.getImageLogoPath('Padrao');
    logoBranca = await service.getImageLogoPath('Branca');
  }

  Future<void> getImagePath() async {
    logoImagePadrao.value = logoPadrao.path_image!;
    logoImageBranca.value = logoBranca.path_image!;
  }
}