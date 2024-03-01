import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page:dart22_controller.dart';

class Page:dart22View extends GetView<Page:dart22Controller> {
  const Page:dart22View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page:dart22View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Page:dart22View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
