import 'dart:io';

/// PUBLIC_INTERFACE
/// CI entry script that must be executed from the Flutter project root
/// (the directory containing pubspec.yaml). It verifies the root, then
/// runs `flutter pub get`, `flutter analyze`, and `flutter test --coverage`.
Future<void> main(List<String> args) async {
  final root = Directory.current;
  final pubspec = File('pubspec.yaml');
  stdout.writeln('CI: current dir -> ${root.path}');
  if (!pubspec.existsSync()) {
    stderr.writeln('CI ERROR: pubspec.yaml not found. '
        'Run this script from personal-notes-organizer-180681-180703/notes_frontend');
    exit(2);
  }

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
