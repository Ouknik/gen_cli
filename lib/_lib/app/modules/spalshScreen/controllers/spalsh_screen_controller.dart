import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouknik/app/routes/app_pages.dart';

class SpalshScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
    goTo();
    super.onInit();
  }

  goTo() async {
    Timer.periodic(Duration(seconds: 2), (timer) {
      Get.offAllNamed(Routes.ROOT);
      timer.cancel();
    });
  }

  @override
  void onClose() {
    animationController.dispose();

    super.onClose();
  }
}
