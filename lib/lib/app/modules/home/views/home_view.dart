import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../constants/color.dart';
import '../../../constants/images.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getCategory();
          controller.getProdcts();
          controller.selectCategoryId.value = 0;
        },
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100.h,
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categorys.length,
                        itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectCategoryId.value =
                                      int.parse(controller.categorys[i].id);
                                  controller.filterProductsByCategoryId();
                                },
                                child: Obx(() {
                                  return Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: controller
                                                    .selectCategoryId.value ==
                                                int.parse(
                                                    controller.categorys[i].id)
                                            ? Colors.pink
                                            : AppColors.primaryColor,
                                        radius: 31.r,
                                        child: CircleAvatar(
                                          radius: 30.r,
                                          backgroundImage: NetworkImage(
                                            controller.categorys[i].image,
                                          ),
                                          child: i == 0
                                              ? Text("ALL")
                                              : Container(),
                                        ),
                                      ),
                                      Text(
                                        controller.categorys[i].name,
                                        style: TextStyle(fontSize: 10.sp),
                                      )
                                    ],
                                  );
                                }),
                              ),
                            ));
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "All products",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Open Sans',
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 202.h,
                        mainAxisExtent: 305.w,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.r),
                            bottomRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(0.r),
                          ),
                          side: BorderSide(
                              color: AppColors.primaryColor, width: 1.w)),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    controller.products[index].image,
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
                                      controller.products[index].name,
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
                                  '\$ ${controller.products[index].prix}',
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.addToCart(
                                        products: controller.products[index]);
                                  },
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
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
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
