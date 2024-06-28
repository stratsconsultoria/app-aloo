import 'package:get/get.dart';

import '../../../data/infra/http/http.dart';
import '../../../data/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import 'start_controller.dart';

class StartBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final CircuitsListRepository circuitsListRepo = CircuitsListRepository(
      httpClient: httpClient,
    );

    final NewRequisitionRepository newRequisitionRepo = NewRequisitionRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<CircuitsListUsecase>(
      () => ICircuitsListUsecase(repository: circuitsListRepo),
    );

    Get.lazyPut<NewRequisitionUsecase>(
      () => INewRequisitionUsecase(repository: newRequisitionRepo),
    );

    Get.put(
      StartController(
        authController: Get.find(),
        listCircuits: Get.find(),
        newRequisition: Get.find(),
      ),
    );
  }
}
