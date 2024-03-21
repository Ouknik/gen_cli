import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ouknik/app/constants/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouknik/app/constants/images.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getData(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, i) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor: AppColors.primaryColor,
                              child: Text(
                                "A",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          )),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 202.h,
                      mainAxisExtent: 305.w,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: 9,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.r),
                        bottomRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(0.r),
                      ),
                    ),
                    color: AppColors.primaryColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: AppColors.primaryColor,
                          focusColor: AppColors.primaryColor,
                          hoverColor: AppColors.primaryColor,
                          highlightColor: AppColors.primaryColor,
                          onTap: () async {},
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 27.sp,
                                )
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  AppImages().testImage,
                                  width: 100.w,
                                  height: 135.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 0),
                                  child: Text(
                                    "CART CART",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '\$ 12',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {},
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 35.sp,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {},
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
