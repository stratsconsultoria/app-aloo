import 'package:get/get.dart';

import '../../../../../data/infra/cache/cache.dart';
import '../../../../controllers/auth_controller.dart';

class HomeController extends GetxController {
  AuthController authController;

  HomeController({required this.authController});

  Rx<String> companyName = ''.obs;

  @override
  Future<void> onInit() async {
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    super.onInit();
  }
}
