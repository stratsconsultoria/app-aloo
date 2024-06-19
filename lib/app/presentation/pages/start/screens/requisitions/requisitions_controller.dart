import 'package:app_aloo/app/domain/usecases/usecases.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../controllers/auth_controller.dart';

class RequisitionsController extends GetxController {
  AuthController authController;
  RequisitionsListUsecase listRequisitions;

  RequisitionsController({
    required this.authController,
    required this.listRequisitions,
  });

  RxBool requisitionsIsLoading = false.obs;
  Rx<String> companyName = ''.obs;
  RxList<RequisitionEntity> requisitions = <RequisitionEntity>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;

  @override
  Future<void> onInit() async {
    fetchListRequisitions();
    super.onInit();
  }

  Future<void> fetchListRequisitions() async {
    requisitionsIsLoading.value = true;
    final response = await listRequisitions.list(currentPage.value);
    requisitions.assignAll(response.data);
    currentPage.value = response.paginaAtual;
    totalPages.value = response.totalPaginas;
    requisitionsIsLoading.value = false;
  }
}
