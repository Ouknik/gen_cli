import 'package:get/get.dart';
import '../../../box.dart';
import '../../../model/products.dart';

class CartsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  List<Products> cartProducts = [];
  void getCartProducts() {
    final box = Boxes.getCart();
    cartProducts = box.values.toList().cast<Products>();
    print("total: " + cartProducts.length.toString());
    update();
  }

  void deleteCartProduct(indexProducts) {
    cartProducts[indexProducts].delete();

    cartProducts.removeAt(indexProducts);
    update();
  }
}
