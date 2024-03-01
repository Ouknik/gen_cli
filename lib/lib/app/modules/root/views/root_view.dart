import 'package:farah_admin/app/modules/navbar/views/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: controller.openColse.value
                  ? 2
                  : 1, //is need to change with icon open drawer
              child: Container(
                color: AppColors.primaryColor,
                child: NavbarView(),
              ),
            ),
            Container(
              height: double.infinity,
              width: 0.09.w,
              color: Colors.black,
            ),
            Column(
              children: [
                Expanded(
                    child: Container(
                  width: controller.openColse.value
                      ? 350.0.w
                      : 330.w, //is need to change with icon open drawer
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() {
                              return GestureDetector(
                                  onTap: () {
                                    controller.openColse.value =
                                        !controller.openColse.value;
                                  },
                                  child: controller.openColse.value
                                      ? Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black45,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black45,
                                          size: 20,
                                        ));
                            }),
                            const Text("Home Page")
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Row(
                          children: [
                            MenuAnchor(
                              builder: (BuildContext context,
                                  MenuController controller, Widget? child) {
                                return IconButton(
                                  onPressed: () {
                                    if (controller.isOpen) {
                                      controller.close();
                                    } else {
                                      controller.open();
                                    }
                                  },
                                  icon: const Icon(Icons.translate),
                                  tooltip: 'change lang',
                                );
                              },
                              menuChildren: List<MenuItemButton>.generate(
                                3,
                                (int index) => MenuItemButton(
                                  onPressed: () {},
                                  // setState(() => selectedMenu = SampleItem.values[index]),
                                  child: Text('Item ${index + 1}'),
                                ),
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                  flex: 15, //is need to change with icon open drawer
                  child: Obx(() {
                    return Container(
                      width: controller.openColse.value
                          ? 350.0.w
                          : 330.w, //is need to change with icon open drawer
                      height: (MediaQuery.of(context).size.height * 0.5).h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF6F9FD),
                        borderRadius: BorderRadius.only(),
                      ),
                      child: controller.pageView[controller.count.value],
                    );
                  }),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
