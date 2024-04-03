import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './requisition_details_controller.dart';

class RequisitionDetailsPage extends GetView<RequisitionDetailsController> {
  const RequisitionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequisitionDetailsPage'),
      ),
      body: Container(),
    );
  }
}
