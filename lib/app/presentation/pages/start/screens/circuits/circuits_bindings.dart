import 'package:get/get.dart';

import 'circuits_controller.dart';

class CircuitsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CircuitsController());
  }
}
