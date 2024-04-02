import 'package:app_aloo/app/data/infra/cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../app_routes.dart';

class CompanyCard extends StatelessWidget {
  final CompanyEntity company;

  const CompanyCard({
    required this.company,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> setCurrentCompany() async {
      await CacheAdapter().writeStorage(
        CacheString.currentCompany,
        company.id,
      );
      Get.offAllNamed(Routes.home);
    }

    return InkWell(
      onTap: () => setCurrentCompany(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(company.nome),
            Text(company.cnpj),
          ],
        ),
      ),
    );
  }
}
