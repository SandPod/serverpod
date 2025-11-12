import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

({String projectName, String commandRoot}) createRandomProjectName(
  final String root,
) {
  final projectName = 'test_${const Uuid().v4().replaceAll('-', '_').toLowerCase()}';
  final commandRoot = path.join(root, projectName, '${projectName}_server');

  return (projectName: projectName, commandRoot: commandRoot);
}

({String serverDir, String flutterDir, String clientDir})
createProjectFolderPaths(final String projectName) {
  final serverDir = path.join(projectName, '${projectName}_server');
  final flutterDir = path.join(projectName, '${projectName}_flutter');
  final clientDir = path.join(projectName, '${projectName}_client');

  return (serverDir: serverDir, flutterDir: flutterDir, clientDir: clientDir);
}

String createServerFolderPath(final String projectName) {
  return path.join(projectName, '${projectName}_server');
}

Future<bool> isNetworkPortAvailable(final int port) async {
  try {
    final socket = await ServerSocket.bind(InternetAddress.anyIPv4, port);
    await socket.close();
    return true;
  } catch (e) {
    return false;
  }
}

Future<ProcessResult> runProcess(
  final String command,
  final List<String> arguments, {
  final String? workingDirectory,
  final Map<String, String>? environment,
  final bool skipBatExtentionOnWindows = false,
}) async {
  final process = await Process.run(
    _getCommandToRun(command, skipBatExtentionOnWindows),
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
  );

  print('COMMAND "$command" stdout: ${process.stdout}');
  print('COMMAND "$command" stderr: ${process.stderr}');

  return process;
}

Future<Process> startProcess(
  final String command,
  final List<String> arguments, {
  final String? workingDirectory,
  final Map<String, String>? environment,
  final bool ignorePlatform = false,
}) async {
  final process = await Process.start(
    _getCommandToRun(command, ignorePlatform),
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
  );

  process.stderr
      .transform(utf8.decoder)
      .listen((final e) => print('COMMAND "$command" stderr: $e'));
  process.stdout
      .transform(utf8.decoder)
      .listen((final e) => print('COMMAND "$command" stdout: $e'));

  return process;
}

String _getCommandToRun(final String command, final bool ignorePlatform) {
  if (ignorePlatform) {
    return command;
  }

  return Platform.isWindows ? '$command.bat' : command;
}
