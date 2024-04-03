import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/infra/cache/cache.dart';
import '../../controllers/auth_controller.dart';
import 'screens/circuits/circuits_page.dart';
import 'screens/home/home_page.dart';
import 'screens/requisitions/requisitions_page.dart';

class StartController extends GetxController {
  AuthController authController;

  StartController({required this.authController});

  Rx<String> companyName = ''.obs;
  RxInt selectedScreen = 0.obs;

  RxList<Widget> screens = <Widget>[
    const HomePage(),
    const CircuitsPage(),
    const RequisitionsPage(),
  ].obs;

  @override
  Future<void> onInit() async {
    companyName.value = await CacheAdapter().read(CacheString.companyName);
    super.onInit();
  }

  void setScreen(int index) {
    selectedScreen.value = index;
  }
}
