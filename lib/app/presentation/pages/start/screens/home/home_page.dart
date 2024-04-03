import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../app_routes.dart';
import '../../../../components/components.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.only(bottom: 16),
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
      body: const SingleChildScrollView(),
    );
  }
}
