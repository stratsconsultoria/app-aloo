import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customBottomSheet(
  BuildContext context, {
  required Widget body,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SizedBox(
        height: Get.height * 0.8,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).cardColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 5.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    body,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
