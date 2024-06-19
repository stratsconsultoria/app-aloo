import 'package:get/get.dart';
import '../../../../../data/infra/http/http.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../../domain/usecases/usecases.dart';
import 'requisitions_controller.dart';

class RequisitionsBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final RequisitionsListRepository requisitionListRepo = RequisitionsListRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<RequisitionsListUsecase>(() => IRequisitionsListUsecase(
          repository: requisitionListRepo,
        ));

    Get.put(RequisitionsController(
      authController: Get.find(),
      listRequisitions: Get.find(),
    ));
  }
}
