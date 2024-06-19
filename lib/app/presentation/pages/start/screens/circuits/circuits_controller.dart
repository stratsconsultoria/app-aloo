import 'package:get/get.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../../controllers/auth_controller.dart';

class CircuitsController extends GetxController {
  AuthController authController;
  CircuitsListUsecase listCircuits;

  CircuitsController({
    required this.authController,
    required this.listCircuits,
  });

  RxList<CircuitEntity> circuits = <CircuitEntity>[].obs;
  RxBool circuitsIsLoading = false.obs;

  @override
  Future<void> onInit() async {
    fetchCircuits();
    super.onInit();
  }

  Future<void> fetchCircuits() async {
    circuitsIsLoading.value = true;
    final response = await listCircuits.list();
    circuits.assignAll(response);
    circuitsIsLoading.value = false;
  }
}
