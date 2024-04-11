import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import 'requisition_details_controller.dart';

class RequisitionDetailsPage extends GetView<RequisitionDetailsController> {
  const RequisitionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        automaticallyImplyLeading: false,
        flexibleSpace: CustomAppBar(
          userName: controller.authController.account.value.nome,
          funcWidget: Container(),
          leading: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Visibility(
            visible: controller.detailsIsLoading.isFalse,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Column(
              children: [
                RequisitionHeader(requisition: controller.requisitionDetails.value.atendimento),
                Divider(
                  height: 8,
                  thickness: 8,
                  color: Theme.of(context).cardColor,
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.requisitionDetails.value.observacoes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MessageBox(
                      observation: controller.requisitionDetails.value.observacoes[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
