import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../config/confige.dart';
import '../config/statues.dart';
import '../routes/app_pages.dart';

class CallApi extends GetConnect {
  callApiStreamWithOtt(
      String url, String method, Map<String, String> jsonData) async {
    try {
      // Construct the complete URL
      String completeUrl = Confige().baseUrl + '/1/1' + url;

      // Create the multipart request
      var request = http.MultipartRequest(method, Uri.parse(completeUrl));

      // Add JSON data as fields to the request
      request.fields.addAll(jsonData);

      // Send the request and get the streamed response
      http.StreamedResponse response = await request.send();

      // Check the response status code
      if (response.statusCode == 200) {
        // Convert the response stream to a string
        var res = await response.stream.bytesToString();

        // You can process response JSON here if needed
        // Example: json.decode(res)["_nxtapott"];

        return res;
      } else {
        // Handle different status codes appropriately
        print("Error: ${response.statusCode}");
        return null; // You might want to return an appropriate value here
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      print("Exception: $e");
      return null; // You might want to return an appropriate value here
    }
  }

  callApiStreamWithoutOtt(
      url, String statue, Map<String, String> jsondate) async {
    var request = await http.MultipartRequest(
        statue, Uri.parse('${Confige().baseUrl}' + url));
    request.fields.addAll(jsondate);

    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString();
    print('${Confige().baseUrl}' + url);
    print(res);
    print(response.statusCode);
    if (response.statusCode == 200) {
      try {
        return res;
      } catch (e) {
        return res;
      }
    } else if (response.statusCode == 504) {}
  }

  callApiWithoutOtt(url, String statue, Map<String, dynamic> jsondate) async {
    if (statue == Statue().post) {
      var response = await post('${Confige().baseUrl}' + url, jsondate);
      print('${Confige().baseUrl}' + url);
      print(response.body);

      if (response.statusCode == 200) {
        try {
          return response;
        } catch (e) {
          return response;
        }
      } else if (response.statusCode == 504) {}
    } else {
      var response = await get('${Confige().baseUrl}' + url);

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        try {
          return response;
        } catch (e) {
          return response;
        }
      } else if (response.statusCode == 504) {}
    }
  }

  callApiWithOtt(url, String statue, Map<String, dynamic> jsondate) async {
    print('${Confige().baseUrl}/1/1' + url);

    if (statue == Statue().post) {
      var response = await post('${Confige().baseUrl}/1/1' + url, jsondate);

      if (response!.statusCode == 200) {
        try {
          return response;
        } catch (e) {
          return response;
        }
      } else if (response.statusCode == 504) {
        //   Get.offAllNamed(Routes.SERVER_HAS_PROBLEM);
      } else {}
    } else {
      var response = await get(
        '${Confige().baseUrl}/1/1' + url,
      );
      print(response.body);
      if (response!.statusCode == 200) {
        try {
          return response;
        } catch (e) {
          return response;
        }
      } else if (response.statusCode == 504) {}
    }
  }
}
