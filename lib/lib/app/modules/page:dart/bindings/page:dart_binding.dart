import 'package:get/get.dart';
import '../controllers/page:dart_controller.dart';

class Page:dartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Page:dartController>(
      () => Page:dartController(),
    );
  }
}