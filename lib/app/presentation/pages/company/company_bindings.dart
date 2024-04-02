import 'package:get/get.dart';
import './company_controller.dart';

class CompanyBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CompanyController());
    }
}