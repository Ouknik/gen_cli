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

  // Add import statement to app/pages/app_pages.dart
  String appPagesPath = '$projectPath/lib/app/routes/app_pages.dart';
  String appPagesContent = File(appPagesPath).readAsStringSync();
  appPagesContent = appPagesContent.replaceFirst('];', '''
    GetPage(
      name: _Paths.${capitalize(pageName).toUpperCase()},
      page: () => const ${capitalize(viewName)}View(),
      binding: ${capitalize(pageName)}Binding(),
    ),
  ];
''');


  appPagesContent = appPagesContent.replaceFirst('//add-import', '''
//add-import
import '../modules/$pageName/views/${viewName}_view.dart';
''');

  createFile(appPagesPath, appPagesContent);


 // Add route to app/routes/app_routes.dart
  String appRoutesPath = '$projectPath/lib/app/routes/app_routes.dart';
  String appRoutesContent = File(appRoutesPath).readAsStringSync();
  appRoutesContent = appRoutesContent.replaceFirst('/*Routes*/', '''
static const ${capitalize(viewName).toUpperCase()} = _Paths.${capitalize(viewName).toUpperCase()} ;
/*Routes*/
''');
  //createFile(appRoutesPath, appRoutesContent);

  //String appPathContent = File(appRoutesPath).readAsStringSync();

  appRoutesContent = appRoutesContent.replaceFirst('/*_Paths*/', '''
static const ${capitalize(viewName).toUpperCase()} = '/${capitalize(viewName).toLowerCase()}' ;
/*_Paths*/
''');

  createFile(appRoutesPath, appRoutesContent);


  print("The ${viewName}_view page has been created successfully");
}
