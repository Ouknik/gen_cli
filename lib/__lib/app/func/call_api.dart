import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

//import 'package:connectivity_plus/connectivity_plus.dart';

import '../config/confige.dart';
import '../config/statues.dart';

class CallApi extends GetConnect {
  // Check for internet connection and if we can reach an external endpoint
/*  Future<bool> checkInternet(String url) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      var response = await http.head(Uri.parse(Confige().baseUrl + url));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }*/

  // POST function with internet check
  Future<String?> POST(String url, Map<String, String> jsonDate) async {
    //  if (await checkInternet(url)) {
    var request =
        await http.MultipartRequest("POST", Uri.parse(Confige().baseUrl + url));

    request.fields.addAll(jsonDate);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    /* } else {
      return Statue().ProblemInternet;
    }*/
  }

  // GET function with internet check
  Future<String?> GET(String url) async {
    // if (await checkInternet(url)) {
    var response = await get(Confige().baseUrl + url);

    if (response.statusCode == 200) {
      return response.bodyString;
    }
    /* } else {
      return Statue().ProblemInternet;
    }*/
  }

  // Function to read the JSON file
  loadCategories(String pathFile) async {
    // Read the JSON file
    String jsonString =
        await rootBundle.loadString(Confige().basePath + pathFile);

    return jsonString;
  }
}
