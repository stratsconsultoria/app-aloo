import 'package:get/get.dart';
import './requisition_details_controller.dart';

class RequisitionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RequisitionDetailsController(requisitionId: Get.arguments));
  }
}
