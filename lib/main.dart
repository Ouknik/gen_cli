import 'create/generet_model.dart';
import 'function.dart';
import 'create/project.dart';
import 'create/page.dart';
import 'create/view.dart';
import 'create/controller.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage:gen <command>');
    return;
  }

  List<String> commandParts = arguments[0].split(':');
  String command = commandParts[0];
  String? pageName;

  if (commandParts.length > 1) {
    pageName = commandParts[1];
  }

  switch (command) {
    case 'project':
      String projectPath = CreateProject();
      print("----------------------");
      print(projectPath);
      print("----------------------");
      getAllLibrary(projectPath: projectPath);
      break;
    case 'page':
      if (pageName != null) {
        CreatePage([pageName]);
      } else {
        print('Invalid command. Usage: gen page:<page_name>');
      }
      break;

    case 'view':
      CreateView(arguments);
      break;

    case 'controller':
      CreateController(arguments);
      break;

    case 'model':
      CreateModel(arguments);
      break;

    default:
      print('Invalid command. Usage: gen <command>');
  }
}
