import '../configs/app_controller.dart';

class Api {
  static const homologUrl = 'http://api.stratsti.com.br/';
  static const prodUrl = 'http://api.stratsti.com.br/';
  String baseUrl = AppController.production ? prodUrl : homologUrl;

  // Auth
  static const login = 'a-login';
  static const score = 'a-pontos';
  static const profile = 'a-perfil';
  static const store = 'a-lojas';
  static const fullStore = 'a-lojasFull';
  static const experiences = 'a-experiencias';
  static const banner = 'a-banner';
  static const launchs = 'a-lancamentos';
  static const rescue = 'a-retirada';
}
