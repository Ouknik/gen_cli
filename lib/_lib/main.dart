import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/constants/color.dart';
import 'app/lang/transation.dart';
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

        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: AppColors.primaryColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
        ),

        translations: Translation(),
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
