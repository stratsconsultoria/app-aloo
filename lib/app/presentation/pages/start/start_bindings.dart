import 'package:get/get.dart';
import 'start_controller.dart';

class StartBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      StartController(authController: Get.find()),
    );
  }
}
