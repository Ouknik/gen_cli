import 'dart:io';

import '../simpleCode/view.dart';
import '../function.dart';

void CreateView(List<String> arguments) {
  // Get the directory of the script being run

  String projectPath = Directory.current.path;

  String viewName = arguments[1].split(":")[0];
  String pageName = arguments[1].split(":")[1];

  createFile(
      '$projectPath/lib/app/modules/$pageName/views/${viewName}_view.dart',
      ViewsContent(pageName: pageName, viewName: viewName));

  print("The ${viewName}_view page has been created successfully");
}
