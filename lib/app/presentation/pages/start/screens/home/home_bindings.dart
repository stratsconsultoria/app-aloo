import 'package:get/get.dart';

import '../../../../../data/infra/http/http.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../../domain/usecases/usecases.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final LastRequisitionsRepository lastRequisitionsRepo = LastRequisitionsRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<LastRequisitionsUsecase>(() => ILastRequisitionsUsecase(
          repository: lastRequisitionsRepo,
        ));

    Get.put(HomeController(
      authController: Get.find(),
      lastRequisitions: Get.find(),
    ));
  }
}
