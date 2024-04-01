import 'package:get/get.dart';

import '../../core/configs/app_bindings.dart';
import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_bindings.dart';
import 'pages/login/login_page.dart';
import 'pages/splash/splash_bindings.dart';
import 'pages/splash/splash_page.dart';

abstract class Routes {
  static const initial = '/';
  static const home = '/home';
  static const login = '/login';
}

abstract class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      transition: Transition.native,
      bindings: [
        AppBinding(),
        SplashBindings(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      transition: Transition.native,
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      transition: Transition.native,
      binding: HomeBindings(),
    ),
  ];
}
