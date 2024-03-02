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
        //floatingActionButton: controller.currentFloatingButton,
        // floatingActionButtonLocation: controller.currentLocationFloatingButton,
        appBar: AppBar(
          title: Text(
            "Project_name",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),

        backgroundColor: Colors.white,
        body: controller.currentPage,
        bottomNavigationBar: SizedBox(
          height: 60.h,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 4, //
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,

                //  selectedLabelStyle: styleLableButtonNavigatorbar,
                // unselectedLabelStyle: styleLableButtonNavigatorbar,
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                unselectedItemColor: Colors.white,
                onTap: (int i) {
                  controller.changePageInRoot(i);
                },
                // this will be set when a new tab is tapped
                items: controller.itemsNavigationButtom()),
          ),
        ),
      );
    });
  }
}
