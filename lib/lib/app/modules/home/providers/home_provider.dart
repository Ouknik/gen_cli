import 'package:get/get.dart';
import 'package:test_gen/app/model/category.dart';
import 'package:test_gen/app/model/products.dart';

import '../../../func/call_api.dart';

class HomeProvider extends GetConnect {
  Future<List<Category>> getCategory() async {
    final response = await CallApi().loadCategories("/category.json");

    return categoryFromJson(response);
  }

  Future<List<Products>> getProducts() async {
    final response = await CallApi().loadCategories("/products.json");
    print(response);

    return productsFromJson(response);
  }
}
