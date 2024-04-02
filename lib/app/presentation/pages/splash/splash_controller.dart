import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/infra/cache/cache.dart';
import '../../app_routes.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await verifyCache();
    super.onInit();
  }

  Future<void> verifyCache() async {
    bool isLogged = await CacheAdapter().read(CacheString.authTokenKey) != null;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      if (isLogged) {
        bool companySelected = await CacheAdapter().read(CacheString.currentCompany) != null;
        if (companySelected) {
          Get.offAndToNamed(Routes.home);
        } else {
          Get.offAndToNamed(Routes.company);
        }
      } else {
        Get.offAndToNamed(Routes.login);
      }
    });
  }
}
