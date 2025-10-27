import 'dart:io';

/// PUBLIC_INTERFACE
/// Prints instructions for running CI from the correct Flutter project directory and verifies pubspec.yaml presence.
void main(List<String> args) {
  stdout.writeln('Flutter CI Help');
  stdout.writeln('Project root: personal-notes-organizer-180681-180703/notes_frontend');
  stdout.writeln('Run from this directory:');
  stdout.writeln('  flutter pub get');
  stdout.writeln('  flutter analyze');
  stdout.writeln('  flutter test --coverage');
  final exists = File('pubspec.yaml').existsSync();
  stdout.writeln('pubspec.yaml present here: $exists');
  if (!exists) {
    exitCode = 2;
  }
}
