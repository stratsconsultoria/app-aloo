import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import 'company_list_controller.dart';

class CompaniesListPage extends GetView<CompaniesListController> {
  const CompaniesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SELECIONE SUA EMPRESA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextField(
              controller: controller.searchController.value,
              label: 'Buscar',
              suffixIcon: const Icon(Icons.search),
            ),
            const SizedBox(height: 24),
            Visibility(
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.companies.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CompanyCard(company: controller.companies[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
