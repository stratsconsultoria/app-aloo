import '../../configs/app_controller.dart';

class Api {
  static const homologUrl = 'https://portal.aloo.com.br/api/';
  static const prodUrl = 'https://portal.aloo.com.br/api/';
  String baseUrl = AppController.production ? prodUrl : homologUrl;

  // Auth
  static const login = 'login.php';
}
