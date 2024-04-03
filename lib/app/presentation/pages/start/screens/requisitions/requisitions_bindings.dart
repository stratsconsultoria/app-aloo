import 'package:get/get.dart';
import 'requisitions_controller.dart';

class RequisitionsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RequisitionsController());
  }
}
