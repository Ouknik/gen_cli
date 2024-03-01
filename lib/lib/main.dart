import 'package:farah_admin/app/lang/transation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // locale: controller.initializeLocale(),
        translations: Translation(),
        title: "Application",
        initialRoute: Routes.DASHBOARD,
        getPages: AppPages.routes,
      ),
    ),
  );
}
