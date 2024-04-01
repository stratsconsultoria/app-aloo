import 'package:get/get.dart';

class CustomSnackbar {
  static void call({
    required String title,
    required String description,
    Duration duration = const Duration(seconds: 4),
  }) {
    Get.snackbar(
      title,
      description,
      duration: duration,
    );
  }
}
