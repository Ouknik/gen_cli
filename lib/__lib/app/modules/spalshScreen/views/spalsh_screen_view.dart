import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../constants/images.dart';

import '../../../constants/color.dart';
import '../controllers/spalsh_screen_controller.dart';

class SpalshScreenView extends GetView<SpalshScreenController> {
  const SpalshScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: GetBuilder<SpalshScreenController>(
        builder: (_) => FadeTransition(
          opacity: controller.animation,
          child: Center(
            child: Image.asset(
              AppImages().logo,
              color: Colors.white,
              width: (MediaQuery.of(context).size.width * 0.6).w,
            ),
          ),
        ),
      ),
    );
  }
}
