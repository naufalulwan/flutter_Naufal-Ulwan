import 'package:flutter_final_project/bindings/account_binding.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:flutter_final_project/screens/about_screen/about_screen.dart';
import 'package:flutter_final_project/screens/account_screen/account_screen.dart';
import 'package:flutter_final_project/screens/account_screen/edit_account_screen/edit_account_screen.dart';
import 'package:flutter_final_project/screens/add_tour_screen/add_tour_screen.dart';
import 'package:flutter_final_project/screens/contributor_screen/contributor_screen.dart';
import 'package:get/route_manager.dart';

import '../../screens/home_screen/main_screen.dart';
import '../../screens/landing_screen/landing_screen.dart';
import '../../screens/landing_screen/login_screen/login_screen.dart';
import '../../screens/landing_screen/register_screen/register_screen.dart';
import '../../screens/splash_screen/splash_screen.dart';

class ScreenRoute {
  static final screens = [
    GetPage(
      name: RouteName.mainScreen,
      page: () => const MainScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.registerScreen,
      page: () => RegisterScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.landingScreen,
      page: () => const LandingScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.aboutScreen,
      page: () => const AboutScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.contributorScreen,
      page: () => ContributorScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.accountScreen,
      page: () => AccountScreen(),
      binding: AccountBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.editAccountScreen,
      page: () => EditAccountScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.addTourScreen,
      page: () => AddTourScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
