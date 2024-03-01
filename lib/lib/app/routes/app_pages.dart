

//add-import
import '../modules/page:dart22/views/page:dart22_view.dart';
    
import '../modules/page:dart22/bindings/page:dart22_binding.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';


import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
   
    ),
      GetPage(
      name: _Paths.VERIFTEST,
      page: () => const VerifTestView(),
      binding: VerifTestBinding(),
    ),
      GetPage(
      name: _Paths.VERIFTEST,
      page: () => const VerifTestView(),
      binding: VerifTestBinding(),
    ),
      GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
      GetPage(
      name: _Paths.PAGE:DART,
      page: () => const Page:dartView(),
      binding: Page:dartBinding(),
    ),




      GetPage(
      name: _Paths.PAGE:DART22,
      page: () => const Page:dart22View(),
      binding: Page:dart22Binding(),
    ),
  ];





}
