import '../../components/atoms/atoms.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'company_controller.dart';

class CompanyPage extends GetView<CompanyController> {
  const CompanyPage({super.key});

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
