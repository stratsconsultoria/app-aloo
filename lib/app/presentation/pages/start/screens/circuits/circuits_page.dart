import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/components.dart';
import '../../../../components/molecules/circuit_card.dart';
import 'circuits_controller.dart';

class CircuitsPage extends GetView<CircuitsController> {
  const CircuitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: CustomAppBar(
          userName: controller.authController.account.value.nome,
          funcWidget: Container(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Atendimentos recentemente abertos',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Visibility(
                visible: controller.circuitsIsLoading.isFalse,
                replacement: const Center(child: CircularProgressIndicator()),
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.circuits.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CircuitCard(
                        circuit: controller.circuits[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
