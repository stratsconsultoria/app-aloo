import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';
import 'package:get/get.dart';

import '../../core/configs/app_bindings.dart';

abstract class Routes {
  static const initial = '/';
  static const home = '/home';
  static const login = '/login';
  static const experience = '/experience';
  static const launchDetails = '/launch_details';
  static const sotreDetails = '/store_details';
}

abstract class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
      transition: Transition.native,
      bindings: [
        AppBinding(),
        HomeBindings(),
      ],
    ),
  ];
}
