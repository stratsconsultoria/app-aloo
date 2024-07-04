import 'package:get/get.dart';

import '../../../data/infra/http/http.dart';
import '../../../data/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import 'requisition_details_controller.dart';

class RequisitionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final RequisitionDetailsRepository requisitionDetailsRepo = RequisitionDetailsRepository(
      httpClient: httpClient,
    );

    final AnexosRepository anexosRepo = AnexosRepository(
      httpClient: httpClient,
    );

    Get.lazyPut<RequisitionDetailsUsecase>(
      () => IRequisitionsDetailsUsecase(repository: requisitionDetailsRepo),
    );

    Get.lazyPut<AnexosUsecase>(
      () => IAnexosUsecase(repository: anexosRepo),
    );

    Get.put(RequisitionDetailsController(
      requisitionId: Get.arguments,
      authController: Get.find(),
      requisitionDetailsUsecase: Get.find(),
      anexosUsecase: Get.find(),
    ));
  }
}
