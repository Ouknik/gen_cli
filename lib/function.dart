import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

void createFolder(String path) {
  Directory directory = Directory(path);
  directory.createSync(recursive: true);
}

void createFile(String path, String content) {
  File file = File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(content);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

///***********************************************************
///

void getAllLibrary({required String projectPath}) {
  // List of libraries to add
  List<String> libraries = [
    "get",
    "cached_network_image",
    "shimmer",
    "flutter_screenutil",
    "http",
    "flutter_launcher_icons",
    "connectivity_plus",
    "hive",
    "hive_flutter"
  ];

  print("..library..");
  // Execute 'flutter pub add' command for each library
  libraries.forEach((library) {
    print("flutter pub add $library");
    Process.runSync('flutter', ['pub', 'add', library],
        workingDirectory: projectPath);
  });
  print(".........");
}

String removeComments(String code) {
  // Define a regular expression pattern to match lines starting with "#"
  RegExp commentPattern = RegExp(r'^\s*#.*$', multiLine: true);

  // Remove lines that match the pattern
  String cleanedCode = code.replaceAll(commentPattern, '');

  // Remove extra spaces and blank lines between non-comment lines
  cleanedCode = cleanedCode
      .split('\n')
      .where((line) => line.trim().isNotEmpty)
      .join('\n')
      .trim();

  return cleanedCode;
}
