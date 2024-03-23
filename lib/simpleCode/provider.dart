// Fill providers file
import '../function.dart';

String ProvidersContent({required String pageName}) => '''
import 'dart:convert';

import 'package:get/get.dart';

import '../../../config/statues.dart';
import '../../../func/call_api.dart';


class ${capitalize(pageName)}Provider extends GetConnect {
   get() async {
    final response = await CallApi()
        .callApiStreamWithOtt("/get", Statue().GET, {});

    try {
      print(response);
    } catch (e) {
      print(e.toString);
    }
  }

}
  ''';
