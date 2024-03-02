import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ouknik/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';

class RootController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<BottomNavigationBarItem> itemsNavigationButtom() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20.h,
          ),
          label: 'Home'.tr),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.numbers,
            size: 20.h,
          ),
          label: '#'.tr),
      BottomNavigationBarItem(
          // backgroundColor: primaryColor,

          icon: Icon(
            Icons.numbers,
            size: 20.h,
          ),
          label: '#'.tr),
    ];
  }

  @override
  void onInit() async {
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
  }

  List<Widget> pages = [
    HomeView(),
    Container(
      child: Text("page not exist"),
    ),
    Container(
      child: Text("page not exist"),
    ),
  ];

  Widget get currentPage => pages[currentIndex.value];

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
