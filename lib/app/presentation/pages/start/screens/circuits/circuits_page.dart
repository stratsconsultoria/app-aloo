import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'circuits_controller.dart';

class CircuitsPage extends GetView<CircuitsController> {
  const CircuitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircuitsPage'),
      ),
      body: Container(),
    );
  }
}
