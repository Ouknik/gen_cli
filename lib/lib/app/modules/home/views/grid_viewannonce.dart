import 'package:farah_admin/app/config/confige.dart';
import 'package:farah_admin/app/constants/color.dart';
import 'package:farah_admin/app/model/annonce.dart';
import 'package:farah_admin/app/modules/addannonce/controllers/addannonce_controller.dart';
import 'package:farah_admin/app/modules/home/controllers/home_controller.dart';
import 'package:farah_admin/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../widgets/cache_network_image.dart';

class GridViewAnoonce extends StatelessWidget {
  final controller = Get.put(HomeController());

  AnnonceElements annonceElements;
  int indexAnnonce;
  GridViewAnoonce({required this.annonceElements, required this.indexAnnonce});

  @override
  Widget build(BuildContext context) {
    // print (annonceElements.royaImages[0]);
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 0.1.h,
          color: Colors.black54,
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 40.w,
                    height: 100.h,
                    child: annonceElements.royaImages.length == 0
                        ? Container()
                        : cachedImage(
                            "${Confige().baseUrl}/public/annoncepic_large/${annonceElements.royaImages[0]}"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(annonceElements.royaTitle),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${annonceElements.royaPrice} dh"),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 8.h),
                                child: Text(
                                  annonceElements.royaTransaction,
                                  style: TextStyle(
                                      color: Colors.white, height: 0.6),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(annonceElements.royaCity),
              Text(annonceElements.royaPropertyType),
              Container(
                  decoration: BoxDecoration(
                    color: annonceElements.royaStatus == 0
                        ? Colors.yellow
                        : Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 3.h, top: 3.h, left: 12.w, right: 12.w),
                    child: Text(
                      annonceElements.royaStatus == 0 ? "غير مؤكد" : "مؤكد",
                      style: TextStyle(color: AppColors.grey2),
                    ),
                  )),
              MenuAnchor(
                alignmentOffset: Offset(-40, 0),
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return IconButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.more_horiz),
                    tooltip: 'Show menu',
                  );
                },
                menuChildren: List<MenuItemButton>.generate(
                  controller.listAction.length,
                  (int i) => MenuItemButton(
                    onPressed: () {
                      controller.activeAction(
                          annonce: annonceElements,
                          action: controller.listAction[i].action);
                    },
                    //  setState(() => selectedMenu = SampleItem.values[index]),
                    child: Text(controller.listAction[i].action),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
