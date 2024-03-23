import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/constants/color.dart';
import 'package:get/get.dart';

class ScannerCodeView extends StatelessWidget {
  Widget child;
  ScannerCodeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
            left: 60.w,
            top: 200.h,
            child: Container(
              width: 5.w,
              height: 30.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            left: 60.w,
            bottom: 243.h,
            child: Container(
              width: 5.w,
              height: 30.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            right: 60.w,
            top: 200.h,
            child: Container(
              width: 5.w,
              height: 30.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            right: 60.w,
            bottom: 243.h,
            child: Container(
              width: 5.w,
              height: 30.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            left: 60.w,
            top: 200.h,
            child: Container(
              width: 30.w,
              height: 5.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            right: 60.w,
            top: 200.h,
            child: Container(
              width: 30.w,
              height: 5.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            left: 60.w,
            bottom: 238.h,
            child: Container(
              width: 30.w,
              height: 5.h,
              color: AppColors.primaryColor,
            )),
        Positioned(
            right: 60.w,
            bottom: 238.h,
            child: Container(
              width: 30.w,
              height: 5.h,
              color: AppColors.primaryColor,
            )),
      ],
    );
  }
}
