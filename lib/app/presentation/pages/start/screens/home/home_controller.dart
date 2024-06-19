import 'package:get/get.dart';

import '../../../../../data/infra/cache/cache.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../../controllers/auth_controller.dart';

class HomeController extends GetxController {
  AuthController authController;
  LastRequisitionsUsecase lastRequisitions;

  HomeController({
    required this.authController,
    required this.lastRequisitions,
  });

  RxBool requisitionsIsLoading = false.obs;
  Rx<String> companyName = ''.obs;
  RxList<RequisitionEntity> requisitions = <RequisitionEntity>[].obs;

  @override
  Future<void> onInit() async {
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    fetchListRequisitions();
    super.onInit();
  }

  Future<void> fetchListRequisitions() async {
    requisitionsIsLoading.value = true;
    final response = await lastRequisitions.fetch();
    requisitions.assignAll(response);
    requisitionsIsLoading.value = false;
  }
}
