import 'function.dart';
import 'create/project.dart';
import 'create/page.dart';
import 'create/view.dart';
import 'create/controller.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart main.dart <command>');
    return;
  }

  // Split the command by ':' to extract page name if provided
  List<String> commandParts = arguments[0].split(':');
  String command = commandParts[0];
  String? pageName;

  if (commandParts.length > 1) {
    pageName = commandParts[1];
  }

  switch (command) {
    case 'project':
      // Run create_project.dart for project creation
      String projectPath = CreateProject();
      print("----------------------");
      print(projectPath);
      print("----------------------");
      getAllLibrary(projectPath: projectPath);
      break;
    case 'page':
      if (pageName != null) {
        // Run create_page.dart with the specified page name
        CreatePage([pageName]); // Pass page name as an argument
      } else {
        print('Invalid command. Usage: dart main.dart page:<page_name>');
      }
      break;

    case 'view':
      CreateView(arguments);
      break;

    case 'controller':
      CreateController(arguments);
      break;

    default:
      print('Invalid command. Usage: dart main.dart <command>');
  }
}
