import 'dart:io';

/// PUBLIC_INTERFACE
/// Repository-root CI runner that changes directory into the Flutter app
/// and executes: flutter --version, flutter pub get, flutter analyze, flutter test --coverage.
Future<void> main(List<String> args) async {
  final appDir = Directory('personal-notes-organizer-180681-180703/notes_frontend');
  if (!appDir.existsSync()) {
    stderr.writeln('CI ERROR: Flutter app directory not found at ${appDir.path}');
    exit(2);
  }
  Directory.current = appDir.path;
  stdout.writeln('CI: switched to ${Directory.current}');

  Future<void> run(String cmd, List<String> arguments) async {
    stdout.writeln('CI: Running $cmd ${arguments.join(' ')}');
    final proc = await Process.start(cmd, arguments, runInShell: true);
    await stdout.addStream(proc.stdout);
    await stderr.addStream(proc.stderr);
    final code = await proc.exitCode;
    if (code != 0) {
      stderr.writeln('CI ERROR: Command failed: $cmd ${arguments.join(' ')} (exit $code)');
      exit(code);
    }
  }

  await run('flutter', ['--version']);
  await run('flutter', ['pub', 'get']);
  await run('flutter', ['analyze']);
  await run('flutter', ['test', '--coverage']);

  stdout.writeln('CI: All steps completed successfully.');
}
