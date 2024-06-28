import 'package:get/get.dart';

import '../../../../../data/infra/cache/cache.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../../components/components.dart';
import '../../../../controllers/auth_controller.dart';
import '../../components/components.dart';

class HomeController extends GetxController {
  AuthController authController;
  LastRequisitionsUsecase lastRequisitions;
  AlertsUsecase alertsUsecase;
  CircuitsListUsecase listCircuits;

  HomeController({
    required this.authController,
    required this.lastRequisitions,
    required this.alertsUsecase,
    required this.listCircuits,
  });

  RxBool requisitionsIsLoading = false.obs;
  RxBool alertsIsLoading = false.obs;
  RxBool circuitsIsLoading = false.obs;
  Rx<String> companyName = ''.obs;
  Rx<String> companyCNPJ = ''.obs;
  RxList<RequisitionEntity> requisitions = <RequisitionEntity>[].obs;
  RxList<AlertEntity> alerts = <AlertEntity>[].obs;
  RxList<CircuitEntity> circuits = <CircuitEntity>[].obs;

  @override
  Future<void> onInit() async {
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    companyCNPJ.value = await CacheAdapter().read(CacheString.companyCNPJ);
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

  Future<void> fetchCircuitsByCNPJ() async {
    circuitsIsLoading.value = true;
    final response = await listCircuits.list(cnpj: companyCNPJ.value);
    circuits.assignAll(response);
    circuitsIsLoading.value = false;
  }

  Future<void> newRequisition(context) async {
    await fetchCircuitsByCNPJ();
    customBottomSheet(
      context,
      body: const NewRequisitionForm(),
    );
  }
}
