import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page:dart_controller.dart';

class Page:dartView extends GetView<Page:dartController> {
  const Page:dartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page:dartView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Page:dartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
