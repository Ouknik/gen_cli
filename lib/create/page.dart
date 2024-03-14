import 'dart:io';

import '../simpleCode/controller.dart';
import '../simpleCode/provider.dart';
import '../simpleCode/view.dart';
import '../function.dart';

void CreatePage(List<String> arguments) {
  // Get the directory of the script being run
  String projectPath = Directory.current.path;

  if (arguments.length < 1) {
    print('Usage:gen page <page_name>');
    return;
  }

  String pageName = arguments[0];

  // Run 'flutter create module' command to create page within the project
  Process.runSync('flutter', [
    'create',
    'module',
    '--template=module',
    '--no-pub',
    '--org',
    'com.example',
    '--project-name',
    'testproject',
    '--pub',
    '--no-analytics',
    '$projectPath/lib/app/modules/$pageName'
  ]);

  // Create the necessary folders
  String moduleFolderPath = '$projectPath/lib/app/modules/$pageName';
  createFolder(moduleFolderPath);

  // Fill bindings file
  String bindingsContent = '''
import 'package:get/get.dart';
import '../controllers/${pageName}_controller.dart';

class ${capitalize(pageName)}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${capitalize(pageName)}Controller>(
      () => ${capitalize(pageName)}Controller(),
    );
  }
}''';
  createFile(
      '$moduleFolderPath/bindings/${pageName}_binding.dart', bindingsContent);

  // Fill controllers file

  createFile('$moduleFolderPath/controllers/${pageName}_controller.dart',
      ControllersContent(controllerName: pageName));

  createFile('$moduleFolderPath/providers/${pageName}_provider.dart',
      ProvidersContent(pageName: pageName));

  // Fill views file

  createFile('$moduleFolderPath/views/${pageName}_view.dart',
      ViewsContent(pageName: pageName, viewName: pageName));

  // Add import statement to app/pages/app_pages.dart
  String appPagesPath = '$projectPath/lib/app/routes/app_pages.dart';
  String appPagesContent = File(appPagesPath).readAsStringSync();
  appPagesContent = appPagesContent.replaceFirst('];', '''
    GetPage(
      name: _Paths.${capitalize(pageName).toUpperCase()},
      page: () => const ${capitalize(pageName)}View(),
      binding: ${capitalize(pageName)}Binding(),
    ),
  ];
''');
  createFile(appPagesPath, appPagesContent);

  String appPagesimport = File(appPagesPath).readAsStringSync();

  appPagesimport = appPagesimport.replaceFirst('//add-import', '''
//add-import
import '../modules/$pageName/views/${pageName}_view.dart';
    
import '../modules/$pageName/bindings/${pageName}_binding.dart';
''');

  createFile(appPagesPath, appPagesimport);

  // Add route to app/routes/app_routes.dart
  String appRoutesPath = '$projectPath/lib/app/routes/app_routes.dart';
  String appRoutesContent = File(appRoutesPath).readAsStringSync();
  appRoutesContent = appRoutesContent.replaceFirst('/*Routes*/', '''
static const ${capitalize(pageName).toUpperCase()} = _Paths.${capitalize(pageName).toUpperCase()} 
/*Routes*/}
''');
  createFile(appRoutesPath, appRoutesContent);

  String appPathContent = File(appRoutesPath).readAsStringSync();

  appPathContent = appPathContent.replaceFirst('/*_Paths*/}', '''
static const ${capitalize(pageName).toUpperCase()} = '/${capitalize(pageName).toLowerCase()}' 
/*_Paths*/
''');
  createFile(appRoutesPath, appPathContent);

  print("......................");
  print('Page $pageName created within the project');
  print("......................");
}
