import 'package:get/get.dart';

import '../../../data/infra/http/http.dart';
import '../../../data/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final LoginRepository loginRepo = LoginRepository(httpClient: httpClient);

    Get.lazyPut<LoginUsecase>(() => ILoginUsecase(repository: loginRepo));

    Get.put(LoginController(
      loginUsecase: Get.find(),
      authController: Get.find(),
    ));
  }
}
