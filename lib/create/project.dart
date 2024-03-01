import 'dart:io';

String CreateProject() {
  String projectPath = Directory.current.path;
  String scriptPath = File(Platform.script.toFilePath()).parent.path;

  stdout.write('Enter project name: ');
  String? projectName = stdin.readLineSync();

  stdout.write('Enter package name for the new project: ');
  String? packageName = stdin.readLineSync();

  if (packageName!.isNotEmpty && projectName!.isNotEmpty) {
    // Run the 'flutter create' command with the provided package name
    Process.runSync('flutter', [
      'create',
      '--no-pub',
      '-i',
      'swift',
      '-a',
      'kotlin',
      '--org',
      packageName,
      '$projectPath/$projectName'
    ]);

    // Copy the existing lib folder to the newly created project
    Directory existingLibDir = Directory('$scriptPath/lib');

    Directory newLibDir = Directory('$projectPath/$projectName/lib');
    if (existingLibDir.existsSync()) {
      copyDirectory(existingLibDir, newLibDir);
    } else {
      print('Existing lib folder not found');
    }

    print('New project created with package name: $packageName');
  } else {
    print('Invalid package name or project name');
  }

  return "$projectPath/$projectName";
}

void copyDirectory(Directory source, Directory destination) {
  source.listSync(recursive: false).forEach((FileSystemEntity entity) {
    if (entity is File) {
      File newFile = File('${destination.path}/${entity.path.split('/').last}');
      newFile.writeAsBytesSync(File(entity.path).readAsBytesSync());
    } else if (entity is Directory) {
      Directory subDirectory =
          Directory('${destination.path}/${entity.path.split('/').last}');
      subDirectory.createSync();
      copyDirectory(entity.absolute, subDirectory);
    }
  });
}
