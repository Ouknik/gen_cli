import 'package:get/get.dart';
import '../controllers/page:dart22_controller.dart';

class Page:dart22Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Page:dart22Controller>(
      () => Page:dart22Controller(),
    );
  }
}