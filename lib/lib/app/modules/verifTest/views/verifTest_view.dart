import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/verifTest_controller.dart';

class VerifTestView extends GetView<VerifTestController> {
  const VerifTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifTestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerifTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
