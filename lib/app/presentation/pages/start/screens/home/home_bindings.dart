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

    final AlertsRepository alertsRepo = AlertsRepository(
      httpClient: httpClient,
    );

    final CircuitsListRepository circuitsListRepo = CircuitsListRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<CircuitsListUsecase>(() => ICircuitsListUsecase(
          repository: circuitsListRepo,
        ));

    Get.lazyPut<LastRequisitionsUsecase>(() => ILastRequisitionsUsecase(
          repository: lastRequisitionsRepo,
        ));

    Get.lazyPut<AlertsUsecase>(() => IAlertsUsecase(repository: alertsRepo));

    Get.put(HomeController(
      authController: Get.find(),
      lastRequisitions: Get.find(),
      alertsUsecase: Get.find(),
      listCircuits: Get.find(),
    ));
  }
}
