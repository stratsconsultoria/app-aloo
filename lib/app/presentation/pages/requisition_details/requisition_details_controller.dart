import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../controllers/auth_controller.dart';

class RequisitionDetailsController extends GetxController {
  final String requisitionId;
  final AuthController authController;
  final RequisitionDetailsUsecase requisitionDetailsUsecase;

  RequisitionDetailsController({
    required this.requisitionId,
    required this.authController,
    required this.requisitionDetailsUsecase,
  });

  Rx<RequisitionDetailsEntity> requisitionDetails = RequisitionDetailsEntity(
    atendimento: RequisitionEntity(
      id: 'id',
      protocolo: 'protocolo',
      solicitante: '',
      status: '',
      postoAtual: 'postoAtual',
      circuito: 'circuito',
      fechamento: DateTime.now(),
      abertura: DateTime.now(),
    ),
    observacoes: [],
  ).obs;
  RxBool detailsIsLoading = false.obs;
  RxBool withError = false.obs;

  @override
  Future<void> onInit() async {
    await fetchRequisitionDetails();
    super.onInit();
  }

  Future<void> fetchRequisitionDetails() async {
    detailsIsLoading.value = true;
    final result = await requisitionDetailsUsecase.fetch(requisitionId);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is RequisitionDetailsEntity) {
      requisitionDetails.value = extract;
    } else {
      withError.value = true;
    }
    detailsIsLoading.value = false;
  }
}
