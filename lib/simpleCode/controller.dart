import '../function.dart';

String ControllersContent({required String controllerName}) => '''
import 'package:get/get.dart';

class ${capitalize(controllerName)}Controller extends GetxController {
  // Add your controller logic here
}
''';
