import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/color.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: controller.currentFloatingButton,

        floatingActionButtonLocation: controller.currentLocationFloatingButton,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        appBar: AppBar(
          title: Text(
            "Project_name",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        // backgroundColor: AppColors.primaryColor,
        body: controller.currentPage,
        bottomNavigationBar: SizedBox(
          height: 56.h,
          child: BottomAppBar(
            color: AppColors.primaryColor,
            shape: CircularNotchedRectangle(),
            notchMargin: 5, //

            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                iconSize: 30.sp,
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                selectedIconTheme:
                    IconThemeData(size: 36.h, color: Colors.white),
                unselectedItemColor: Colors.white38,
                currentIndex: controller.currentIndex.value,
                onTap: (int i) {
                  controller.currentIndex.value = i;
                },
                // this will be set when a new tab is tapped
                items: controller.itemsNavigationButtom()),
          ),
        ),
      );
    });
  }
}
