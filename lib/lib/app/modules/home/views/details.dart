import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farah_admin/app/config/confige.dart';
import 'package:farah_admin/app/constants/color.dart';
import 'package:farah_admin/app/model/annonce.dart';
import 'package:farah_admin/app/modules/home/controllers/home_controller.dart';
import 'package:farah_admin/app/routes/app_pages.dart';
import 'package:farah_admin/app/widgets/cache_network_image.dart';
import 'package:farah_admin/app/widgets/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Details extends GetView<HomeController> {
  AnnonceElements annonce;

  Details({required this.annonce});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icon/annonces/hand.svg',
                      width: 25.w, height: 25.h, matchTextDirection: true),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Découvrez nos catégories",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffe3e3e3),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Stack(alignment: Alignment.center, children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                      height: (MediaQuery.of(context).size.height * 0.30).h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r))),
                      child: CarouselSlider(
                          options: CarouselOptions(
                            //  height:    450.h ,
                            height: (MediaQuery.of(context).size.height),
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: false,
                            pageSnapping: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            onPageChanged: (value, res) {
                              controller.activeindex.value = value;
                            },
                          ),
                          items: annonce.royaImages
                              .map((String slider) => Builder(
                                    builder: (BuildContext context) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            topRight: Radius.circular(10.r)),
                                        child: Stack(
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(top: 50),
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.5)
                                                  .h,
                                              // decoration: const BoxDecoration(
                                              // //   borderRadius: BorderRadius.all(
                                              // //       Radius.circular(4.5)),
                                              // ),
                                              child: ClipRRect(
                                                  // borderRadius: const BorderRadius.all(
                                                  //     Radius.circular(10)),
                                                  child: GestureDetector(
                                                      onTap: (() {
                                                        Get.to(ImageViewer(
                                                            Confige().baseUrl +
                                                                "/public/annoncepic_large/" +
                                                                slider));
                                                      }),
                                                      child: cachedImage(Confige()
                                                              .baseUrl +
                                                          "/public/annoncepic_large/" +
                                                          slider))),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                              .toList()),
                    ),
                    Positioned(
                      child: BuldeIndector(),
                      bottom: 5,
                    )
                    // : Container(),
                  ]);
                }),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  height: 150.h,
                  decoration: BoxDecoration(
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r))),
                  child: Column(children: [
                    // Align(child: BuldeIndector(),alignment: Alignment.bottomCenter,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 10.w, right: 10.w),
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffbfa280),
                              //radius: 20,
                              child:
                                  Text(annonce.userFirstName[0].toLowerCase()),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(top: 15.h, left: 10.w),
                                child: Text(annonce.userFirstName +
                                    " " +
                                    annonce.userLastName)),
                            Container(
                              padding: EdgeInsets.only(top: 3.h, left: 10.w),
                              child: Text(
                                annonce.royaCrdate,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  // height: 50.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      )),
                  child: Text(
                    annonce.royaTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.sm),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bed-sharp.svg',
                          width: 20.w,
                          height: 25.h,
                          //   matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${annonce.royaBedrooms} Beds",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bathroom.svg',
                          width: 20.w,
                          height: 20.h,
                          // matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${annonce.royaBathrooms} Boths",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/m.svg',
                          width: 20.w,
                          height: 25.h,
                          //  matchTextDirection: true,
                          color: const Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          annonce.royaArea + " m²",
                          style: const TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(right: 20.w, left: 20.w, bottom: 15.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2.w, color: const Color(0xff8a8a8a)),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                  ),
                  child: Stack(
                    children: [],
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(right: 20.w, left: 20.w, bottom: 15.h),
                    child: Text(
                      "Available on :",
                      style: TextStyle(fontSize: 25),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 43.449.h,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: annonce.royaabilitie.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/abilities/" +
                                  annonce.royaabilitie[index] +
                                  ".svg",
                              width: 65.w,
                              height: 65.h,
                              color: AppColors.blueGrey,
                            ));
                      }),
                ),
                Container(
                    margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 15.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.w, color: Color(0xff8a8a8a)),
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Text(
                    'Description'.tr,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  alignment: Alignment.topLeft,
                  child: Text(annonce.royaDescription),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }

  Widget BuldeIndector() => AnimatedSmoothIndicator(
        count: annonce.royaImages.length,
        activeIndex: controller.activeindex.value,
        effect: WormEffect(
          dotHeight: 16,
          dotWidth: 16,
          type: WormType.thin,
          // strokeWidth: 5,
        ),
      );
}
