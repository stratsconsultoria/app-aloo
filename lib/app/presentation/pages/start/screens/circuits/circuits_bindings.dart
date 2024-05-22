import 'package:get/get.dart';

import '../../../../../data/infra/http/http.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../../domain/usecases/usecases.dart';
import 'circuits_controller.dart';

class CircuitsBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final CircuitsListRepository circuitsListRepo = CircuitsListRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<CircuitsListUsecase>(() => ICircuitsListUsecase(
          repository: circuitsListRepo,
        ));
    Get.put(CircuitsController(
      authController: Get.find(),
      listCircuits: Get.find(),
    ));
  }
}
