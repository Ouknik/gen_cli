import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../controllers/carts_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartsView extends GetView<CartsController> {
  const CartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Obx(() {
                return controller.loading.value
                    ? CircularProgressIndicator()
                    : ListView.separated(
                        itemCount: controller.cartProducts.length,
                        padding: EdgeInsets.only(top: 10.h),
                        itemBuilder: (context, i) {
                          return Slidable(
                            key: UniqueKey(),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.deleteCartProduct(i);
                                  },
                                  label: "Delete".tr,
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Card(
                              borderOnForeground: true,
                              elevation: 10,

                              //  height: 140,
                              child: Row(
                                children: [
                                  Container(
                                      width: 140,
                                      child: Image.network(
                                        controller.cartProducts[i].image,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.cartProducts[i].name,
                                        ),
                                        Text(
                                          '${controller.cartProducts[i].prix}\$',
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 20,
                        ),
                      );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    'TOTAL',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() {
                    return Text(
                      controller.totalPrice.value
                              .toStringAsFixed(2)
                              .toString() +
                          "\$",
                    );
                  }),
                ]),
                MaterialButton(
                  child: const Text("CHCKOUT"),
                  onPressed: () {},
                  color: AppColors.primaryColor,
                  textColor: Colors.pink,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
