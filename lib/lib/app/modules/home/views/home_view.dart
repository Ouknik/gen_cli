import 'package:farah_admin/app/constants/color.dart';
import 'package:farah_admin/app/lang/transation.dart';
import 'package:farah_admin/app/modules/addannonce/controllers/addannonce_controller.dart';
import 'package:farah_admin/app/modules/addannonce/views/addannonce_view.dart';
import 'package:farah_admin/app/modules/home/views/details.dart';
import 'package:farah_admin/app/routes/app_pages.dart';
import 'package:farah_admin/app/widgets/popup_menu_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'grid_viewannonce.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.9),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200.h,
                      height: 27.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: StringKeys.search.tr,
                            hintStyle:
                                TextStyle(color: Colors.grey[400], height: 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: AppColors.mainButtonColor,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Text(
                            StringKeys.search.tr,
                            style:
                                TextStyle(height: 1, color: Colors.grey[300]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    PopupMenuButton(
                      shape: const PopupMenuShape(),
                      offset: const Offset(0, 38),
                      itemBuilder: (context) {
                        return List.generate(
                            3, (index) => PopupMenuItem(child: Container()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.mainButtonColor),
                        child: Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey2),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Icon(
                              Icons.list,
                              color: AppColors.grey2,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.getToAddAnnonceView();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: AppColors.mainButtonColor,
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.grey2,
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Text(
                            StringKeys.addAnnonce.tr,
                            style: TextStyle(height: 1, color: AppColors.grey2),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Obx(() {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.annonce.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(AddannonceView(
                              annonce: controller.annonce[index]));
                        },
                        child: GridViewAnoonce(
                            annonceElements: controller.annonce[index],
                            indexAnnonce: index),
                      );
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }
}
