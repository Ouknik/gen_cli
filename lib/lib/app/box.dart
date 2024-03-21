import 'package:hive/hive.dart';
import 'package:test_gen/app/model/products.dart';

class Boxes {
  static Box<Products> getCart() => Hive.box<Products>('ProductsBox');
}
