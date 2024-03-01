import 'dart:io';

import '../simpleCode/controller.dart';
import '../function.dart';

void CreateController(List<String> arguments) {
  // Get the directory of the script being run

  String projectPath = Directory.current.path;

  String controllerName = arguments[1].split(":")[0];
  String pageName = arguments[1].split(":")[1];

  createFile(
      '$projectPath/lib/app/modules/$pageName/controllers/${controllerName}_controller.dart',
      ControllersContent(controllerName: pageName));

  print("The ${controllerName}_controller page has been created successfully");
}
