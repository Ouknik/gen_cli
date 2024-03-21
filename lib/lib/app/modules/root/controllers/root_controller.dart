import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_gen/app/constants/color.dart';
import 'package:test_gen/app/modules/carts/controllers/carts_controller.dart';
import 'package:test_gen/app/modules/carts/views/carts_view.dart';
import 'package:test_gen/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';

class RootController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<BottomNavigationBarItem> itemsNavigationButtom() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20.sp,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: 1 == currentIndex.value
              ? Container()
              : Icon(
                  Icons.shopping_cart,
                  size: 20.sp,
                ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20.sp,
          ),
          label: ''),
    ];
  }

  @override
  void onInit() {
    Get.put(HomeController());
    Get.put(CartsController());
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
  }

  List<Widget> pages = [HomeView(), CartsView(), Container()];

  List<Widget> FloatingButton = [
    Container(
      height: 0.w,
      width: 0.w,
    ),
    Container(
        height: 56.w,
        width: 56.w,
        color: Colors.transparent,
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(
              Icons.qr_code_scanner_rounded,
              size: 36,
              color: Colors.white,
            ),
            backgroundColor: Colors.pink,
            onPressed: () {},
          ),
        )),
    Container(
      height: 0.w,
      width: 0.w,
    )
  ];

  List<FloatingActionButtonLocation> locationFloatingButton = [
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endDocked
  ];

  Widget get currentPage => pages[currentIndex.value];
  Widget get currentFloatingButton => FloatingButton[currentIndex.value];
  FloatingActionButtonLocation get currentLocationFloatingButton =>
      locationFloatingButton[currentIndex.value];

  /**
   * change page in route
   * */
  void changePageInRoot(int _index) {
    currentIndex.value = _index;
  }

  void changePageOutRoot(int _index) {
    currentIndex.value = _index;
    Get.offNamedUntil(Routes.ROOT, (Route route) {
      if (route.settings.name == Routes.ROOT) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  void changePage(int _index) {
    if (Get.currentRoute == Routes.ROOT) {
      changePageInRoot(_index);
    } else {
      changePageOutRoot(_index);
    }
  }
}
