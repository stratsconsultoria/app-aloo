import '../../configs/app_controller.dart';

class Api {
  static const homologUrl = 'https://portal.aloo.com.br/api/';
  static const prodUrl = 'https://portal.aloo.com.br/api/';
  String baseUrl = AppController.production ? prodUrl : homologUrl;

  // Auth
  static const login = 'login.php';

  // busness
  static const listCompanies = 'listEmpresas.php';
  static const lastRequisitions = 'listUltimosAtendimentos.php';
  static const listRequisitions = 'listAtendimentos.php';
  static const listCircuits = 'listCircuitos.php';
  static const listCircuitsByCNPJ = 'listCircuitosCnpj.php';
  static const requisitionDetails = 'detailAtendimentos.php';
  static const newRequisition = 'abrirChamado.php';

  // notification
  static const listAlerts = 'listAvisos.php';
}
