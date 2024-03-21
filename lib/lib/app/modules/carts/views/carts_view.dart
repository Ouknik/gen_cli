import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/carts_controller.dart';

class CartsView extends GetView<CartsController> {
  const CartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemCount: controller.cartProducts.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 140,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 20,
                ),
              ),
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
                  Text(
                    "12",
                  ),
                ]),
                Container(
                  width: 180,
                  height: 60,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text('CHCKOUT'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
