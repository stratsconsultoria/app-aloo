import 'package:get/get.dart';

import '../../../../../data/infra/http/http.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../../domain/usecases/usecases.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final RequisitionsListRepository requisitionsListRepo = RequisitionsListRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<RequisitionsListUsecase>(() => IRequisitionsListUsecase(
          repository: requisitionsListRepo,
        ));

    Get.put(HomeController(
      authController: Get.find(),
      listRequisitions: Get.find(),
    ));
  }
}
