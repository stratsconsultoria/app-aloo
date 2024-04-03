import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'requisitions_controller.dart';

class RequisitionsPage extends GetView<RequisitionsController> {
  const RequisitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequisitionsPage'),
      ),
      body: Container(),
    );
  }
}
