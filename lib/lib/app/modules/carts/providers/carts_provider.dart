import 'dart:convert';

import 'package:get/get.dart';

import '../../../config/statues.dart';
import '../../../func/call_api.dart';


class CartsProvider extends GetConnect {
  Future<Annonce> get() async {
    final response = await CallApi()
        .callApiStreamWithOtt("/get", Statue().get, {});

    try {
      print(response);
    } catch (e) {
      print(e.toString);
    }
  }

}
  