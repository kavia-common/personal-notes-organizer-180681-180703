import 'dart:io';

/// PUBLIC_INTERFACE
/// Verifies this is the Flutter project root by checking for pubspec.yaml.
/// Prints the absolute path and exits with a non-zero code if not found.
void main(List<String> args) {
  final dir = Directory.current;
  final pubspec = File('pubspec.yaml');
  stdout.writeln('verify_root: current dir -> ${dir.path}');
  if (!pubspec.existsSync()) {
    stderr.writeln('verify_root: pubspec.yaml not found in ${dir.path}');
    exit(2);
  }
  stdout.writeln('verify_root: pubspec.yaml found. OK.');
}
