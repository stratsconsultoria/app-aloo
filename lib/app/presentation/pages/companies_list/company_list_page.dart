import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/atoms/atoms.dart';
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
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
