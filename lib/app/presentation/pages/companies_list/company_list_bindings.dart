import 'package:get/get.dart';

import '../../../data/infra/http/http.dart';
import '../../../data/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import 'company_list_controller.dart';

class CompaniesListBindings implements Bindings {
  @override
  void dependencies() {
    final IHttpClient httpClient = Get.find<IHttpClient>();

    final CompaniesListRepository companiesRepo = CompaniesListRepository(httpClient: httpClient);

    Get.lazyPut<CompaniesListUsecase>(() => ICompaniesListUsecase(repository: companiesRepo));

    Get.put(CompaniesListController(
      comapniesListUsecase: Get.find(),
    ));
  }
}
