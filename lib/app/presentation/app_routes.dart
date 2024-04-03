import 'package:get/get.dart';

import '../../core/configs/app_bindings.dart';
import 'pages/companies_list/company_list_bindings.dart';
import 'pages/companies_list/company_list_page.dart';
import 'pages/login/login_bindings.dart';
import 'pages/login/login_page.dart';
import 'pages/profile/profile_bindings.dart';
import 'pages/profile/profile_page.dart';
import 'pages/requisition_details/requisition_details_page.dart';
import 'pages/splash/splash_bindings.dart';
import 'pages/splash/splash_page.dart';
import 'pages/start/screens/circuits/circuits_bindings.dart';
import 'pages/start/screens/home/home_bindings.dart';
import 'pages/start/screens/requisitions/requisitions_bindings.dart';
import 'pages/start/start_bindings.dart';
import 'pages/start/start_page.dart';

abstract class Routes {
  static const initial = '/';
  static const start = '/home';
  static const login = '/login';
  static const company = '/company';
  static const profile = '/profile';
  static const requisitionDetails = '/requisitionDetails';
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
      name: Routes.start,
      page: () => const StartPage(),
      transition: Transition.native,
      bindings: [
        StartBindings(),
        CircuitsBindings(),
        HomeBindings(),
        RequisitionsBindings(),
      ],
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
    GetPage(
      name: Routes.requisitionDetails,
      page: () => const RequisitionDetailsPage(),
      transition: Transition.native,
      binding: RequisitionsBindings(),
    ),
  ];
}
