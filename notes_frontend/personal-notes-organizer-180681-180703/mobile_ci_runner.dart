import 'dart:io';

Future<int> run(String cmd, List<String> args, {String? cwd}) async {
  final proc = await Process.start(
    cmd,
    args,
    workingDirectory: cwd,
    runInShell: true,
  );
  stdout.addStream(proc.stdout);
  stderr.addStream(proc.stderr);
  return await proc.exitCode;
}

Future<void> main(List<String> args) async {
  final String appDir = 'personal-notes-organizer-180681-180703/notes_frontend';
  if (!File('$appDir/pubspec.yaml').existsSync()) {
    stderr.writeln('Error: $appDir/pubspec.yaml not found. Is the workspace layout correct?');
    exit(2);
  }

  final String action = args.isNotEmpty ? args.first : 'all';
  int code = 0;

  switch (action) {
    case 'pub_get':
      code = await run('flutter', ['pub', 'get'], cwd: appDir);
      break;
    case 'analyze':
      code = await run('flutter', ['pub', 'get'], cwd: appDir);
      if (code == 0) code = await run('flutter', ['analyze'], cwd: appDir);
      break;
    case 'test':
      code = await run('flutter', ['pub', 'get'], cwd: appDir);
      if (code == 0) code = await run('flutter', ['test'], cwd: appDir);
      break;
    case 'all':
    default:
      code = await run('flutter', ['pub', 'get'], cwd: appDir);
      if (code == 0) code = await run('flutter', ['analyze'], cwd: appDir);
      if (code == 0) code = await run('flutter', ['test'], cwd: appDir);
      break;
  }

  exit(code);
}
