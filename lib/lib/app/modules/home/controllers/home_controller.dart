import 'package:get/get.dart';
import '../../../model/products.dart';
import '../../..//modules/home/providers/home_provider.dart';

import '../../../box.dart';
import '../../../model/category.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCategory();
    getProdcts();
  }

  final categorys = <Category>[].obs;

  getCategory() async {
    categorys.value = (await HomeProvider().getCategory()).cast<Category>();

    categorys.value.insert(0, Category(id: "0", name: "Alle  ", image: ''));
    update();
  }

  final products = <Products>[].obs;
  final _products = <Products>[].obs;
  final selectCategoryId = 0.obs;

  // Fetch products and update the filtered products
  getProdcts() async {
    _products.value = (await HomeProvider().getProducts()).cast<Products>();
    filterProductsByCategoryId();
  }

  // Filter products based on selected category ID
  filterProductsByCategoryId() {
    products.value = selectCategoryId.value == 0
        ? _products
        : _products
            .where((product) => product.categoryId == selectCategoryId.value)
            .toList();
  }

  Future addToCart({required Products products}) async {
    final box = Boxes.getCart();
    final fav = products;
    if (!box.containsKey(products.id)) {
      box.put(products.id, fav);
    } else {
      Get.snackbar('!!', "is aredy existste");
    }

    //  getCartProducts();
  }
}
