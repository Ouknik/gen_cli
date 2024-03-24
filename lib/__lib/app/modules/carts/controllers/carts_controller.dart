import 'package:get/get.dart';
import '../../../box.dart';
import '../../../model/products.dart';

class CartsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  final loading = false.obs;
  final totalPrice = 0.0.obs;
  List<Products> cartProducts = [];
  void getCartProducts() {
    loading.value = true;
    final box = Boxes.getCart();
    cartProducts = box.values.toList().cast<Products>();
    totalPrice.value = 0.0;
    cartProducts.forEach((product) {
      totalPrice.value = totalPrice.value + product.prix;
    });

    loading.value = false;
    update();
  }

  void deleteCartProduct(indexProducts) {
    cartProducts[indexProducts].delete();

    cartProducts.removeAt(indexProducts);

    getCartProducts();
    update();
  }
}
