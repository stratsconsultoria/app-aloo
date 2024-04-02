import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class CompaniesListController extends GetxController {
  final CompaniesListUsecase comapniesListUsecase;

  CompaniesListController({
    required this.comapniesListUsecase,
  });

  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<CompanyEntity> companies = <CompanyEntity>[].obs;
  RxBool companiesIsLoading = false.obs;

  @override
  Future<void> onInit() async {
    await fetchComapnies();
    super.onInit();
  }

  Future<void> fetchComapnies() async {
    companiesIsLoading.value = true;
    final result = await comapniesListUsecase.list();
    companies.assignAll(result);
    companiesIsLoading.value = false;
  }
}
