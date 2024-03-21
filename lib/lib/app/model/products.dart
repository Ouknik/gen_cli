// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
part 'products.g.dart';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class Products extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  String description;
  @HiveField(4)
  double prix;
  @HiveField(5)
  int categoryId;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.prix,
    required this.categoryId,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        prix: json["prix"].toDouble(),
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "prix": prix,
        "category_id": categoryId,
      };
}
