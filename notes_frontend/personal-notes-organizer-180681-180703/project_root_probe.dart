import 'dart:io';

/// PUBLIC_INTERFACE
/// Prints the absolute path to the Flutter app directory and exits 0 if found.
/// CI can run:
///   dart personal-notes-organizer-180681-180703/project_root_probe.dart
/// Then cd into the printed path before running `flutter` commands.
void main() {
  final appDir = Directory('personal-notes-organizer-180681-180703/notes_frontend');
  final pubspec = File('${appDir.path}/pubspec.yaml');
  final mainDart = File('${appDir.path}/lib/main.dart');

  if (appDir.existsSync() && pubspec.existsSync() && mainDart.existsSync()) {
    // Print absolute path for unambiguous cd in CI.
    print(appDir.absolute.path);
    exit(0);
  } else {
    stderr.writeln('Flutter app not found. Expected at ${appDir.path}');
    exit(2);
  }
}
