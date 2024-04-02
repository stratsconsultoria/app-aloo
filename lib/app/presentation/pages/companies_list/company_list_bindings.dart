import 'package:get/get.dart';
import 'company_list_controller.dart';

class CompaniesListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CompaniesListController());
  }
}
