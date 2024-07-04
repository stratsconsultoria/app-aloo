import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadDialog {
  static void call(BuildContext context, {required String title}) {
    Get.defaultDialog(
      title: title,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.primary,
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
