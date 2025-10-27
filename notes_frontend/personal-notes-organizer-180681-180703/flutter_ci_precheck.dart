import 'dart:io';

/// PUBLIC_INTERFACE
/// Prints Flutter version (if available) and reminds CI to change to the app directory.
/// This does not modify code; it's purely diagnostic for pipelines.
Future<void> main(List<String> args) async {
  stdout.writeln('Flutter CI Precheck');
  stdout.writeln('Expected Flutter project root: personal-notes-organizer-180681-180703/notes_frontend');

  try {
    final proc = await Process.start('flutter', ['--version'], runInShell: true);
    await stdout.addStream(proc.stdout);
    await stderr.addStream(proc.stderr);
    final code = await proc.exitCode;
    if (code != 0) {
      stderr.writeln('Warning: flutter --version returned non-zero code: $code');
    }
  } catch (e) {
    stderr.writeln('Warning: Failed to execute flutter --version: $e');
  }

  final pubspecAtRoot = File('pubspec.yaml').existsSync();
  final pubspecInApp = File('personal-notes-organizer-180681-180703/notes_frontend/pubspec.yaml').existsSync();

  stdout.writeln('pubspec.yaml at repository root: $pubspecAtRoot');
  stdout.writeln('pubspec.yaml at app path: $pubspecInApp');
  if (!pubspecInApp) {
    stderr.writeln('ERROR: Missing app pubspec at expected path.');
    exit(2);
  }

  stdout.writeln('Precheck complete. CI must cd into personal-notes-organizer-180681-180703/notes_frontend before running flutter commands.');
}
