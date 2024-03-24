import 'package:hive/hive.dart';
import '/app/model/products.dart';

class Boxes {
  static Box<Products> getCart() => Hive.box<Products>('ProductsBox');
}
