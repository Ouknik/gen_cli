import 'dart:convert';
import 'dart:io';

void main() {
  String projectPath = Directory.current.path;
  final jsonString = '''
    {
        "name": "John Doe",
        "age": 30,
        "height": 6.0,
        "isMarried": false,
        "friends": ["Alice", "Bob", "Charlie"],
        "address": {"city": "New York", "zipcode": 12345}
    }
  ''';

  final resultByRadarModel =
      generateModelFromJson('ResultByRadarModel', jsonString);

  createFile(
      '$projectPath//lib/app/model/person_model.dart', resultByRadarModel);

  print(resultByRadarModel);
}

String generateModelFromJson(String className, String jsonString) {
  final dynamic json = jsonDecode(jsonString);
  final StringBuffer buffer = StringBuffer();

  buffer.writeln(
      '// To parse this JSON data, do\n//\n//     final resultByRadarModel = resultByRadarModelFromJson(jsonString);\n\nimport \'dart:convert\';\n\n${generateClassFromJson(className, json)}');

  return buffer.toString();
}

String generateClassFromJson(String className, dynamic json) {
  final StringBuffer buffer = StringBuffer();

  buffer.writeln('class $className {');
  buffer.writeln(generateFieldsFromJson(json));
  buffer.writeln(generateConstructorFromJson(className, json));
  buffer.writeln(generateFromJson(className, json));
  buffer.writeln('}');

  return buffer.toString();
}

String generateFieldsFromJson(dynamic json) {
  final StringBuffer buffer = StringBuffer();

  json.forEach((key, value) {
    if (value is bool) {
      buffer.writeln('  final bool $key;');
    } else if (value is String) {
      buffer.writeln('  final String $key;');
    } else if (value is num) {
      if (value is int) {
        buffer.writeln('  final int $key;');
      } else if (value is double) {
        buffer.writeln('  final double $key;');
      }
    } else if (value is List) {
      if (value.isNotEmpty && value.first is String) {
        buffer.writeln('  final List<String> $key;');
      }
    } else if (value is Map) {
      final typeName = key[0].toUpperCase() + key.substring(1);
      buffer.writeln('  final $typeName $key;');
    }
  });

  return buffer.toString();
}

String generateConstructorFromJson(String className, dynamic json) {
  final StringBuffer buffer = StringBuffer();

  buffer.writeln('\n  $className({');
  json.forEach((key, value) {
    buffer.writeln('    this.$key,');
  });
  buffer.writeln('  });');

  return buffer.toString();
}

String generateFromJson(String className, dynamic json) {
  final StringBuffer buffer = StringBuffer();

  buffer
      .writeln('\n  factory $className.fromJson(Map<String, dynamic> json) {');
  buffer.writeln('    return $className(');
  json.forEach((key, value) {
    if (value is List) {
      if (value.isNotEmpty && value.first is String) {
        buffer.writeln('      $key: List<String>.from(json[\'$key\']),');
      }
    } else if (value is Map) {
      final typeName = key[0].toUpperCase() + key.substring(1);
      buffer.writeln('      $key: $typeName.fromJson(json[\'$key\']),');
    } else {
      buffer.writeln('      $key: json[\'$key\'],');
    }
  });
  buffer.writeln('    );');
  buffer.writeln('  }');

  return buffer.toString();
}

void createFile(String path, String content) {
  File file = File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(content);
}s
