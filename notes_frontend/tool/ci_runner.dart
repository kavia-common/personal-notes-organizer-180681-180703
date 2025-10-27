/// CI runner to ensure commands execute from the Flutter app directory.
/// Supports: pub_get, analyze, test, all
///
/// Usage from repo root:
///   dart personal-notes-organizer-180681-180703/notes_frontend/tool/ci_runner.dart all
///
/// This ensures 'flutter' commands run with the correct working directory so
/// project root detection succeeds even if CI starts from a different CWD.
import 'dart:io';

Future<int> _run(String cmd, List<String> args) async {
  final proc = await Process.start(
    cmd,
    args,
    workingDirectory: Directory.current.path,
    runInShell: true,
  );
  stdout.addStream(proc.stdout);
  stderr.addStream(proc.stderr);
  return proc.exitCode;
}

Future<void> main(List<String> args) async {
  final String appDir = Directory.current.path;
  // Verify we're in the correct place: this file should live in tool/, so app root is up a level.
  final pubspec = File('${appDir}/pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('Error: pubspec.yaml not found. Run this script from the app directory.');
    exit(2);
  }

  final String command = args.isNotEmpty ? args.first : 'all';

  int code = 0;
  switch (command) {
    case 'pub_get':
      code = await _run('flutter', ['pub', 'get']);
      break;
    case 'analyze':
      code = await _run('flutter', ['analyze']);
      break;
    case 'test':
      // Ensure pub get ran first to avoid cache issues in CI
      code = await _run('flutter', ['pub', 'get']);
      if (code == 0) {
        code = await _run('flutter', ['test']);
      }
      break;
    case 'all':
      code = await _run('flutter', ['pub', 'get']);
      if (code == 0) code = await _run('flutter', ['analyze']);
      if (code == 0) code = await _run('flutter', ['test']);
      break;
    default:
      stderr.writeln('Usage: dart tool/ci_runner.dart {pub_get|analyze|test|all}');
      exit(2);
  }

  if (code != 0) {
    exit(code);
  }
}
