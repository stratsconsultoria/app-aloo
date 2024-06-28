import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/infra/cache/cache.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../components/components.dart';
import '../../controllers/auth_controller.dart';
import 'screens/circuits/circuits_page.dart';
import 'screens/home/home_page.dart';
import 'screens/requisitions/requisitions_page.dart';

class StartController extends GetxController {
  AuthController authController;
  CircuitsListUsecase listCircuits;
  NewRequisitionUsecase newRequisition;

  StartController({
    required this.authController,
    required this.listCircuits,
    required this.newRequisition,
  });

  Rx<String> companyName = ''.obs;
  Rx<String> companyCNPJ = ''.obs;
  RxInt selectedScreen = 0.obs;
  RxBool circuitsIsLoading = false.obs;
  RxBool registerIsLoading = false.obs;
  Rx<TextEditingController> problemDescriptionController = TextEditingController().obs;
  Rx<String> selectedType = 'degradação'.obs;
  Rx<CircuitEntity> selectedCircuit = CircuitEntity(
    id: '',
    contrato: '',
    plano: '',
    banda: '',
    logradouro: '',
    numero: '',
    bairro: '',
    cep: '',
    pontoReferencia: '',
    cidade: '',
    estado: '',
    complemento: '',
    ativacao: DateTime.now(),
  ).obs;
  RxList<CircuitEntity> circuits = <CircuitEntity>[].obs;

  RxList<Widget> screens = <Widget>[
    const HomePage(),
    const CircuitsPage(),
    const RequisitionsPage(),
  ].obs;

  @override
  Future<void> onInit() async {
    companyCNPJ.value = await CacheAdapter().read(CacheString.companyCNPJ);
    fetchCircuitsByCNPJ();
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    super.onInit();
  }

  void setScreen(int index) {
    selectedScreen.value = index;
  }

  Future<void> fetchCircuitsByCNPJ() async {
    circuitsIsLoading.value = true;
    final response = await listCircuits.list(cnpj: companyCNPJ.value);
    circuits.assignAll(response);
    selectedCircuit.value = circuits[0];
    circuitsIsLoading.value = false;
  }

  setCircuit(CircuitEntity? newCircuit) {
    if (newCircuit != null) {
      selectedCircuit.value = newCircuit;
    }
  }

  setRequisitionType(String? type) {
    if (type != null) {
      selectedType.value = type;
    }
  }

  Future<void> registerRequisition(context) async {
    if (problemDescriptionController.value.text.isEmpty) {
      await CustomAlertDialog.call(
        context,
        title: 'Campo obrigatório',
        description: 'Descreva brevemente o seu problema para abrir um novo chamado.',
      );
    } else {
      registerIsLoading.value = true;
      bool response = await newRequisition.post(
        circuit: selectedCircuit.value.contrato,
        description: problemDescriptionController.value.text,
        type: selectedType.value,
      );
      if (response) {
        problemDescriptionController.value.clear();
        Get.back();
        await CustomAlertDialog.call(
          context,
          title: 'Chamdo aberto',
          description: 'Seu chamado foi aberto.',
        );
        registerIsLoading.value = false;
      } else {
        CustomSnackbar.call(
          title: 'Erro',
          description:
              'Não foi possível registrar a solicitação de abertura de chamado. Tente novamente',
        );
        registerIsLoading.value = false;
      }
    }
  }
}
