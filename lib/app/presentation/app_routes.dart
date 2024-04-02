import 'package:app_aloo/app/presentation/pages/companies_list/company_list_bindings.dart';
import 'package:app_aloo/app/presentation/pages/companies_list/company_list_page.dart';
import 'package:app_aloo/app/presentation/pages/profile/profile_bindings.dart';
import 'package:get/get.dart';

import '../../core/configs/app_bindings.dart';
import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_bindings.dart';
import 'pages/login/login_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/splash/splash_bindings.dart';
import 'pages/splash/splash_page.dart';

abstract class Routes {
  static const initial = '/';
  static const home = '/home';
  static const login = '/login';
  static const company = '/company';
  static const profile = '/profile';
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
    GetPage(
      name: Routes.company,
      page: () => const CompaniesListPage(),
      transition: Transition.native,
      binding: CompaniesListBindings(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      transition: Transition.native,
      binding: ProfileBindings(),
    ),
  ];
}
