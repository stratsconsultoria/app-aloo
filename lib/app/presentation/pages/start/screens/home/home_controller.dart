import 'package:get/get.dart';

import '../../../../../data/infra/cache/cache.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../../controllers/auth_controller.dart';

class HomeController extends GetxController {
  AuthController authController;
  LastRequisitionsUsecase lastRequisitions;
  AlertsUsecase alertsUsecase;

  HomeController({
    required this.authController,
    required this.lastRequisitions,
    required this.alertsUsecase,
  });

  RxBool requisitionsIsLoading = false.obs;
  RxBool alertsIsLoading = false.obs;
  Rx<String> companyName = ''.obs;
  RxList<RequisitionEntity> requisitions = <RequisitionEntity>[].obs;
  RxList<AlertEntity> alerts = <AlertEntity>[].obs;

  @override
  Future<void> onInit() async {
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    fetchListRequisitions();
    fetchAlerts();
    super.onInit();
  }

  Future<void> fetchListRequisitions() async {
    requisitionsIsLoading.value = true;
    final response = await lastRequisitions.fetch();
    requisitions.assignAll(response);
    requisitionsIsLoading.value = false;
  }

  Future<void> fetchAlerts() async {
    alertsIsLoading.value = true;
    final response = await alertsUsecase.list();
    alerts.assignAll(response);
    alertsIsLoading.value = false;
  }
}
