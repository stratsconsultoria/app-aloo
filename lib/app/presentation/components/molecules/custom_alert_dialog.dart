import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components.dart';

class CustomAlertDialog {
  static Future<bool> call(
    context, {
    required String title,
    required String description,
  }) async {
    return await Get.defaultDialog(
      onWillPop: () async {
        return false;
      },
      title: title,
      titlePadding: const EdgeInsets.only(top: 16.0),
      contentPadding: EdgeInsets.zero,
      content: AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.only(top: 8),
        title: Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: CustomButtom(
            label: 'Ok',
            onTap: () => Get.back(result: true),
          ),
        ),
      ),
    );
  }
}
