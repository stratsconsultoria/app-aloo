import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app/data/infra/dio/dio_adapter.dart';
import '../../app/data/infra/http/http_client.dart';
import '../../app/presentation/controllers/auth_controller.dart';
import 'app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpClient>(
      () => DioAdapter(
        Dio(),
      ),
      fenix: true,
    );

    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );

    Get.put<AppController>(
      AppController(),
      permanent: true,
    );
  }
}
