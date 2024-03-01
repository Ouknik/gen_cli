import 'package:farah_admin/app/modules/home/controllers/home_controller.dart';
import 'package:farah_admin/app/modules/home/views/home_view.dart';
import 'package:farah_admin/app/modules/messages/views/messages_view.dart';
import 'package:farah_admin/app/modules/users/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../addannonce/controllers/addannonce_controller.dart';

class RootController extends GetxController {
  //TODO: Implement RootController

  final count = 0.obs;
  final openColse = false.obs;

  @override
  void onInit() {
    Get.put(HomeController());
    Get.put(AddannonceController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Widget> pageView = [
    // Container(),
    HomeView(),
    UsersView(),
    MessagesView(),
  ];
}
