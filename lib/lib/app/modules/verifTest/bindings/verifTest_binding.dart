import 'package:get/get.dart';
import '../controllers/verifTest_controller.dart';

class VerifTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifTestController>(
      () => VerifTestController(),
    );
  }
}