import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_routes.dart';
import '../../../../components/components.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: CustomAppBar(
          userName: controller.authController.account.value.nome,
          funcWidget: InkWell(
            onTap: () => Get.toNamed(Routes.company),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Obx(
                    () => Text(
                      controller.companyName.value,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Atendimentos recentemente abertos',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: Get.width * 0.5,
            child: Obx(
              () => Visibility(
                visible: controller.requisitionsIsLoading.isFalse,
                replacement: const Center(child: CircularProgressIndicator()),
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.requisitions.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return RequisitionResumeCard(
                        requisition: controller.requisitions[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
