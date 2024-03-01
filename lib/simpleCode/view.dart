// Fill views file

import '../function.dart';

String ViewsContent({required String pageName, required String viewName}) => '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/${pageName}_controller.dart';

class ${capitalize(viewName)}View extends GetView<${capitalize(pageName)}Controller> {
  const ${capitalize(viewName)}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${capitalize(viewName)}View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${capitalize(viewName)}View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
''';
