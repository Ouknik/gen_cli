import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import '../function.dart';

class ModelGenerator {
  static Future<dynamic> generateModelFromUrl(
      String url, String modelName) async {
    try {
      // Make a GET request to the URL
      http.Response response = await http.get(Uri.parse(url));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Decode the response body
        dynamic jsonData = json.decode(response.body);
        print(jsonData);
        // Generate the model from JSON
        return generateModelFromJson(jsonData, modelName);
      } else {
        // Request failed, return null
        print('Failed to fetch data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // An error occurred, return null
      print('Error fetching data: $e');
      return null;
    }
  }

  /*static Future<dynamic> generateModelFromFile(
      String filePath, String modelName) async {
    try {
      // Read the JSON file
      File file = File(filePath);
      String contents = await file.readAsString();

      // Decode the JSON data
      dynamic jsonData = json.decode(contents);

      // Generate the model from JSON
      return generateModelFromJson(jsonData, modelName);
    } catch (e) {
      // An error occurred, return null
      print('Error reading file: $e');
      return null;
    }
  }*/

  static Future<dynamic> generateModelFromFile(
      String filePath, String modelName) async {
    try {
      // Read the JSON file
      File file = File(filePath);
      String contents = await file.readAsString();

      // Parse the JSON data as a list of objects
      List<dynamic> jsonDataList = json.decode(contents);

      // Convert the list to a single JSON object
      Map<String, dynamic> jsonData = {'data': jsonDataList};

      // Generate the model from JSON
      return generateModelFromJson(jsonData, modelName);
    } catch (e) {
      // An error occurred, return null
      print('Error reading file: $e');
      return null;
    }
  }

  static dynamic generateModelFromJson(
      Map<String, dynamic> json, String modelName) {
    if (json == null ||
        json.isEmpty ||
        modelName == null ||
        modelName.isEmpty) {
      return null;
    }

    // Start building the model class string
    StringBuffer modelClass = StringBuffer('// To parse this JSON data, do\n');
    modelClass.writeln('//\n'
        '//     final $modelName = $modelName(jsonString);\n\n');

    modelClass.writeln('import \'package:meta/meta.dart\';\n'
        'import \'dart:convert\';\n\n');

    modelClass.writeln('List<$modelName> $modelName(String str) => '
        'List<$modelName>.from(json.decode(str).map((x) => $modelName.fromJson(x)));\n\n');

    modelClass.writeln('String $modelName(List<$modelName> data) => '
        'json.encode(List<dynamic>.from(data.map((x) => x.toJson())));\n\n');

    modelClass.writeln('class $modelName {\n');

    // Loop through the keys of the JSON object
    Map<String, String> nestedModels = {};
    Map<String, dynamic> modelFromJsonMap = {};
    Map<String, dynamic> toJsonMap = {};

    json.forEach((key, value) {
      // Check the type of the value
      if (value is Map<String, dynamic>) {
        // If it's a nested object, recursively generate the model for it
        String nestedModelName = '${_capitalize(key)}';
        String nestedModelString =
            generateModelFromJson(value, nestedModelName);

        // Add the nested model to the class string
        nestedModels[nestedModelName] = nestedModelString;

        // Add the field to the main model class
        modelClass.writeln('  $nestedModelName $key;');
        modelFromJsonMap[key] = '$nestedModelName.fromJson(json[\'$key\'])';
        toJsonMap[key] = '$key.toJson()';
      } else if (value is List<dynamic>) {
        // If it's a list, check if it contains nested objects
        if (value.isNotEmpty && value.first is Map<String, dynamic>) {
          // If the list contains nested objects, generate models for each item
          String listModelName = '${_capitalize(key)}Item';
          String listModelString =
              generateModelFromJson(value.first, listModelName);

          // Add the nested list model to the class string
          nestedModels[listModelName] = listModelString;

          // Add the field to the main model class
          modelClass.writeln('  List<$listModelName> $key;');
          modelFromJsonMap[key] =
              'List<dynamic>.from(json[\'$key\'].map((x) => $listModelName.fromJson(x)))';
          toJsonMap[key] = 'List<dynamic>.from($key.map((x) => x.toJson()))';
        } else {
          // Otherwise, keep the list as is
          String listType = _getListType(value);
          modelClass.writeln('  List<$listType> $key;');
          modelFromJsonMap[key] = _getListParsingLogic(listType, key);
          toJsonMap[key] = '$key';
        }
      } else {
        // Otherwise, keep the value as is
        modelClass.writeln('  ${_getType(value)} $key;');
        modelFromJsonMap[key] = 'json[\'$key\']';
        toJsonMap[key] = '$key';
      }
    });

    // Constructor
    modelClass.writeln('  $modelName({');
    json.forEach((key, value) {
      String type = _getType(value);
      modelClass.writeln('    required this.$key,');
    });
    modelClass.writeln('  });\n');

    // Close the class string
    modelClass.writeln();

    // Generate fromJson method
    modelClass.writeln('  $modelName.fromJson(Map<String, dynamic> json) {');
    modelFromJsonMap.forEach((key, value) {
      modelClass.writeln('    $key = $value;');
    });
    modelClass.writeln('  }\n');

    // Generate toJson method
    modelClass.writeln('  Map<String, dynamic> toJson() => {');
    toJsonMap.forEach((key, value) {
      modelClass.writeln('    \'$key\': $value,');
    });
    modelClass.writeln('  };');

    // Close the class string
    modelClass.writeln('}\n');

    // Add nested models to the final class string
    nestedModels.forEach((name, definition) {
      modelClass.write(definition);
    });

    // Return the generated model class string
    return modelClass.toString();
  }

/*
  static dynamic generateModelFromJson(
      Map<String, dynamic> json, String modelName) {
    if (json == null ||
        json.isEmpty ||
        modelName == null ||
        modelName.isEmpty) {
      return null;
    }

    // Start building the model class string
    StringBuffer modelClass =
        StringBuffer('class ${capitalize(modelName)} {\n');

    // Loop through the keys of the JSON object
    Map<String, String> nestedModels =
        {}; // Store nested models to be defined later
    Map<String, dynamic> modelFromJsonMap =
        {}; // Store modelFromJson method parameters
    Map<String, dynamic> toJsonMap = {}; // Store toJson method parameters
    json.forEach((key, value) {
      // Check the type of the value
      if (value is Map<String, dynamic>) {
        // If it's a nested object, recursively generate the model for it
        String nestedModelName = '${_capitalize(key)}';
        String nestedModelString =
            generateModelFromJson(value, nestedModelName);

        // Add the nested model to the class string
        nestedModels[nestedModelName] = nestedModelString;

        // Add the field to the main model class
        modelClass.writeln('  $nestedModelName $key;');
        modelFromJsonMap[key] = '$nestedModelName.fromJson(json[\'$key\'])';
        toJsonMap[key] = '$key.toJson()';
      } else if (value is List<dynamic>) {
        // If it's a list, check if it contains nested objects
        if (value.isNotEmpty && value.first is Map<String, dynamic>) {
          // If the list contains nested objects, generate models for each item
          String listModelName = '${_capitalize(key)}Item';
          String listModelString =
              generateModelFromJson(value.first, listModelName);

          // Add the nested list model to the class string
          nestedModels[listModelName] = listModelString;

          // Add the field to the main model class
          modelClass.writeln('  List<$listModelName> $key;');
          modelFromJsonMap[key] =
              'List<dynamic>.from(json[\'$key\'].map((x) => $listModelName.fromJson(x)))';
          toJsonMap[key] = 'List<dynamic>.from($key.map((x) => x.toJson()))';
        } else {
          // Otherwise, keep the list as is
          String listType = _getListType(value);
          modelClass.writeln('  List<$listType> $key;');
          modelFromJsonMap[key] = _getListParsingLogic(listType, key);
          toJsonMap[key] = '$key';
        }
      } else {
        // Otherwise, keep the value as is
        modelClass.writeln('  ${_getType(value)} $key;');
        modelFromJsonMap[key] = 'json[\'$key\']';
        toJsonMap[key] = '$key';
      }
    });

    // Close the class string
    modelClass.writeln();

    // Generate fromJson method
    modelClass.writeln('  $modelName.fromJson(Map<String, dynamic> json) {');
    modelFromJsonMap.forEach((key, value) {
      modelClass.writeln('    $key = $value;');
    });
    modelClass.writeln('  }\n');

    // Generate toJson method
    modelClass.writeln('  Map<String, dynamic> toJson() => {');
    toJsonMap.forEach((key, value) {
      modelClass.writeln('    \'$key\': $value,');
    });
    modelClass.writeln('  };');

    // Close the class string
    modelClass.writeln('}\n');

    // Add nested models to the final class string
    nestedModels.forEach((name, definition) {
      modelClass.write(definition);
    });

    // Return the generated model class string
    return modelClass.toString();
  }

*/
  // Helper function to capitalize the first letter of a string
  static String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  // Helper function to get the type name from a value
  static String _getType(dynamic value) {
    if (value is String) {
      return 'String';
    } else if (value is int) {
      return 'int';
    } else if (value is double) {
      return 'double';
    } else if (value is bool) {
      return 'bool';
    } else {
      return 'dynamic';
    }
  }

  // Helper function to get the list type
  static String _getListType(List<dynamic> list) {
    // Check the type of the first element in the list
    dynamic firstElement = list.first;
    if (firstElement is String) {
      return 'String';
    } else if (firstElement is int) {
      return 'int';
    } else if (firstElement is double) {
      return 'double';
    } else if (firstElement is Map<String, dynamic>) {
      return '${_capitalize(list[0].keys.first)}Item';
    } else {
      return 'dynamic';
    }
  }

  // Helper function to get the parsing logic for list elements
  static String _getListParsingLogic(String listType, String key) {
    if (listType == 'String') {
      return 'List<String>.from(json[\'$key\'].map((x) => x.toString()))';
    } else if (listType == 'int') {
      return 'List<int>.from(json[\'$key\'].map((x) => x.toInt()))';
    } else if (listType == 'double') {
      return 'List<double>.from(json[\'$key\'].map((x) => x.toDouble()))';
    } else {
      return 'List<dynamic>.from(json[\'$key\'].map((x) => ${_capitalize(listType)}.fromJson(x)))';
    }
  }
}

Future<void> CreateModel(List<String> arguments) async {
  String projectPath = Directory.current.path;
  String argument = arguments[1];
  String typeCommande = argument.split("=")[0];
  String url = argument.split("=")[1];

  stdout.write('Enter model name: ');
  String? modelName = stdin.readLineSync();

  if (typeCommande == "url") {
    var model = await ModelGenerator.generateModelFromUrl(url, modelName!);

    createFile('$projectPath/lib/app/model/$modelName.dart', model);
  } else if (typeCommande == "file") {
    var model = await ModelGenerator.generateModelFromFile(
        projectPath + "/lib/app/data/" + url, modelName!);

    createFile('$projectPath/lib/app/model/$modelName.dart', model);
  }
}
