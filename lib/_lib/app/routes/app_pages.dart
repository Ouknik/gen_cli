import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/spalshScreen/bindings/spalsh_screen_binding.dart';
import '../modules/spalshScreen/views/spalsh_screen_view.dart';

//add-import

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH_SCREEN;

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
    GetPage(
      name: _Paths.SPALSH_SCREEN,
      page: () => const SpalshScreenView(),
      binding: SpalshScreenBinding(),
    ),
  ];
}
